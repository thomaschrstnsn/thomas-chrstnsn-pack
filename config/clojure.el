(require 'cider)

(setq cider-port "1234")

(setq nrepl-hide-special-buffers t)
(setq cider-repl-result-prefix ";; => ")

;; remove the "silly" font-hack for #{:a} => ∈{:a}
(font-lock-remove-keywords 'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil)))))

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

(defun cider-toggle-repl-buffer ()
  (interactive)
  (if (string/starts-with (buffer-name) "*cider")
      (progn
        (cider-switch-to-last-clojure-buffer)
        (delete-other-windows))
    (cider-switch-to-relevant-repl-buffer nil)))

(live-add-pack-lib "helm")
(require 'helm-config)

(live-add-pack-lib "clojure-cheatsheet")
(require 'clojure-cheatsheet)
