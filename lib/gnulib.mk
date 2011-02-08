## DO NOT EDIT! GENERATED AUTOMATICALLY!
## Process this file with automake to produce Makefile.in.
# Copyright (C) 2002-2011 Free Software Foundation, Inc.
#
# This file is free software, distributed under the terms of the GNU
# General Public License.  As a special exception to the GNU General
# Public License, this file may be distributed as part of a program
# that contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# Generated by gnulib-tool.
# Reproduce by: gnulib-tool --import --dir=. --lib=libgnu --source-base=lib --m4-base=m4 --doc-base=doc --tests-base=tests --aux-dir=. --makefile-name=gnulib.mk --no-libtool --macro-prefix=gl --no-vc-files dtoastr getloadavg getopt-gnu ignore-value mktime strftime


MOSTLYCLEANFILES += core *.stackdump

noinst_LIBRARIES += libgnu.a

libgnu_a_SOURCES =
libgnu_a_LIBADD = $(gl_LIBOBJS)
libgnu_a_DEPENDENCIES = $(gl_LIBOBJS)
EXTRA_libgnu_a_SOURCES =

## begin gnulib module arg-nonnull

# The BUILT_SOURCES created by this Makefile snippet are not used via #include
# statements but through direct file reference. Therefore this snippet must be
# present in all Makefile.am that need it. This is ensured by the applicability
# 'all' defined above.

BUILT_SOURCES += arg-nonnull.h
# The arg-nonnull.h that gets inserted into generated .h files is the same as
# build-aux/arg-nonnull.h, except that it has the copyright header cut off.
arg-nonnull.h: $(top_srcdir)/./arg-nonnull.h
	$(AM_V_GEN)rm -f $@-t $@ && \
	sed -n -e '/GL_ARG_NONNULL/,$$p' \
	  < $(top_srcdir)/./arg-nonnull.h \
	  > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += arg-nonnull.h arg-nonnull.h-t

ARG_NONNULL_H=arg-nonnull.h

EXTRA_DIST += $(top_srcdir)/./arg-nonnull.h

## end   gnulib module arg-nonnull

## begin gnulib module c++defs

# The BUILT_SOURCES created by this Makefile snippet are not used via #include
# statements but through direct file reference. Therefore this snippet must be
# present in all Makefile.am that need it. This is ensured by the applicability
# 'all' defined above.

BUILT_SOURCES += c++defs.h
# The c++defs.h that gets inserted into generated .h files is the same as
# build-aux/c++defs.h, except that it has the copyright header cut off.
c++defs.h: $(top_srcdir)/./c++defs.h
	$(AM_V_GEN)rm -f $@-t $@ && \
	sed -n -e '/_GL_CXXDEFS/,$$p' \
	  < $(top_srcdir)/./c++defs.h \
	  > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += c++defs.h c++defs.h-t

CXXDEFS_H=c++defs.h

EXTRA_DIST += $(top_srcdir)/./c++defs.h

## end   gnulib module c++defs

## begin gnulib module dtoastr

libgnu_a_SOURCES += dtoastr.c

EXTRA_DIST += ftoastr.c ftoastr.h

EXTRA_libgnu_a_SOURCES += ftoastr.c

## end   gnulib module dtoastr

## begin gnulib module getloadavg


EXTRA_DIST += getloadavg.c

EXTRA_libgnu_a_SOURCES += getloadavg.c

## end   gnulib module getloadavg

## begin gnulib module getopt-posix

BUILT_SOURCES += $(GETOPT_H)

# We need the following in order to create <getopt.h> when the system
# doesn't have one that works with the given compiler.
getopt.h: getopt.in.h $(ARG_NONNULL_H)
	$(AM_V_GEN)rm -f $@-t $@ && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_GETOPT_H''@|$(HAVE_GETOPT_H)|g' \
	      -e 's|@''INCLUDE_NEXT''@|$(INCLUDE_NEXT)|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|@PRAGMA_SYSTEM_HEADER@|g' \
	      -e 's|@''PRAGMA_COLUMNS''@|@PRAGMA_COLUMNS@|g' \
	      -e 's|@''NEXT_GETOPT_H''@|$(NEXT_GETOPT_H)|g' \
	      -e '/definition of _GL_ARG_NONNULL/r $(ARG_NONNULL_H)' \
	      < $(srcdir)/getopt.in.h; \
	} > $@-t && \
	mv -f $@-t $@
