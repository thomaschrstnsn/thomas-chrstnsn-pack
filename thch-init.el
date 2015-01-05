(defvar thch-config-dir (expand-file-name "config" thch-root-dir)
  "The primary configuration directory for thomas-chrstnsn-pack")

(add-to-list 'load-path thch-config-dir)

(defvar thch-lib-dir (expand-file-name "lib" thch-root-dir)
  "The external library directory for thomas-chrstnsn-pack")

(add-to-list 'load-path thch-lib-dir)

(load "thch-core.el")

(safe-load "thch-prelude-modules.el")

(safe-load "thch-gui.el")
(safe-load "thch-buffers.el")
(safe-load "thch-themes.el")
(safe-load "thch-modeline.el")

(safe-load "thch-clojure.el")
(safe-load "thch-org.el")
(safe-load "thch-haskell.el")

(safe-load "thch-bindings.el")

(safe-load-check)

(provide 'thch-init)
