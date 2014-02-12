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
    (raise-frame)))

;; Do this for initial frame...
(my-make-frame-hook)

;; ...and for any subsequently created frame.
(add-hook 'after-make-frame-functions
          '(lambda (frame)
             (select-frame frame)
             (my-make-frame-hook)))

;; ma' font
(add-to-list 'default-frame-alist '(font . "PragmataPro-19"))

;; default frame sizes
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 135))

(live-add-pack-lib "zoom-frm")
(require 'zoom-frm)
