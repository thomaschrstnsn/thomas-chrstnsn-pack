(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq thch-org-todo "☛ TODO")
(setq thch-org-in-progress "▶ IN-PROGRESS")
(setq thch-org-verification "◼ VERIFICATION")
(setq thch-org-waiting "⌛ WAITING")
(setq thch-org-done "✔ DONE")
(setq thch-org-fail "✘ FAIL")
(setq thch-org-delegated "✉☜ DELEGATED")
(setq thch-org-cancelled "✘ CANCELLED")

(setq org-todo-keywords
      `((sequence ,thch-org-todo
                  ,thch-org-in-progress
                  ,thch-org-verification
                  ,thch-org-waiting
                  "|"
                  ,thch-org-done
                  ,thch-org-fail
                  ,thch-org-delegated
                  ,thch-org-cancelled)))

(setq org-todo-keyword-faces
      `((,thch-org-todo . (:foreground "firebrick2" :weight bold))
        (,thch-org-in-progress . (:foreground "olivedrab" :weight bold))
        (,thch-org-verification . (:foreground "sienna" :weight bold))
        (,thch-org-waiting . (:foreground "dimgrey" :weight italic))
        (,thch-org-done . (:foreground "forestgreen" :weight bold))
        (,thch-org-delegated . (:foreground "dimgrey" :weight bold))
        (,thch-org-fail . (:foreground "steelblue" :weight bold))
        (,thch-org-cancelled . shadow)))

(provide 'thch-org)
