(defproject storm/storm-mesos "0.9.0-SNAPSHOT"
   :description "Storm integration with the Mesos cluster manager"
   :source-path "src/clj"
   :java-source-path "src/jvm"
   :javac-options {:debug "true" :fork "true"}
   :repositories {"releases" "http://repo1.maven.org/maven2"
                  "snapshots" "http://repo1.maven.org/maven2"}
   :dependencies [
   [org.apache.mesos/mesos "0.11.0-incubating"]
   [storm/storm "0.9.0-SNAPSHOT"]
 ]

   :dev-dependencies [
   [storm "0.9.0-SNAPSHOT"]
   [org.clojure/clojure "1.4.0"]
 ])
