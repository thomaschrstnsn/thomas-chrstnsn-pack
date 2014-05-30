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
    (setq frame-title-format '(buffer-file-name "%f" ("%b")))))

;; Do this for initial frame...
(my-make-frame-hook)

(defun fontify-frame (frame)
  (interactive)
  (if window-system
      (progn
        (if (> (x-display-pixel-width) 2000)
            (set-frame-parameter frame 'font "M+_2m-19")
         (set-frame-parameter frame 'font "M+_2m-16")))))

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
