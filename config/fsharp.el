(live-add-pack-lib "fsharpbinding/emacs")

(autoload 'fsharp-mode "fsharp-mode"     "Major mode for editing F# code." t)
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))

(provide 'fsharp)
