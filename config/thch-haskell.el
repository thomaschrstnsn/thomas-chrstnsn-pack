(setq haskell-font-lock-symbols 'unicode)

;; remove irritating symbol expansion
(setq haskell-font-lock-symbols-alist (remove '("()" . "∅") haskell-font-lock-symbols-alist))

(prelude-require-packages '(hi2 hindent ghc))
;; better haskell indents
(add-hook 'haskell-mode-hook 'turn-on-hi2)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; nice indents of current decl using M-q, requires hindent installed in cabal
;; (add-hook 'haskell-mode-hook #'hindent-mode)
;; (setq hindent-style "johan-tibell")

;; cabal installs:
;;  hindent
;;  hasktags
;;  ghc-mod

;; hasktags, M-. goto definition in project
(custom-set-variables '(haskell-tags-on-save t))

(provide 'thch-haskell)
