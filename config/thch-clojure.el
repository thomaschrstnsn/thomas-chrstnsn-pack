(setq nrepl-hide-special-buffers t)
(setq cider-repl-result-prefix ";; => ")

(require 'clojure-mode)

;; om-tools' defcomponent makes these available without reify, help indentation
(define-clojure-indent
  (render 1)
  (render-state 1)
  (init-state 1)
  (will-mount 1)
  (did-mount 1)
  (should-update 1)
  (will-receive-props 1)
  (will-update 1)
  (did-update 1)
  (display-name 1)
  (will-unmount))

(defun cider-switch-to-repl-buffer-and-eval (s)
  (cider-switch-to-relevant-repl-buffer nil)
  (goto-char (point-max))
  (insert s)
  (cider-repl-return))

(defun cider-reset ()
  (interactive)
  (cider-switch-to-repl-buffer-and-eval "(user/reset)"))

(defun cider-refresh ()
  (interactive)
  (cider-switch-to-repl-buffer-and-eval "(clojure.tools.namespace.repl/refresh)"))

(defun cider-tests ()
  (interactive)
  (cider-switch-to-repl-buffer-and-eval "(user/run-tests)"))

(defun cider-clojure-tests ()
  (interactive)
  (cider-switch-to-repl-buffer-and-eval "(user/reload-and-run-clojure-tests)"))

(defun cider-toggle-repl-buffer ()
  (interactive)
  (if (string/starts-with (buffer-name) "*cider")
      (progn
        (cider-switch-to-last-clojure-buffer)
        (delete-other-windows))
    (cider-switch-to-relevant-repl-buffer nil)))

(provide 'thch-clojure)
