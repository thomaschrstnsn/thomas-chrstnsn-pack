## Thomas Christensen's personalized emacs-live config-pack

Best used with a `~/.emacs-live.el` containing:

```elisp
(live-use-packs '(live/foundation-pack
                ; live/colour-pack ;; skipped to allow embedded solarized-dark theme to load
                  live/clojure-pack
                  live/lang-pack
                  live/power-pack
                  live/bindings-pack))

(live-add-packs '(~/src/thomas-chrstnsn-pack) ; or where ever you've cloned this repo
                )
```

### Depends on:
* The excellent Emacs Live configuration bundle: http://overtone.github.io/emacs-live/

### Contains:
* Solarized dark color-theme
* Powerline
* My prefered settings

Enjoy.
