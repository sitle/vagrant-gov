#!/bin/bash

DISTRIBUTION=wheezy

if [ ! -f /home/vagrant/puppetlabs-release-wheezy.deb ]; then
  
  # Configuration par défaut
  source /vagrant/bootstrap/default-bootstrap.sh proxy
  
  if [ "$DISTRIBUTION" = wheezy ]; then
    aptitude -q -y install apt-cacher-ng
  fi
fi
