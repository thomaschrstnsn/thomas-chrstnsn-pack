(message "loading thch-core")

(setq prelude-guru nil)

(defun thch-add-external-lib (lib)
  (add-to-list 'load-path (expand-file-name lib thch-lib-dir)))

(defvar safe-load-error-list ""
  "*List of files that reported errors when loaded via safe-load")

(defun safe-load (file &optional noerror nomessage nosuffix)
  "Load a file.  If error when loading, report back, wait for
   a key stroke then continue on"
  (interactive "f")
  (condition-case nil (load file noerror nomessage nosuffix)
    (error
     (progn
       (setq safe-load-error-list  (concat safe-load-error-list  " " file))
       (message "****** Error loading %s" safe-load-error-list )
       nil))))

(defun safe-load-check ()
  "Check for any previous safe-load loading errors.  (safe-load.el)"
  (interactive)
  (if (string-equal safe-load-error-list "") ()
    (message (concat "****** error loading: " safe-load-error-list))))

(defun string/starts-with (s arg)
  "returns non-nil if string S starts with ARG.  Else nil."
  (cond ((>= (length s) (length arg))
         (string-equal (substring s 0 (length arg)) arg))
        (t nil)))

(provide 'thch-core)

(message "thch-core loaded...")
