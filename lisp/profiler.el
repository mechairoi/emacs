(defvar profiler-results-buffer "*Profile Results*")

(defun profiler-results-line-field (string width &optional right)
  (unless (stringp string)
    (setq string (format "%s" string)))
  (let ((w (length string)))
    (if (<= w width)
        (let ((padding (make-string (- width w) ? )))
          (if right
              (concat padding string)
            (concat string padding)))
      (concat (substring string 0 (- width 3)) "..."))))

(defun profiler-results-line-string (name self time)
  (concat
   (profiler-results-line-field name 60)
   "   "
   (profiler-results-line-field self 10 t)
   "   "
   (profiler-results-line-field time 10 t)))

(defun profiler-results-header-string ()
  (concat "  " (profiler-results-line-string "  Name" "Self" "Time")))

(defun profiler-results-tree (data depth)
  (delq
   nil
   (mapcar
    (lambda (name)
      (let (children (total 0))
        (mapc
         (lambda (r)
           (when (equal (nth depth (car r)) name)
             (setq total (+ total (cdr r)))
             (push r children)))
         data)
        (list name total (profiler-results-tree children (1+ depth)))))
    (delete-dups
     (delq
      nil
      (mapcar (lambda (r) (nth depth (car r)))
              data))))))

(defun profiler-results-insert (node depth)
  (let* ((function (nth 0 node))
         (count (nth 1 node))
         (children (nth 2 node))
         (name (format "%s" function)))
    (insert
     (propertize (profiler-results-line-string (concat (make-string (* depth 2) ? )
                                                     (if children "+ " "  ")
                                                     (propertize name
                                                                 'mouse-face 'highlight
                                                                 'help-echo (format "mouse-2, j: %s" name)))
                                             (* count (/ 1000 profiler-interval))
                                             0)
                 'function function
                 'children children
                 'depth depth))
    (insert "\n")))

(defun profiler-results-expand ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (when (re-search-forward "+ " (line-end-position) t)
      (setq buffer-read-only nil)
      (replace-match (apply 'propertize (cons "- " (text-properties-at (match-beginning 0)))))
      (let ((depth (get-text-property (point) 'depth))
            (children (get-text-property (point) 'children)))
        (when (and depth children)
          (forward-line)
          (dolist (node children)
            (profiler-results-insert node (1+ depth)))))
      (setq buffer-read-only t))))

(defun profiler-results-collapse ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (when (re-search-forward "- " (line-end-position) t)
      (setq buffer-read-only nil)
      (replace-match (apply 'propertize (cons "+ " (text-properties-at (match-beginning 0)))))
      (let ((start (line-beginning-position 2))
            (depth (get-text-property (point) 'depth))
            (end nil)
            d)
        (while (and (not end)
                    (eq (forward-line) 0)
                    (numberp (setq d (get-text-property (point) 'depth)))
                    (> d depth)))
        (delete-region start (line-beginning-position)))
      (setq buffer-read-only t))))

(defun profiler-results-toggle ()
  (interactive)
  (or (profiler-results-expand)
      (profiler-results-collapse)))

(defun profiler-results-mouse-toggle ()
  (interactive)
  (if (get-text-property (point) 'help-echo)
      (profiler-results-toggle)))

(defun profiler-results-jump ()
  (interactive)
  (let ((function (get-text-property (point) 'function)))
    (when function
      (require 'find-func)
      (find-function function))))

(defun profiler-results-mouse-jump ()
  (interactive)
  (if (get-text-property (point) 'help-echo)
      (profiler-results-jump)))

(defun profiler-results-quit ()
  (interactive)
  (kill-buffer))

;;;###autoload
(defun profiler-results ()
  (interactive)
  (let ((buffer (get-buffer-create profiler-results-buffer))
        (data (profiler-results-tree (profiler-data) 0)))
    (setq data
          (sort data
                (lambda (a b)
                  (> (nth 1 a) (nth 1 b)))))
    (with-current-buffer buffer
      (profiler-results-mode)
      (setq buffer-read-only nil)
      (erase-buffer)
      (setq header-line-format (profiler-results-header-string))
      (save-excursion
        (dolist (node data)
          (profiler-results-insert node 0)))
      (setq buffer-read-only t)
      (pop-to-buffer (current-buffer)))))

(defvar profiler-results-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "n" 'forward-line)
    (define-key map "p" 'previous-line)
    (define-key map "q" 'profiler-results-quit)
    (define-key map "\r" 'profiler-results-toggle)
    (define-key map "j" 'profiler-results-jump)
    (define-key map [mouse-1] 'profiler-results-mouse-toggle)
    (define-key map [mouse-2] 'profiler-results-mouse-jump)
    map))

(defun profiler-results-mode ()
  (interactive)
  (kill-all-local-variables)
  (setq buffer-undo-list t)
  (use-local-map profiler-results-mode-map)
  (setq major-mode 'profiler-results-mode)
  (setq mode-name "Profile Results"))

(provide 'profiler)
