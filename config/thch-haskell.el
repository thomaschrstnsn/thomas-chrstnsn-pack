(setq haskell-font-lock-symbols 'unicode)

;; remove irritating symbol expansion
(setq haskell-font-lock-symbols-alist (remove '("()" . "∅") haskell-font-lock-symbols-alist))

(prelude-require-packages '(hi2 hindent))

;; better haskell indents
(add-hook 'haskell-mode-hook 'turn-on-hi2)

(add-hook 'haskell-mode-hook
          (lambda ()
            ;; install (from source): https://github.com/chrisdone/ghci-ng
            (setq haskell-process-type 'cabal-repl)
            (setq haskell-process-args-cabal-repl
                  '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))

            (define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
            (define-key interactive-haskell-mode-map (kbd "M-,") 'xref-pop-marker-stack)
            (define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
            (define-key interactive-haskell-mode-map (kbd "C-c C-u") 'haskell-mode-find-uses)))

;; nice indents of current decl using M-q, requires hindent installed in cabal
;;(add-hook 'haskell-mode-hook #'hindent-mode)
;; (setq hindent-style "johan-tibell")

;; cabal installs:
;;  hindent

(provide 'thch-haskell)
