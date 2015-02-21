#!/bin/bash
# Configure a machine using a Heroku buildpack.
# 1. Bootstrap the environment. This prepares the box to run a buildpack and
#    is run at provision time
# 2. Install buildpack
# 3. Install application
#
# e.g.
#    ./biskein/install_buildpack <url>
#    ./biskein/install_app <url>

# Install core languages
sudo sh -c "echo 'deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) main' >> /etc/apt/sources.list"
sudo apt-get update

sudo apt-get -y install python-software-properties
sudo apt-get -y install software-properties-common

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo add-apt-repository -y ppa:webupd8team/java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

sudo apt-get update
sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install gcc-4.9
sudo apt-get -y install gfortran


# Install core applications
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install git

sudo apt-get -y install supervisor


git clone https://github.com/zatonovo/biskein.git
