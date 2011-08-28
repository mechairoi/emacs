#include <config.h>
#include <stdio.h>
#include <limits.h>		/* For CHAR_BIT.  */
#include <sys/time.h>
#include <signal.h>
#include <setjmp.h>
#include <unistd.h>

#ifdef STDC_HEADERS
#include <stddef.h>		/* For offsetof, used by PSEUDOVECSIZE. */
#endif

#undef HIDE_LISP_IMPLEMENTATION
#include "lisp.h"

struct backtrace
{
  struct backtrace *next;
  Lisp_Object *function;
  Lisp_Object *args;	/* Points to vector of args. */
  int nargs;		/* Length of vector.
			   If nargs is UNEVALLED, args points to slot holding
			   list of unevalled args */
  char evalargs;
  /* Nonzero means call value of debugger when done with this operation. */
  char debug_on_exit;
};

#define PROFILER_BACKTRACE_TABLE_SIZE 128

EMACS_INT profiler_interval = 100;

static int profile_out = -1;
static FILE* profile_out_fp = NULL;
static struct profiler_backtrace_entry *profiler_backtrace_table[PROFILER_BACKTRACE_TABLE_SIZE];

struct profiler_backtrace_entry
{
  Lisp_Object *list;
  unsigned int count;
  struct profiler_backtrace_entry *next;
};

static int
profiler_backtrace_hash (Lisp_Object *list)
{
  register unsigned int h = 0;

  for (; !NILP (*list); list++)
    h ^= (unsigned int) *list;
  return h % PROFILER_BACKTRACE_TABLE_SIZE;
}

static int
profiler_backtrace_equal_p (Lisp_Object *alist,
			    Lisp_Object *blist)
{
  while (!NILP (*alist) || !NILP (*blist))
    {
      if (!EQ (*alist, *blist))
        return 0;
      alist++;
      blist++;
    }
  return 1;
}

static void
profiler_backtrace_print (struct profiler_backtrace_entry *entry)
{
  register Lisp_Object *list;

  for (list = entry->list; !NILP (*list); list++)
    {
      Fprin1 (*list, Qnil);
      write_string ("\n", -1);
    }
}

static void
profiler_handler (int signal, void *ctx)
{
  register struct backtrace *backlist;
  int length;

  /* Calculate backtrace depth first.  */
  for (backlist = backtrace_list, length = 0; backlist; backlist = backlist->next)
    if (!COMPILEDP (*backlist->function)) length++;
  if (!length) return;
  if (profile_out == -1) return;
  if (write (profile_out, &length, sizeof (int)) == -1)
    {
      /* TODO */
      return;
    }
  for (backlist = backtrace_list; backlist; backlist = backlist->next) {
    if (COMPILEDP (*backlist->function))
      {
	/* TODO */
      }
    else if (write (profile_out, backlist->function, sizeof (Lisp_Object)) == -1)
      {
	/* TODO */
	return;
      }
  }
}

void
profiler_block (void)
{
  sigset_t sigset_prof;

  sigemptyset (&sigset_prof);
  sigaddset (&sigset_prof, SIGPROF);
  sigprocmask (SIG_BLOCK, &sigset_prof, NULL);
}

void
profiler_unblock (void)
{
  sigset_t sigset_prof;

  sigemptyset (&sigset_prof);
  sigaddset (&sigset_prof, SIGPROF);
  sigprocmask (SIG_UNBLOCK, &sigset_prof, NULL);
}

