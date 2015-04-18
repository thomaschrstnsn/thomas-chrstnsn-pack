(setq haskell-font-lock-symbols 'unicode)

;; I comment out the line:
;;     (cons "()" (decode-char 'ucs #X2205))
;; in haskell-font-lock.el
;; TODO: figure out how to do the above programatically

(prelude-require-packages '(hi2 hindent))
;; better haskell indents
(add-hook 'haskell-mode-hook 'turn-on-hi2)
;; nice indents of current decl using M-q, requires hindent installed in cabal
;; (add-hook 'haskell-mode-hook #'hindent-mode)
;; (setq hindent-style "johan-tibell")

;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)

;; cabal installs:
;;  hindent
;;  hasktags
;;  ghc-mod
;;  structured-haskell-mode

;;;; Structured Haskell Mode (SHM)
;; Currently shm is not available on melpa, so...
;; Clone the project from github:
;; $ git clone https://github.com/chrisdone/structured-haskell-mode.git
;; You need to install the structured-haskell-mode executable which does the parsing.

;; $ cd structured-haskell-mode
;; $ cabal install
;; $ cd elisp/
;; $ make
;; Add the elisp library to your load-path and require the library.

;; Enable it by uncommenting the two lines below:
;; (add-to-list 'load-path "/Users/thomas/src/structured-haskell-mode/elisp")
;; (require 'shm)

;; hasktags, M-. goto definition in project
(custom-set-variables '(haskell-tags-on-save t))

(provide 'thch-haskell)