MOSTLYCLEANFILES += getopt.h getopt.h-t

EXTRA_DIST += getopt.c getopt.in.h getopt1.c getopt_int.h

EXTRA_libgnu_a_SOURCES += getopt.c getopt1.c

## end   gnulib module getopt-posix

## begin gnulib module gettext-h

libgnu_a_SOURCES += gettext.h

## end   gnulib module gettext-h

## begin gnulib module ignore-value

libgnu_a_SOURCES += ignore-value.h

## end   gnulib module ignore-value

## begin gnulib module intprops


EXTRA_DIST += intprops.h

## end   gnulib module intprops

## begin gnulib module mktime


EXTRA_DIST += mktime-internal.h mktime.c

EXTRA_libgnu_a_SOURCES += mktime.c

## end   gnulib module mktime

## begin gnulib module stdbool

BUILT_SOURCES += $(STDBOOL_H)

# We need the following in order to create <stdbool.h> when the system
# doesn't have one that works.
stdbool.h: stdbool.in.h
	$(AM_V_GEN)rm -f $@-t $@ && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's/@''HAVE__BOOL''@/$(HAVE__BOOL)/g' < $(srcdir)/stdbool.in.h; \
	} > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += stdbool.h stdbool.h-t

EXTRA_DIST += stdbool.in.h

## end   gnulib module stdbool

## begin gnulib module stddef

BUILT_SOURCES += $(STDDEF_H)

# We need the following in order to create <stddef.h> when the system
# doesn't have one that works with the given compiler.
stddef.h: stddef.in.h
	$(AM_V_GEN)rm -f $@-t $@ && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|$(INCLUDE_NEXT)|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|@PRAGMA_SYSTEM_HEADER@|g' \
	      -e 's|@''PRAGMA_COLUMNS''@|@PRAGMA_COLUMNS@|g' \
	      -e 's|@''NEXT_STDDEF_H''@|$(NEXT_STDDEF_H)|g' \
	      -e 's|@''HAVE_WCHAR_T''@|$(HAVE_WCHAR_T)|g' \
	      -e 's|@''REPLACE_NULL''@|$(REPLACE_NULL)|g' \
	      < $(srcdir)/stddef.in.h; \
	} > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += stddef.h stddef.h-t

EXTRA_DIST += stddef.in.h

## end   gnulib module stddef

## begin gnulib module stdlib

BUILT_SOURCES += stdlib.h

