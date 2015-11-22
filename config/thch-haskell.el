(setq haskell-font-lock-symbols 'unicode)

;; remove irritating symbol expansion
(setq haskell-font-lock-symbols-alist (remove '("()" . "∅") haskell-font-lock-symbols-alist))

(prelude-require-packages '(hi2 hindent))

;; hlint and
(thch-add-external-lib "hlint-refactor-mode")
(require 'hlint-refactor-mode)
(add-hook 'haskell-mode-hook 'hlint-refactor-mode)

;; better haskell indents
(add-hook 'haskell-mode-hook 'turn-on-hi2)

(add-hook 'haskell-mode-hook
          (lambda ()
            ;; install (from source): https://github.com/chrisdone/ghci-ng
            (setq haskell-process-wrapper-function
                  (lambda (args)
                    (append args (list "--with-ghc" "ghci-ng"))))
            (setq haskell-process-suggest-remove-import-lines 't)

            (define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
            (define-key interactive-haskell-mode-map (kbd "M-,") 'xref-pop-marker-stack)
            (define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
            (define-key interactive-haskell-mode-map (kbd "C-c C-u") 'haskell-mode-find-uses)
            (define-key interactive-haskell-mode-map (kbd "C-c C-k") 'kill-region)))

;; cabal installs:
;;  hindent
;;  hlint (>= 1.9.23)
;;  apply-refact (for hlint apply refactoring to work)

(provide 'thch-haskell)
