#!/bin/bash

DISTRIBUTION=wheezy

if [ ! -f /home/vagrant/puppetlabs-release-wheezy.deb ]; then

  # Configuration par défaut  
  source /vagrant/bootstrap/default-bootstrap.sh
  
  # Configuration pour wheezy
  if [ "$DISTRIBUTION" = "wheezy" ]; then
    # Installation du paquet puppetmaster
    aptitude -q -y install puppetmaster &> /dev/null
    invoke-rc.d puppetmaster stop
    
    # Modification du fichier /etc/default/puppetmaster pour désactiver son démarage
    cat > /etc/default/puppetmaster << EOF
# Defaults for puppetmaster - sourced by /etc/init.d/puppetmaster

# Enable puppetmaster service? 
# Setting this to "yes" allows the puppet master service to run.
# Setting this to "no" keeps the puppet master service from running.
#
# If you are using Passenger, you should have this set to "no."
START=yes

# Startup options
DAEMON_OPTS=""

# On what port should the puppet master listen? (default: 8140)
PORT=8140
EOF

    # Installation du paquet puppetmaster-passenger
    aptitude -q -y install puppetmaster-passenger ca-certificates &> /dev/null
  fi
fi