# We need the following in order to create <stdlib.h> when the system
# doesn't have one that works with the given compiler.
stdlib.h: stdlib.in.h $(CXXDEFS_H) $(ARG_NONNULL_H) $(WARN_ON_USE_H)
	$(AM_V_GEN)rm -f $@-t $@ && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|$(INCLUDE_NEXT)|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|@PRAGMA_SYSTEM_HEADER@|g' \
	      -e 's|@''PRAGMA_COLUMNS''@|@PRAGMA_COLUMNS@|g' \
	      -e 's|@''NEXT_STDLIB_H''@|$(NEXT_STDLIB_H)|g' \
	      -e 's|@''GNULIB__EXIT''@|$(GNULIB__EXIT)|g' \
	      -e 's|@''GNULIB_ATOLL''@|$(GNULIB_ATOLL)|g' \
	      -e 's|@''GNULIB_CALLOC_POSIX''@|$(GNULIB_CALLOC_POSIX)|g' \
	      -e 's|@''GNULIB_CANONICALIZE_FILE_NAME''@|$(GNULIB_CANONICALIZE_FILE_NAME)|g' \
	      -e 's|@''GNULIB_GETLOADAVG''@|$(GNULIB_GETLOADAVG)|g' \
	      -e 's|@''GNULIB_GETSUBOPT''@|$(GNULIB_GETSUBOPT)|g' \
	      -e 's|@''GNULIB_GRANTPT''@|$(GNULIB_GRANTPT)|g' \
	      -e 's|@''GNULIB_MALLOC_POSIX''@|$(GNULIB_MALLOC_POSIX)|g' \
	      -e 's|@''GNULIB_MKDTEMP''@|$(GNULIB_MKDTEMP)|g' \
	      -e 's|@''GNULIB_MKOSTEMP''@|$(GNULIB_MKOSTEMP)|g' \
	      -e 's|@''GNULIB_MKOSTEMPS''@|$(GNULIB_MKOSTEMPS)|g' \
	      -e 's|@''GNULIB_MKSTEMP''@|$(GNULIB_MKSTEMP)|g' \
	      -e 's|@''GNULIB_MKSTEMPS''@|$(GNULIB_MKSTEMPS)|g' \
	      -e 's|@''GNULIB_PTSNAME''@|$(GNULIB_PTSNAME)|g' \
	      -e 's|@''GNULIB_PUTENV''@|$(GNULIB_PUTENV)|g' \
	      -e 's|@''GNULIB_RANDOM_R''@|$(GNULIB_RANDOM_R)|g' \
	      -e 's|@''GNULIB_REALLOC_POSIX''@|$(GNULIB_REALLOC_POSIX)|g' \
	      -e 's|@''GNULIB_REALPATH''@|$(GNULIB_REALPATH)|g' \
	      -e 's|@''GNULIB_RPMATCH''@|$(GNULIB_RPMATCH)|g' \
	      -e 's|@''GNULIB_SETENV''@|$(GNULIB_SETENV)|g' \
	      -e 's|@''GNULIB_STRTOD''@|$(GNULIB_STRTOD)|g' \
	      -e 's|@''GNULIB_STRTOLL''@|$(GNULIB_STRTOLL)|g' \
	      -e 's|@''GNULIB_STRTOULL''@|$(GNULIB_STRTOULL)|g' \
	      -e 's|@''GNULIB_SYSTEM_POSIX''@|$(GNULIB_SYSTEM_POSIX)|g' \
	      -e 's|@''GNULIB_UNLOCKPT''@|$(GNULIB_UNLOCKPT)|g' \
	      -e 's|@''GNULIB_UNSETENV''@|$(GNULIB_UNSETENV)|g' \
	      -e 's|@''HAVE__EXIT''@|$(HAVE__EXIT)|g' \
	      -e 's|@''HAVE_ATOLL''@|$(HAVE_ATOLL)|g' \
	      -e 's|@''HAVE_CANONICALIZE_FILE_NAME''@|$(HAVE_CANONICALIZE_FILE_NAME)|g' \
	      -e 's|@''HAVE_DECL_GETLOADAVG''@|$(HAVE_DECL_GETLOADAVG)|g' \
	      -e 's|@''HAVE_GETSUBOPT''@|$(HAVE_GETSUBOPT)|g' \
	      -e 's|@''HAVE_GRANTPT''@|$(HAVE_GRANTPT)|g' \
	      -e 's|@''HAVE_MKDTEMP''@|$(HAVE_MKDTEMP)|g' \
	      -e 's|@''HAVE_MKOSTEMP''@|$(HAVE_MKOSTEMP)|g' \
	      -e 's|@''HAVE_MKOSTEMPS''@|$(HAVE_MKOSTEMPS)|g' \
	      -e 's|@''HAVE_MKSTEMP''@|$(HAVE_MKSTEMP)|g' \
	      -e 's|@''HAVE_MKSTEMPS''@|$(HAVE_MKSTEMPS)|g' \
	      -e 's|@''HAVE_PTSNAME''@|$(HAVE_PTSNAME)|g' \
	      -e 's|@''HAVE_RANDOM_H''@|$(HAVE_RANDOM_H)|g' \
	      -e 's|@''HAVE_RANDOM_R''@|$(HAVE_RANDOM_R)|g' \
	      -e 's|@''HAVE_REALPATH''@|$(HAVE_REALPATH)|g' \
	      -e 's|@''HAVE_RPMATCH''@|$(HAVE_RPMATCH)|g' \
	      -e 's|@''HAVE_DECL_SETENV''@|$(HAVE_DECL_SETENV)|g' \
	      -e 's|@''HAVE_STRTOD''@|$(HAVE_STRTOD)|g' \
	      -e 's|@''HAVE_STRTOLL''@|$(HAVE_STRTOLL)|g' \
	      -e 's|@''HAVE_STRTOULL''@|$(HAVE_STRTOULL)|g' \
	      -e 's|@''HAVE_STRUCT_RANDOM_DATA''@|$(HAVE_STRUCT_RANDOM_DATA)|g' \
	      -e 's|@''HAVE_SYS_LOADAVG_H''@|$(HAVE_SYS_LOADAVG_H)|g' \
	      -e 's|@''HAVE_UNLOCKPT''@|$(HAVE_UNLOCKPT)|g' \
	      -e 's|@''HAVE_DECL_UNSETENV''@|$(HAVE_DECL_UNSETENV)|g' \
	      -e 's|@''REPLACE_CALLOC''@|$(REPLACE_CALLOC)|g' \
	      -e 's|@''REPLACE_CANONICALIZE_FILE_NAME''@|$(REPLACE_CANONICALIZE_FILE_NAME)|g' \
	      -e 's|@''REPLACE_MALLOC''@|$(REPLACE_MALLOC)|g' \
	      -e 's|@''REPLACE_MKSTEMP''@|$(REPLACE_MKSTEMP)|g' \
	      -e 's|@''REPLACE_PUTENV''@|$(REPLACE_PUTENV)|g' \
	      -e 's|@''REPLACE_REALLOC''@|$(REPLACE_REALLOC)|g' \
	      -e 's|@''REPLACE_REALPATH''@|$(REPLACE_REALPATH)|g' \
	      -e 's|@''REPLACE_SETENV''@|$(REPLACE_SETENV)|g' \
	      -e 's|@''REPLACE_STRTOD''@|$(REPLACE_STRTOD)|g' \
	      -e 's|@''REPLACE_UNSETENV''@|$(REPLACE_UNSETENV)|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r $(CXXDEFS_H)' \
	      -e '/definition of _GL_ARG_NONNULL/r $(ARG_NONNULL_H)' \
	      -e '/definition of _GL_WARN_ON_USE/r $(WARN_ON_USE_H)' \
	      < $(srcdir)/stdlib.in.h; \
	} > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += stdlib.h stdlib.h-t

