;; to load solarized use the below and skip stable/colour-pack from ~/.emacs-live.el
;; (live-add-pack-lib "solarized-emacs")
;; (setq solarized-distinct-fringe-background t)
;; (require 'solarized)
;; (load-theme 'solarized t)

;; if nothing specified defaults to this
;; (color-theme-cyberpunk)

(live-add-pack-lib "themes")
(live-add-pack-lib "spacegray-theme")

(require 'prez-theme)
(require 'spacegray-theme)

(defun use-presentation-theme ()
  (interactive)
  (print "using presentation")
  (disable-theme 'spacegray)
  (load-theme 'prez t)
  (when (boundp 'thchrstnsn/presentation-font)
    (set-face-attribute 'default nil :font thchrstnsn/presentation-font)))

(defun use-default-theme ()
  (interactive)
  (print "using default-theme")
  (disable-theme 'prez)
  (load-theme 'spacegray t)
  (when (boundp 'thchrstnsn/default-font)
    (set-face-attribute 'default nil :font thchrstnsn/default-font)))

(defun toggle-presentation-mode ()
  (interactive)
  (if (string= (frame-parameter nil 'font) thchrstnsn/default-font)
      (use-presentation-theme)
    (use-default-theme)))

(global-set-key (kbd "H-p") 'toggle-presentation-mode)

;; don't ask - seems to resolve stupid highlight current line issue (foreground ~= background)
(use-presentation-theme)
(use-default-theme)

(provide 'theme)
