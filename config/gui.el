(add-to-list 'default-frame-alist '(font . "PragmataPro-18"))
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 135))

; highlight current line, always
(global-hl-line-mode 1)

; show full path to current file
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