EXTRA_DIST += stdlib.in.h

## end   gnulib module stdlib

## begin gnulib module strftime


EXTRA_DIST += strftime.c strftime.h

EXTRA_libgnu_a_SOURCES += strftime.c

## end   gnulib module strftime

## begin gnulib module time

BUILT_SOURCES += time.h

# We need the following in order to create <time.h> when the system
# doesn't have one that works with the given compiler.
time.h: time.in.h $(CXXDEFS_H) $(ARG_NONNULL_H) $(WARN_ON_USE_H)
	$(AM_V_GEN)rm -f $@-t $@ && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|$(INCLUDE_NEXT)|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|@PRAGMA_SYSTEM_HEADER@|g' \
	      -e 's|@''PRAGMA_COLUMNS''@|@PRAGMA_COLUMNS@|g' \
	      -e 's|@''NEXT_TIME_H''@|$(NEXT_TIME_H)|g' \
	      -e 's|@''GNULIB_MKTIME''@|$(GNULIB_MKTIME)|g' \
	      -e 's|@''GNULIB_NANOSLEEP''@|$(GNULIB_NANOSLEEP)|g' \
	      -e 's|@''GNULIB_STRPTIME''@|$(GNULIB_STRPTIME)|g' \
	      -e 's|@''GNULIB_TIMEGM''@|$(GNULIB_TIMEGM)|g' \
	      -e 's|@''GNULIB_TIME_R''@|$(GNULIB_TIME_R)|g' \
	      -e 's|@''HAVE_DECL_LOCALTIME_R''@|$(HAVE_DECL_LOCALTIME_R)|g' \
	      -e 's|@''HAVE_NANOSLEEP''@|$(HAVE_NANOSLEEP)|g' \
	      -e 's|@''HAVE_STRPTIME''@|$(HAVE_STRPTIME)|g' \
	      -e 's|@''HAVE_TIMEGM''@|$(HAVE_TIMEGM)|g' \
	      -e 's|@''REPLACE_LOCALTIME_R''@|$(REPLACE_LOCALTIME_R)|g' \
	      -e 's|@''REPLACE_MKTIME''@|$(REPLACE_MKTIME)|g' \
	      -e 's|@''REPLACE_NANOSLEEP''@|$(REPLACE_NANOSLEEP)|g' \
	      -e 's|@''REPLACE_TIMEGM''@|$(REPLACE_TIMEGM)|g' \
	      -e 's|@''PTHREAD_H_DEFINES_STRUCT_TIMESPEC''@|$(PTHREAD_H_DEFINES_STRUCT_TIMESPEC)|g' \
	      -e 's|@''SYS_TIME_H_DEFINES_STRUCT_TIMESPEC''@|$(SYS_TIME_H_DEFINES_STRUCT_TIMESPEC)|g' \
	      -e 's|@''TIME_H_DEFINES_STRUCT_TIMESPEC''@|$(TIME_H_DEFINES_STRUCT_TIMESPEC)|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r $(CXXDEFS_H)' \
	      -e '/definition of _GL_ARG_NONNULL/r $(ARG_NONNULL_H)' \
	      -e '/definition of _GL_WARN_ON_USE/r $(WARN_ON_USE_H)' \
	      < $(srcdir)/time.in.h; \
	} > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += time.h time.h-t

