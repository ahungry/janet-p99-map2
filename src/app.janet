(import /src/gui.core :as gui)
(import /src/parse.core :as zone)

(defn main [& xs]
  (unless (> (length (dyn :args)) 2)
    (print (string "Usage: ./app.bin <path to logfile> <player name>"))
    (os/exit 1))
  (def logfile-name (get (dyn :args) 1))
  (def player-name (get (dyn :args) 2))

  (pp (string "Logfile: " logfile-name))
  (pp (string "Player: " player-name))

  (zone/set-player-name player-name)
  (zone/parse-current-zone-file)
  (zone/init-logfile logfile-name)

  (pp "done parse")
  (gui/main)
  # (gui/main
  #  (zone/get-points "ecommons")
  #  #(zone/get-points "./resources/zones/ecommons.txt")
  #  #(zone/get-points "./resources/zones/everfrost.txt")
  #  (zone/get-player))
  (pp "Hello"))
