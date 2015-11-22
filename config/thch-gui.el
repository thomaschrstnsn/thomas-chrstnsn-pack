(defun my-make-frame-hook ()
  (when (window-system)
    ;; highlight current line, always
    (global-hl-line-mode 1)

    ;; Don't defer screen updates when performing operations
    (setq redisplay-dont-pause t)

    ;; no blinkies
    (blink-cursor-mode -1)

    ;; no tooltips
    (tooltip-mode -1)

    ;; show full path to current file
    (setq frame-title-format '(buffer-file-name "%f" ("%b")))

    ;; bigger fringe
    (fringe-mode '(10 . 0))

    (when prelude-theme
      (load-theme prelude-theme t)))
  (when (not window-system)
    (menu-bar-mode -1)))

(prelude-require-package thch-theme-package)

;; Do this for initial frame...
(my-make-frame-hook)

(defun fontify-frame (frame)
  (interactive)
  (if window-system
      (progn
        (setq thchrstnsn/default-font "-apple-PragmataPro-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
        (setq thchrstnsn/presentation-font "-apple-PragmataPro-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")
        (when (> (x-display-pixel-width) 2000)
          (setq thchrstnsn/default-font "-apple-PragmataPro-medium-normal-normal-*-21-*-*-*-m-0-iso10646-1")
          (setq thchrstnsn/presentation-font "-apple-PragmataPro-medium-normal-normal-*-21-*-*-*-m-0-iso10646-1"))
        (unless (or (string= (frame-parameter nil 'font) thchrstnsn/default-font)
                    (string= (frame-parameter nil 'font) thchrstnsn/presentation-font))
                (set-face-attribute 'default nil :font thchrstnsn/default-font)))))

;; Fontify current frame
(fontify-frame nil)

;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)

;; ...and for any subsequently created frame.
(add-hook 'after-make-frame-functions
          '(lambda (frame)
             (select-frame frame)
             (my-make-frame-hook)))

;; default frame sizes
(add-to-list 'default-frame-alist '(height . 36))
(add-to-list 'default-frame-alist '(width . 120))

;; less than default
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq visible-bell nil)

(provide 'thch-gui)
