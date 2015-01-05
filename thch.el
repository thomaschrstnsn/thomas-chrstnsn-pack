;; presumes Emacs Prelude is installed into ~/.emacs.d
;; copy this file goes into ~/.emacs.d/personal

;; change this path to the git checkout where you found this
(defvar thch-root-dir "/Users/thomas/src/thomas-chrstnsn-pack")

(add-to-list 'load-path thch-root-dir)

(load "thch-init.el")
