; highlight current line, always
(global-hl-line-mode 1)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; no blinkies
(blink-cursor-mode -1)

;; ma' font
(add-to-list 'default-frame-alist '(font . "PragmataPro-19"))

;; default frame sizes
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 135))

;; no tooltips
(tooltip-mode -1)

;; show full path to current file
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
