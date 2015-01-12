;; for this to work, the following manual steps are needed:
;; - purescript-mode: (cd lib/purescript-mode/; make purescript-mode-autoloads.el)
;; - purscheck: (cd lib/purscheck; cabal build; cabal install)

(setq purescript-font-lock-symbols 'unicode)

(thch-add-external-lib "purescript-mode")
(thch-add-external-lib "purscheck")

(require 'flycheck)

;; connect purscheck to emacs, parsing errors and warnings
(flycheck-define-checker
    purs-check
  "Use purscheck to flycheck PureScript code."
  :command ("purscheck" source source-original temporary-file-name)
  :error-patterns
  ((error line-start
          (or (and "Error at " (file-name) " line " line ", column " column ":" (zero-or-more " "))
              (and "\"" (file-name) "\" (line " line ", column " column "):"))
          (or (message (one-or-more not-newline))
              (and "\n"
                   (message
                    (zero-or-more " ") (one-or-more not-newline)
                    (zero-or-more "\n"
                                  (zero-or-more " ")
                                  (one-or-more not-newline)))))
          line-end))
  :modes purescript-mode)

;; connect flycheck with purscheck
(add-to-list 'flycheck-checkers 'purs-check)

;; enable purescript smart indentation and purscheck whenever a
;; purescript file is loaded into emacs
(require 'purescript-mode-autoloads)
(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
(add-hook 'purescript-mode-hook 'flycheck-mode)
