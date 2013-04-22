(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; (custom-set-variables
;;  '(ns-alternate-modifier (quote none))
;;  '(ns-command-modifier (quote meta))
;;  '(ns-function-modifier (quote none)))

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
