(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(define-key ac-completing-map "\r" 'ac-complete)

(global-set-key (kbd "C-x ,") 'fixup-whitespace)
(global-set-key (kbd "C-x ;") 'delete-indentation)
(global-set-key (kbd "C-:") 'undo-tree-visualize)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-c SPC") 'ace-jump-word-mode)

(global-set-key (kbd "M-<") 'other-frame)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)

;; steve yegge is right about everthing - https://sites.google.com/site/steveyegge2/effective-emacs
;;(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-w") 'paredit-backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

(global-set-key (kbd "C-c f") 'find-file-in-project)

(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)

(global-set-key (kbd "C-c C-n") 'rename-current-buffer-file)

;; Duplicate sexp
(defun paredit-duplicate-after-point
  ()
  "Duplicates the content of the line that is after the point."
  (interactive)
  ;; skips to the next sexp
  (while (looking-at " ")
    (forward-char))
  (set-mark-command nil)
  ;; while we find sexps we move forward on the line
  (while (and (<= (point) (car (bounds-of-thing-at-point 'sexp)))
              (not (= (point) (line-end-position))))
    (forward-sexp)
    (while (looking-at " ")
      (forward-char)))
  (kill-ring-save (mark) (point))
  ;; go to the next line and copy the sexprs we encountered
  (paredit-newline)
  (set-mark-command nil)
  (yank)
  (exchange-point-and-mark))

(eval-after-load "paredit"
  '(define-key paredit-mode-map (kbd "C-c C-d")
     'paredit-duplicate-after-point))
