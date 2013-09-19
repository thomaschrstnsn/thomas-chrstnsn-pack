(setq nrepl-port "1234")

;; remove the "silly" font-hack for #{:a} => ∈{:a}
(font-lock-remove-keywords 'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil)))))

(defun nrepl-switch-to-repl-buffer-and-eval (s)
  (nrepl-switch-to-relevant-repl-buffer nil)
  (goto-char (point-max))
  (insert s)
  (nrepl-return))

(defun nrepl-reset ()
  (interactive)
  (nrepl-switch-to-repl-buffer-and-eval "(user/reset)"))

(defun nrepl-refresh ()
  (interactive)
  (nrepl-switch-to-repl-buffer-and-eval "(clojure.tools.namespace.repl/refresh)"))

(defun nrepl-toggle-repl-buffer ()
  (interactive)
  (if (string/starts-with (buffer-name) "*nrepl")
      (progn
        (nrepl-switch-to-last-clojure-buffer)
        (delete-other-windows))
    (nrepl-switch-to-relevant-repl-buffer nil)))

(live-add-pack-lib "helm")
(live-add-pack-lib "clojure-cheatsheet")
(require 'helm-config)
(require 'clojure-cheatsheet)
