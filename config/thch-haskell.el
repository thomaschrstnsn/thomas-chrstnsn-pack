(setq haskell-font-lock-symbols 'unicode)

;; -- UNFINISHED Haskell support
;; (prelude-require-packages '(haskell-mode ghc))
;; (prelude-require-packages '(haskell-mode ghc ghci-completion company-ghc))
;; (require 'haskell-session)
;; (require 'haskell-indentation)

;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)
;; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(provide 'thch-haskell)
