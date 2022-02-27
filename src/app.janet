(import /src/gui.core :as gui)
(import /src/parse.core :as zone)

# (defn main [& xs]
#   (pp "x")
#   # (gui/init)
#   # (gui/message "My first GUI" "Greetings from the GUI")
#   # (gui/main-loop)
#   # (gui/close)
#   )

(defn main [& xs]
  (unless (> (length (dyn :args)) 1)
    (print (string "Usage: ./app.bin <path to logfile> <player name>"))
    (os/exit 1))
  (pp xs)
  (pp "Begin gui")
  (zone/set-player-name (get (dyn :args) 1))
  (zone/parse-current-zone-file)
  (zone/init-player (first (dyn :args )))
  (pp "done parse")
  (gui/main)
  # (gui/main
  #  (zone/get-points "ecommons")
  #  #(zone/get-points "./resources/zones/ecommons.txt")
  #  #(zone/get-points "./resources/zones/everfrost.txt")
  #  (zone/get-player))
  (pp "Hello"))
