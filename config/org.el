;; org-mode

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; MobileOrg
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(if (file-exists-p "~/Desktop/Dropbox/Apps/MobileOrg")
    (setq org-mobile-directory "~/Desktop/Dropbox/Apps/MobileOrg"))
(if (file-exists-p "~/Dropbox/Apps/MobileOrg")
    (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg"))

(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "VERIFICATION" "|"  "DONE" "FAIL" "DELEGATED" "CANCELLED")))

(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "firebrick2" :weight bold))
        ("IN-PROGRESS"  . (:foreground "olivedrab" :weight bold))
        ("VERIFICATION"  . (:foreground "sienna" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("DELEGATED"  . (:foreground "dimgrey" :weight bold))
        ("FAILED"  . (:foreground "steelblue" :weight bold))
        ("CANCELED"  . shadow)))
