#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y build-essential unzip cmake mercurial \
  uuid-dev libgtest-dev libpng-dev libsqlite3-dev \
  zlib1g-dev libboost-all-dev libjsoncpp-dev \
  libgdcm2-dev libpugixml-dev

rm -rf home/vagrant/orthanc-webviewer
hg clone https://code.google.com/p/orthanc-webviewer/
rm -rf /home/vagrant/OrthancViewerBuild
    mkdir /home/vagrant/OrthancViewerBuild
cd /home/vagrant/OrthancViewerBuild
export CXXFLAGS=-isystem\ /home/vagrant/OrthancBuild/include
cmake -DUSE_GTEST_DEBIAN_SOURCE_PACKAGE=ON -DALLOW_DOWNLOADS=ON \
      -DCMAKE_REQUIRED_INCLUDES= /home/vagrant/OrthancBuild/include \
      /home/vagrant/orthanc-webviewer
make
cd /home/vagrant
