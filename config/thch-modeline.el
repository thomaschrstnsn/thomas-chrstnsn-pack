(prelude-require-package 'delight)

;; Unclutter the modeline
(require 'delight)

;; http://www.emacswiki.org/emacs/DelightedModes
(delight '((eldoc-mode nil "eldoc")
           (emacs-lisp-mode "Elisp" :major)
           (company-mode nil "company")
           (smartparens-mode nil "smartparens")
           (prelude-mode nil "prelude-mode")
           (flycheck-mode nil "flycheck")
           (whitespace-mode nil "whitespace")
           (projectile-mode nil "projectile")
           (clojure-mode "clj" "clojure-mode")
           (haskell-interactive-mode nil "haskell-interactive-mode")))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "clojure-mode" clojure-mode "clj")

(provide 'thch-modeline)
