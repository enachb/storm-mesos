#!/bin/sh

# get release version from projet.clj
RELEASE=`head -1 project.clj | awk '{print $3}' | sed -e 's/\"//' | sed -e 's/\"//'`

# clean up previous distribution
rm *mesos*tgz

# Package up all the project's files into a jar file.
lein jar

# Create temporary build folder and copy storm
mkdir _release
cp $1 _release/
cd _release

# Prepare storm distribution
unzip *.zip
rm *zip
mv storm* storm

# Copy mesos and protobuf lib
cd ..
cp lib/*.jar _release/storm/lib/

# Copy storm-mesos-RELEASE.jar
cp target/storm-mesos-$RELEASE.jar _release/storm/lib/

# Copy storm-mesos bin
cp bin/storm-mesos _release/storm/bin/

# Copy dcc-nimbus bin
cp bin/dcc-nimbus _release/storm/bin/

# Copy the ZMQ native lib
mkdir _release/storm/native
cp zmqlibs/linux/* _release/storm/native/

# Copy the storm configuration file
cp storm.yaml _release/storm/conf/storm.yaml

# Build the release
cd _release
mv storm storm-mesos-$RELEASE
tar -czf storm-mesos-$RELEASE.tgz storm-mesos-$RELEASE
cp storm-mesos-$RELEASE.tgz ../
cd ..

# Clean up
rm -rf _release