void
profiler_read_data (void)
{
  register struct backtrace *backlist, *prev_backlist;
  register int i;
  int length, hash;
  struct profiler_backtrace_entry *entry, *slot, *prev;
  sigset_t sigset_prof;
  Lisp_Object *funcs;
  prev_backlist = NULL;

  if (profile_out == -1) return;
  lseek (profile_out, 0, SEEK_SET);
  while (read (profile_out, &length, sizeof (int)) == sizeof (int))
    {
      funcs = (Lisp_Object *) xmalloc ((length+1) * sizeof (Lisp_Object));
      if (!funcs) break;
      if (!length) continue;
      if (read (profile_out, funcs, sizeof (Lisp_Object) * length)
	  != sizeof (Lisp_Object) * length)
	{
	  xfree (funcs);
	  break;
	}
      funcs[length] = Qnil;

      /* Calculate hash code of the entry
	 and look up in the table.  */
      hash = profiler_backtrace_hash (funcs);
      for (slot = prev = profiler_backtrace_table[hash];
	   slot;
	   prev = slot, slot = slot->next)
	{
	  if (profiler_backtrace_equal_p (slot->list, funcs))
	    {
	      slot->count++;
	      xfree (funcs);
	      funcs = NULL;
	      break;
	    }
	}
      if(!funcs) continue;
      /* Make backtrace entry.  */
      entry = (struct profiler_backtrace_entry *)
	xmalloc (sizeof (struct profiler_backtrace_entry));
      if (!entry) break;
      entry->list = funcs;

      /* Not found. Register the entry to
	 the slot or the table.  */
      if (prev)
	prev->next = entry;
      else
	profiler_backtrace_table[hash] = entry;
      entry->count = 1;
      entry->next = NULL;
    }
  fclose (profile_out_fp);
  profile_out = -1;

  profile_out_fp = tmpfile ();
  if (profile_out_fp) profile_out = fileno (profile_out_fp);
}

DEFUN ("profiler-clear", Fprofiler_clear, Sprofiler_clear, 0, 0, "",
       doc: /* TODO */)
     ()
{
  register int i;

  if (profile_out_fp)
    {
      fclose (profile_out_fp);
      profile_out = -1;
    }
  for (i = 0; i < PROFILER_BACKTRACE_TABLE_SIZE; i++)
    {
      struct profiler_backtrace_entry *slot, *next;
      slot = profiler_backtrace_table[i];
      while (slot)
        {
          next = slot->next;
          xfree (slot->list);
          xfree (slot);
          slot = next;
        }
      profiler_backtrace_table[i] = NULL;
    }
}

DEFUN ("profiler-start", Fprofiler_start, Sprofiler_start, 0, 0, "",
       doc: /* TODO */)
     ()
{
  struct sigaction sa;
  struct itimerval timer;
  EMACS_INT interval;

  profiler_block ();
  Fprofiler_clear ();
  profile_out_fp = tmpfile ();
  if (profile_out_fp)
    profile_out = fileno (profile_out_fp);
  profiler_unblock ();
  if (!profile_out_fp) return Qnil;

  sa.sa_sigaction = profiler_handler;
  sa.sa_flags = SA_RESTART | SA_SIGINFO;
  sigemptyset (&sa.sa_mask);
  sigaction (SIGPROF, &sa, NULL);

  interval = sysconf (_SC_CLK_TCK);
  if (interval > profiler_interval)
    interval = profiler_interval;
  timer.it_interval.tv_sec = 0;
  timer.it_interval.tv_usec = 1000000 / interval;

  timer.it_value = timer.it_interval;
  setitimer (ITIMER_PROF, &timer, 0);

  return Qt;
}
     
DEFUN ("profiler-stop", Fprofiler_stop, Sprofiler_stop, 0, 0, "",
       doc: /* TODO */)
     ()
{
  setitimer (ITIMER_PROF, NULL, 0);
}

DEFUN ("profiler-data", Fprofiler_data, Sprofiler_data, 0, 0, 0,
       doc: /* TODO */)
     ()
{
  register int i;
  Lisp_Object data = Qnil;
  profiler_block ();
  profiler_read_data ();
  profiler_unblock ();
  for (i = 0; i < PROFILER_BACKTRACE_TABLE_SIZE; i++)
    {
      struct profiler_backtrace_entry *slot = profiler_backtrace_table[i];
      while (slot)
        {
          Lisp_Object backlist = Qnil;
          Lisp_Object *list = slot->list;
          for (; !NILP (*list); list++)
            backlist = Fcons (*list, backlist);
          data = Fcons (Fcons (backlist, make_number (slot->count)), data);
          slot = slot->next;
        }
    }
  return data;
}


void
syms_of_profiler ()
{
  DEFVAR_INT ("profiler-interval", &profiler_interval,
	      doc: /* */);
  
  defsubr (&Sprofiler_start);
  defsubr (&Sprofiler_stop);
  defsubr (&Sprofiler_clear);
  defsubr (&Sprofiler_data);
}
