(setq nrepl-port "1234")

;; remove the "silly" font-hack for #{:a} => ∈{:a}
(font-lock-remove-keywords 'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil)))))

(defun nrepl-reset ()
  (interactive)
  (set-buffer "*nrepl*")
  (goto-char (point-max))
  (insert "(user/reset)")
  (nrepl-return))

(defun nrepl-refresh ()
  (interactive)
  (set-buffer "*nrepl*")
  (goto-char (point-max))
  (insert "(clojure.tools.namespace.repl/refresh)")
  (nrepl-return))

(live-add-pack-lib "helm")
(live-add-pack-lib "clojure-cheatsheet")
(require 'helm-config)
(require 'clojure-cheatsheet)
