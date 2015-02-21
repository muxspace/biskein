#!/bin/bash
# Configure a machine using a Heroku buildpack. This is based on the now
# deprecated cedar stack, which is derived from Ubuntu 10.04
# 1. Bootstrap the environment. This prepares the box to run a buildpack and
#    is run at provision time
#    https://raw.githubusercontent.com/zatonovo/biskein/master/bootstrap.sh
# 2. Install application (also installs buildpack)
#    ./biskein/install_app <url>

sudo sh -c "echo 'deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) main' >> /etc/apt/sources.list"
sudo apt-get update

sudo apt-get -y install python-software-properties
sudo apt-get -y install software-properties-common

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
#sudo add-apt-repository -y ppa:webupd8team/java
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get update

# Install core libraries
sudo apt-get -y install libcurl4-openssl-dev libzip-dev libbz2-dev libxml2-dev libpq-dev

# Install core languages
#sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install openjdk-6-jdk
#sudo apt-get -y install ruby-full rubygems


# Install core applications
#sudo apt-get -y install autoconf
#sudo apt-get -y install automake
sudo apt-get -y install curl
sudo apt-get -y install git 
sudo apt-get -y install git-core

sudo apt-get -y install supervisor
#sudo gem install foreman


sudo sh -c "echo 'set -o vi' >> /etc/profile"
sudo sh -c "echo 'export GIT_SSL_NO_VERIFY=true' >> /etc/profile"

cd ~
git clone https://github.com/zatonovo/biskein.git
