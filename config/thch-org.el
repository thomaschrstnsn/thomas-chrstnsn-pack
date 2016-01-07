(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "VERIFICATION" "WAITING" "|"  "DONE" "FAIL" "DELEGATED" "CANCELLED")))

(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "firebrick2" :weight bold))
        ("IN-PROGRESS"  . (:foreground "olivedrab" :weight bold))
        ("VERIFICATION"  . (:foreground "sienna" :weight bold))
        ("WAITING"  . (:foreground "dimgrey" :weight italic))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("DELEGATED"  . (:foreground "dimgrey" :weight bold))
        ("FAILED"  . (:foreground "steelblue" :weight bold))
        ("CANCELED"  . shadow)))

(provide 'thch-org)
