# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Configuration de la machine virtuelle proxy
  config.vm.define :proxy do |c|
    c.vm.box = "debian7_amd64-2"
    c.vm.network :private_network, ip: "10.7.0.102"
    c.vm.hostname = "proxy.srv.gov.pf"
    c.vm.provision :shell do |shell|
      shell.path = "bootstrap/proxy-bootstrap.sh"
    end
  end

  # Configuration de la machine virtuelle puppetmaster
  config.vm.define :puppetmaster do |c|
    c.vm.box = "debian7_amd64-2"
    c.vm.network :private_network, ip: "10.7.0.11"
    c.vm.hostname = "puppetmaster.srv.gov.pf"
    c.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    c.vm.synced_folder "modules/", "/etc/puppet/modules"
    c.vm.provision :shell do |shell|
      shell.path = "bootstrap/puppetmaster-bootstrap.sh"
    end
  end

  # Configuration de la machine virtuelle TEFENUA
  config.vm.define :tefenua do |c|
    c.vm.box = "debian7_amd64-2"
    c.vm.network :private_network, ip: "10.7.0.100"
    c.vm.hostname = "tefenua.srv.gov.pf"
  end

  # Configuration de la machine virtuelle REPOSITORY
  config.vm.define :repository do |c|
    c.vm.box = "debian7_amd64-2"
    c.vm.network :private_network, ip: "10.7.0.254"
    c.vm.network :forwarded_port, guest: 80, host: 48080
    c.vm.hostname = "repository.gov.pf"
  end

end
