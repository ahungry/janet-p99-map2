(declare-project
 :name "janet-p99-map2"
 :description "Project1999 Map using ahungry-janet"
 :author "Matthew Carter"
 :license "GPLv3"
 :url "https://github.com/ahungry/janet-p99-map2"
 :repo "git+https://github.com/ahungry/janet-p99-map2.git"
 # Optional urls to git repositories that contain required artifacts.
 :dependencies
 [
  {
   :repo "https://github.com/ahungry/ahungry-janet.git"
   # :tag
   # "38e4702c57f78d48c301bc1f390a6856c8011374"
   }]
 )

(declare-executable
 :name "user.bin"
 :cflags ["-std=c99" "-Wall" "-Wextra"]
 :lflags
 [
  "-L/usr/local/lib/janet/.cache/https___github.com_ahungry_ahungry-janet.git/build/linux/iup"
  "-L/usr/local/lib/janet/.cache/https___github.com_ahungry_ahungry-janet.git/build/linux/im"]
 :entry "user.janet")
