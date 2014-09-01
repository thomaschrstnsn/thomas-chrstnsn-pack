;; to load solarized use the below and skip stable/colour-pack from ~/.emacs-live.el
;; (live-add-pack-lib "solarized-emacs")
;; (setq solarized-distinct-fringe-background t)
;; (require 'solarized)
;; (load-theme 'solarized t)

;; if nothing specified defaults to this
;; (color-theme-cyberpunk)

(live-add-pack-lib "themes")
(live-add-pack-lib "zenburn-theme")

(require 'prez-theme)
(require 'zenburn-theme)

(setq thchrstnsn/presentation-theme 'prez)
(setq thchrstnsn/default-theme 'zenburn)

(defun use-presentation-theme ()
  (interactive)
  (print "using presentation")
  (disable-theme thchrstnsn/default-theme)
  (load-theme thchrstnsn/presentation-theme t)
  (when (boundp 'thchrstnsn/presentation-font)
    (set-face-attribute 'default nil :font thchrstnsn/presentation-font)))

(defun use-default-theme ()
  (interactive)
  (print "using default-theme")
  (disable-theme thchrstnsn/presentation-theme)
  (load-theme thchrstnsn/default-theme t)
  (when (boundp 'thchrstnsn/default-font)
    (set-face-attribute 'default nil :font thchrstnsn/default-font)))

(defun toggle-presentation-mode ()
  (interactive)
  (if (string= (frame-parameter nil 'font) thchrstnsn/default-font)
      (use-presentation-theme)
    (use-default-theme)))

(global-set-key (kbd "H-p") 'toggle-presentation-mode)

(use-default-theme)

(provide 'theme)