EXTRA_DIST += time.in.h

## end   gnulib module time

## begin gnulib module time_r


EXTRA_DIST += time_r.c

EXTRA_libgnu_a_SOURCES += time_r.c

## end   gnulib module time_r

## begin gnulib module unistd

BUILT_SOURCES += unistd.h

# We need the following in order to create an empty placeholder for
# <unistd.h> when the system doesn't have one.
unistd.h: unistd.in.h $(CXXDEFS_H) $(ARG_NONNULL_H) $(WARN_ON_USE_H)
	$(AM_V_GEN)rm -f $@-t $@ && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_UNISTD_H''@|$(HAVE_UNISTD_H)|g' \
	      -e 's|@''INCLUDE_NEXT''@|$(INCLUDE_NEXT)|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|@PRAGMA_SYSTEM_HEADER@|g' \
	      -e 's|@''PRAGMA_COLUMNS''@|@PRAGMA_COLUMNS@|g' \
	      -e 's|@''NEXT_UNISTD_H''@|$(NEXT_UNISTD_H)|g' \
	      -e 's|@''GNULIB_CHOWN''@|$(GNULIB_CHOWN)|g' \
	      -e 's|@''GNULIB_CLOSE''@|$(GNULIB_CLOSE)|g' \
	      -e 's|@''GNULIB_DUP2''@|$(GNULIB_DUP2)|g' \
	      -e 's|@''GNULIB_DUP3''@|$(GNULIB_DUP3)|g' \
	      -e 's|@''GNULIB_ENVIRON''@|$(GNULIB_ENVIRON)|g' \
	      -e 's|@''GNULIB_EUIDACCESS''@|$(GNULIB_EUIDACCESS)|g' \
	      -e 's|@''GNULIB_FACCESSAT''@|$(GNULIB_FACCESSAT)|g' \
	      -e 's|@''GNULIB_FCHDIR''@|$(GNULIB_FCHDIR)|g' \
	      -e 's|@''GNULIB_FCHOWNAT''@|$(GNULIB_FCHOWNAT)|g' \
	      -e 's|@''GNULIB_FSYNC''@|$(GNULIB_FSYNC)|g' \
	      -e 's|@''GNULIB_FTRUNCATE''@|$(GNULIB_FTRUNCATE)|g' \
	      -e 's|@''GNULIB_GETCWD''@|$(GNULIB_GETCWD)|g' \
	      -e 's|@''GNULIB_GETDOMAINNAME''@|$(GNULIB_GETDOMAINNAME)|g' \
	      -e 's|@''GNULIB_GETDTABLESIZE''@|$(GNULIB_GETDTABLESIZE)|g' \
	      -e 's|@''GNULIB_GETGROUPS''@|$(GNULIB_GETGROUPS)|g' \
	      -e 's|@''GNULIB_GETHOSTNAME''@|$(GNULIB_GETHOSTNAME)|g' \
	      -e 's|@''GNULIB_GETLOGIN''@|$(GNULIB_GETLOGIN)|g' \
	      -e 's|@''GNULIB_GETLOGIN_R''@|$(GNULIB_GETLOGIN_R)|g' \
	      -e 's|@''GNULIB_GETPAGESIZE''@|$(GNULIB_GETPAGESIZE)|g' \
	      -e 's|@''GNULIB_GETUSERSHELL''@|$(GNULIB_GETUSERSHELL)|g' \
	      -e 's|@''GNULIB_LCHOWN''@|$(GNULIB_LCHOWN)|g' \
	      -e 's|@''GNULIB_LINK''@|$(GNULIB_LINK)|g' \
	      -e 's|@''GNULIB_LINKAT''@|$(GNULIB_LINKAT)|g' \
	      -e 's|@''GNULIB_LSEEK''@|$(GNULIB_LSEEK)|g' \
	      -e 's|@''GNULIB_PIPE''@|$(GNULIB_PIPE)|g' \
	      -e 's|@''GNULIB_PIPE2''@|$(GNULIB_PIPE2)|g' \
	      -e 's|@''GNULIB_PREAD''@|$(GNULIB_PREAD)|g' \
	      -e 's|@''GNULIB_PWRITE''@|$(GNULIB_PWRITE)|g' \
	      -e 's|@''GNULIB_READLINK''@|$(GNULIB_READLINK)|g' \
	      -e 's|@''GNULIB_READLINKAT''@|$(GNULIB_READLINKAT)|g' \
	      -e 's|@''GNULIB_RMDIR''@|$(GNULIB_RMDIR)|g' \
	      -e 's|@''GNULIB_SLEEP''@|$(GNULIB_SLEEP)|g' \
	      -e 's|@''GNULIB_SYMLINK''@|$(GNULIB_SYMLINK)|g' \
	      -e 's|@''GNULIB_SYMLINKAT''@|$(GNULIB_SYMLINKAT)|g' \
	      -e 's|@''GNULIB_TTYNAME_R''@|$(GNULIB_TTYNAME_R)|g' \
	      -e 's|@''GNULIB_UNISTD_H_GETOPT''@|$(GNULIB_UNISTD_H_GETOPT)|g' \
	      -e 's|@''GNULIB_UNISTD_H_SIGPIPE''@|$(GNULIB_UNISTD_H_SIGPIPE)|g' \
	      -e 's|@''GNULIB_UNLINK''@|$(GNULIB_UNLINK)|g' \
	      -e 's|@''GNULIB_UNLINKAT''@|$(GNULIB_UNLINKAT)|g' \
	      -e 's|@''GNULIB_USLEEP''@|$(GNULIB_USLEEP)|g' \
	      -e 's|@''GNULIB_WRITE''@|$(GNULIB_WRITE)|g' \
	      < $(srcdir)/unistd.in.h | \
	  sed -e 's|@''HAVE_CHOWN''@|$(HAVE_CHOWN)|g' \
	      -e 's|@''HAVE_DUP2''@|$(HAVE_DUP2)|g' \
	      -e 's|@''HAVE_DUP3''@|$(HAVE_DUP3)|g' \
	      -e 's|@''HAVE_EUIDACCESS''@|$(HAVE_EUIDACCESS)|g' \
	      -e 's|@''HAVE_FACCESSAT''@|$(HAVE_FACCESSAT)|g' \
	      -e 's|@''HAVE_FCHDIR''@|$(HAVE_FCHDIR)|g' \
	      -e 's|@''HAVE_FCHOWNAT''@|$(HAVE_FCHOWNAT)|g' \
	      -e 's|@''HAVE_FSYNC''@|$(HAVE_FSYNC)|g' \
	      -e 's|@''HAVE_FTRUNCATE''@|$(HAVE_FTRUNCATE)|g' \
	      -e 's|@''HAVE_GETDTABLESIZE''@|$(HAVE_GETDTABLESIZE)|g' \
	      -e 's|@''HAVE_GETGROUPS''@|$(HAVE_GETGROUPS)|g' \
	      -e 's|@''HAVE_GETHOSTNAME''@|$(HAVE_GETHOSTNAME)|g' \
	      -e 's|@''HAVE_GETLOGIN''@|$(HAVE_GETLOGIN)|g' \
	      -e 's|@''HAVE_GETPAGESIZE''@|$(HAVE_GETPAGESIZE)|g' \
	      -e 's|@''HAVE_LCHOWN''@|$(HAVE_LCHOWN)|g' \
	      -e 's|@''HAVE_LINK''@|$(HAVE_LINK)|g' \
	      -e 's|@''HAVE_LINKAT''@|$(HAVE_LINKAT)|g' \
	      -e 's|@''HAVE_PIPE''@|$(HAVE_PIPE)|g' \
	      -e 's|@''HAVE_PIPE2''@|$(HAVE_PIPE2)|g' \
	      -e 's|@''HAVE_PREAD''@|$(HAVE_PREAD)|g' \
	      -e 's|@''HAVE_PWRITE''@|$(HAVE_PWRITE)|g' \
	      -e 's|@''HAVE_READLINK''@|$(HAVE_READLINK)|g' \
	      -e 's|@''HAVE_READLINKAT''@|$(HAVE_READLINKAT)|g' \
	      -e 's|@''HAVE_SLEEP''@|$(HAVE_SLEEP)|g' \
	      -e 's|@''HAVE_SYMLINK''@|$(HAVE_SYMLINK)|g' \
	      -e 's|@''HAVE_SYMLINKAT''@|$(HAVE_SYMLINKAT)|g' \
	      -e 's|@''HAVE_UNLINKAT''@|$(HAVE_UNLINKAT)|g' \
	      -e 's|@''HAVE_USLEEP''@|$(HAVE_USLEEP)|g' \
	      -e 's|@''HAVE_DECL_ENVIRON''@|$(HAVE_DECL_ENVIRON)|g' \
	      -e 's|@''HAVE_DECL_FCHDIR''@|$(HAVE_DECL_FCHDIR)|g' \
	      -e 's|@''HAVE_DECL_GETDOMAINNAME''@|$(HAVE_DECL_GETDOMAINNAME)|g' \
	      -e 's|@''HAVE_DECL_GETLOGIN_R''@|$(HAVE_DECL_GETLOGIN_R)|g' \
	      -e 's|@''HAVE_DECL_GETPAGESIZE''@|$(HAVE_DECL_GETPAGESIZE)|g' \
	      -e 's|@''HAVE_DECL_GETUSERSHELL''@|$(HAVE_DECL_GETUSERSHELL)|g' \
	      -e 's|@''HAVE_DECL_TTYNAME_R''@|$(HAVE_DECL_TTYNAME_R)|g' \
	      -e 's|@''HAVE_OS_H''@|$(HAVE_OS_H)|g' \
	      -e 's|@''HAVE_SYS_PARAM_H''@|$(HAVE_SYS_PARAM_H)|g' \
	      -e 's|@''REPLACE_CHOWN''@|$(REPLACE_CHOWN)|g' \
	      -e 's|@''REPLACE_CLOSE''@|$(REPLACE_CLOSE)|g' \
	      -e 's|@''REPLACE_DUP''@|$(REPLACE_DUP)|g' \
	      -e 's|@''REPLACE_DUP2''@|$(REPLACE_DUP2)|g' \
	      -e 's|@''REPLACE_FCHOWNAT''@|$(REPLACE_FCHOWNAT)|g' \
	      -e 's|@''REPLACE_GETCWD''@|$(REPLACE_GETCWD)|g' \
	      -e 's|@''REPLACE_GETDOMAINNAME''@|$(REPLACE_GETDOMAINNAME)|g' \
	      -e 's|@''REPLACE_GETLOGIN_R''@|$(REPLACE_GETLOGIN_R)|g' \
	      -e 's|@''REPLACE_GETGROUPS''@|$(REPLACE_GETGROUPS)|g' \
	      -e 's|@''REPLACE_GETPAGESIZE''@|$(REPLACE_GETPAGESIZE)|g' \
	      -e 's|@''REPLACE_LCHOWN''@|$(REPLACE_LCHOWN)|g' \
	      -e 's|@''REPLACE_LINK''@|$(REPLACE_LINK)|g' \
	      -e 's|@''REPLACE_LINKAT''@|$(REPLACE_LINKAT)|g' \
	      -e 's|@''REPLACE_LSEEK''@|$(REPLACE_LSEEK)|g' \
	      -e 's|@''REPLACE_PREAD''@|$(REPLACE_PREAD)|g' \
	      -e 's|@''REPLACE_PWRITE''@|$(REPLACE_PWRITE)|g' \
	      -e 's|@''REPLACE_READLINK''@|$(REPLACE_READLINK)|g' \
	      -e 's|@''REPLACE_RMDIR''@|$(REPLACE_RMDIR)|g' \
	      -e 's|@''REPLACE_SLEEP''@|$(REPLACE_SLEEP)|g' \
	      -e 's|@''REPLACE_SYMLINK''@|$(REPLACE_SYMLINK)|g' \
	      -e 's|@''REPLACE_TTYNAME_R''@|$(REPLACE_TTYNAME_R)|g' \
	      -e 's|@''REPLACE_UNLINK''@|$(REPLACE_UNLINK)|g' \
	      -e 's|@''REPLACE_UNLINKAT''@|$(REPLACE_UNLINKAT)|g' \
	      -e 's|@''REPLACE_USLEEP''@|$(REPLACE_USLEEP)|g' \
	      -e 's|@''REPLACE_WRITE''@|$(REPLACE_WRITE)|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H''@|$(UNISTD_H_HAVE_WINSOCK2_H)|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|$(UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS)|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r $(CXXDEFS_H)' \
	      -e '/definition of _GL_ARG_NONNULL/r $(ARG_NONNULL_H)' \
	      -e '/definition of _GL_WARN_ON_USE/r $(WARN_ON_USE_H)'; \
	} > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += unistd.h unistd.h-t

EXTRA_DIST += unistd.in.h

## end   gnulib module unistd

## begin gnulib module warn-on-use

BUILT_SOURCES += warn-on-use.h
# The warn-on-use.h that gets inserted into generated .h files is the same as
# build-aux/warn-on-use.h, except that it has the copyright header cut off.
warn-on-use.h: $(top_srcdir)/./warn-on-use.h
	$(AM_V_GEN)rm -f $@-t $@ && \
	sed -n -e '/^.ifndef/,$$p' \
	  < $(top_srcdir)/./warn-on-use.h \
	  > $@-t && \
	mv $@-t $@
MOSTLYCLEANFILES += warn-on-use.h warn-on-use.h-t

WARN_ON_USE_H=warn-on-use.h

EXTRA_DIST += $(top_srcdir)/./warn-on-use.h

## end   gnulib module warn-on-use


mostlyclean-local: mostlyclean-generic
	@for dir in '' $(MOSTLYCLEANDIRS); do \
	  if test -n "$$dir" && test -d $$dir; then \
	    echo "rmdir $$dir"; rmdir $$dir; \
	  fi; \
	done; \
	:
