;; Load bindings config
(live-load-config-file "bindings.el")
(live-load-config-file "filetypes.el")

;; gui-stuff
(cond
 ((and (window-system) (eq system-type 'darwin))
  (live-load-config-file "fonts.el")))
