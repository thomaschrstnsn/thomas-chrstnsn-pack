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
(setq org-mobile-directory "~/Desktop/Dropbox/Apps/MobileOrg")
