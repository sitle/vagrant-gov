#!/bin/bash
DISTRIBUTION=wheezy

# Configuration du proxy
function add_proxy {
  cat > /etc/apt/apt.conf.d/00proxy << EOF
Acquire::http { Proxy "http://10.7.0.102:3142"; };
EOF
}

# Mises à jours du système
function upgrade_system {
  aptitude -q -y update
  aptitude -q -y upgrade
  aptitude -q -y dist-upgrade
}

# Installation des dépots puppetlabs
function install_puppetlabs {
  # Téléchargement du paquet puppetlabs
  wget -q http://apt.puppetlabs.com/puppetlabs-release-${DISTRIBUTION}.deb

  # Installation du paquet puppetlabs
  dpkg -i puppetlabs-release-${DISTRIBUTION}.deb

  # Prise en compte du nouveau dépot
  aptitude -q -y update
}

# Modification du fichier hosts
function update_hosts {
  # Modification du fichier /etc/hosts
  cat > /etc/hosts << EOF
127.0.0.1 localhost
10.7.0.102 proxy.srv.gov.pf proxy
10.7.0.11 puppetmaster.srv.gov.pf puppetmaster puppet
10.7.0.100 debnode.srv.gov.pf debnode
10.7.0.101 centnode.srv.gov.pf centnode

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF
}

# Si centnode ou debnode alors on configure le proxy
if [ "$1" = proxy ]; then
  echo "Installation du proxy"
else
  add_proxy
fi

upgrade_system
update_hosts

# Si le dépot puppetlabs n'est pas présent sur le système, c'est que puppetdb n'est pas installé
if [ ! -f /etc/apt/sources.list.d/puppetlabs.list ]; then
  install_puppetlabs
  aptitude -q -y install puppet &> /dev/null
  cat > /etc/default/puppet <<EOF
# Defaults for puppet - sourced by /etc/init.d/puppet

# Enable puppet agent service?
# Setting this to "yes" allows the puppet agent service to run.
# Setting this to "no" keeps the puppet agent service from running.
START=yes

# Startup options
DAEMON_OPTS=""

EOF

fi


