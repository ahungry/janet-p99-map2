# A simple queue system

(def queue @{})

(defn subscribe
  "When QUEUE receives EVENT, apply F to the payload."
  [queue event f]
  (unless (get queue event)
    (put queue event @[]))
  (let [f-list (get queue event)]
    (array/push f-list f)))

(defn publish
  "Publish an EVENT with PAYLOAD to QUEUE."
  [queue event payload]
  #(pp "In publish")
  (let [f-list (or (get queue event) @[])]
    (map (fn [f] (f {:queue queue
                     :event event
                     :payload payload}))
         f-list)))

(defn publish-async
  "Publish an EVENT with PAYLOAD to QUEUE."
  [queue event payload]
  (let [f-list (or (get queue event) @[])]
    (map (fn [f] (ev/spawn-thread
                  (f {:queue queue
                      :event event
                      :payload payload})))
         f-list)))

(defn make-fn
  "Use with subscribe to build a handler."
  [f]
  (fn [{:queue queue
        :event event
        :payload payload}]
    (f payload)))

(defn make-fn-async
  "Use with subscribe to make a function that'll run in the background."
  [f]
  (fn [{:queue queue
        :event event
        :payload payload}]
    (ev/spawn-thread (f payload))))

# # ### Test the pub/sub stuff
# (subscribe queue ::foo-bar (make-fn (fn [x]
#                                       (pp "beg")
#                                       (pp (get x :a))
#                                       (pp "end"))))

# (subscribe queue ::asyncer (make-fn-async (fn [x]
#                                             (os/sleep 2)
#                                             (pp "asyncer-start")
#                                             (pp x)
#                                             (pp "asyncer-done"))))

# (publish queue ::foo-bar {:a 2})

# (publish-async queue ::foo-bar {:a 99})

# (defn xx []
#   (pp "go")
#   (publish queue ::asyncer {:a 1 :b 2})
#   (pp "end"))

# (identity queue)
