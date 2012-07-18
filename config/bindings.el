(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(custom-set-variables
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(ns-function-modifier (quote none)))

(define-key ac-completing-map "\r" 'ac-complete)

(global-set-key (kbd "C-x ,") 'fixup-whitespace)
(global-set-key (kbd "C-x ;") 'delete-indentation)
(global-set-key (kbd "C-:") 'undo-tree-visualize)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-c SPC") 'ace-jump-word-mode)
