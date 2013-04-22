## Thomas Christensens personalized emacs-live config-pack

Best used with a .emacs-live.el containing:

  (live-use-packs '(live/foundation-pack
                  ; live/colour-pack
                    live/clojure-pack
                    live-lang-pack
                    live/power-pack))

  (live-add-packs '(~/src/thomas-chrstnsn-pack
                    ~/src/solarized-pack))

Where src/solarized-pack is a checkout of git://github.com/siancu/solarized-pack.git
