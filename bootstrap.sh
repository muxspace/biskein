#!/bin/bash
# Configure a machine using a Heroku buildpack.
# 1. Bootstrap the environment. This prepares the box to run a buildpack and
#    is run at provision time
# 2. Install application (also installs buildpack)
#
# e.g.
#    ./biskein/install_app <url>

sudo sh -c "echo 'deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) main' >> /etc/apt/sources.list"
sudo apt-get update

sudo apt-get -y install python-software-properties
sudo apt-get -y install software-properties-common

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo add-apt-repository -y ppa:webupd8team/java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get update

# Install core libraries
#sudo apt-get -y install libreadline5
#sudo apt-get -y install libmpfr-dev
#sudo apt-get -y install libgmp-dev
#sudo apt-get -y install build-essential

#cd /usr/lib
#ln -s /usr/lib/x86_64-linux-gnu/libmpfr.so libmpfr.so.1
#ln -s /usr/lib/x86_64-linux-gnu/libgmp.so libgmp.so.3

# Install core languages
#sudo apt-get -y install gfortran
sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install ruby-full


# Install core applications
#sudo apt-get -y install autoconf
#sudo apt-get -y install automake
sudo apt-get -y install curl
sudo apt-get -y install git

sudo apt-get -y install supervisor
sudo gem install foreman


sudo sh -c "echo 'set -o vi' >> /etc/profile"
sudo sh -c "echo 'export GIT_SSL_NO_VERIFY=true' >> /etc/profile"
sudo sh -c "echo '[ -f \"/app/environment.sh\" ] && source /app/environment.sh' >> /etc/profile"

cd ~
git clone https://github.com/zatonovo/biskein.git
