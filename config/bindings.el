(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(setq mac-control-modifier 'control)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq ns-function-modifier 'hyper)

(define-key ac-completing-map "\r" 'ac-complete)

(global-set-key (kbd "C-x ,") 'fixup-whitespace)
(global-set-key (kbd "C-x ;") 'delete-indentation)
(global-set-key (kbd "C-:") 'undo-tree-visualize)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-c SPC") 'ace-jump-word-mode)

(global-set-key (kbd "M-<") 'other-frame)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)

;; steve yegge is right about everything - https://sites.google.com/site/steveyegge2/effective-emacs
;;(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-w") 'paredit-backward-kill-word)
(global-set-key (kbd "C-c C-k") 'kill-region)

(global-set-key (kbd "C-c f") 'find-file-in-project)

(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)

(global-set-key (kbd "H-,")   'cider-reset)
(global-set-key (kbd "H-M-,") 'cider-refresh)
(global-set-key (kbd "H-t")   'cider-tests)
(global-set-key (kbd "H-M-t") 'cider-clojure-tests)

(global-set-key (kbd "H-j") 'cider-jack-in)
(global-set-key (kbd "H-k") 'cider-quit)

(global-set-key (kbd "H--") 'cider-toggle-repl-buffer)

(global-set-key (kbd "H-r") 'revert-all-buffers)

(defun tc-copy-whole-line ()
  "Clone current line"
  (interactive)
  (kill-whole-line)
  (yank)
  (yank)
  (previous-line))

(global-set-key (kbd "H-x") 'kill-whole-line)
(global-set-key (kbd "H-d") 'tc-copy-whole-line)
(global-set-key (kbd "H-c") 'clojure-cheatsheet)

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
  '(define-key paredit-mode-map (kbd "C-c d d")
     'paredit-duplicate-after-point))
