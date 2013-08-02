# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Configuration de la machine virtuelle proxy
  config.vm.define :proxy do |c|
    c.vm.box = "debian7_amd64-3"
    c.vm.network :private_network, ip: "10.7.0.102"
    c.vm.hostname = "proxy.srv.gov.pf"
    c.vm.provision :shell do |shell|
      shell.path = "bootstrap/proxy-bootstrap.sh"
    end
    c.vm.provider "virtualbox" do |v|
      v.name = "proxy"
    end
  end

  # Configuration de la machine virtuelle puppetmaster
  config.vm.define :puppetmaster do |c|
    c.vm.box = "debian7_amd64-3"
    c.vm.network :private_network, ip: "10.7.0.11"
    c.vm.hostname = "puppetmaster.srv.gov.pf"
    c.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    c.vm.synced_folder "modules/", "/etc/puppet/modules"
    c.vm.synced_folder "hieradata/", "/etc/puppet/hieradata"
    c.vm.provision :shell do |shell|
      shell.path = "bootstrap/puppetmaster-bootstrap.sh"
    end
    c.vm.provider "virtualbox" do |v|
      v.name = "puppermaster"
    end
  end

  # Configuration de la machine virtuelle debbox
  config.vm.define :debbox do |c|
    c.vm.box = "debian7_amd64-3"
    c.vm.provider "virtualbox" do |v|
      v.name = "debbox"
    end
  end

  # Configuration de la machine virtuelle centbox
  config.vm.define :centbox do |c|
    c.vm.box = "centos6_amd64-1"
    c.vm.provider "virtualbox" do |v|
      v.name = "centbox"
    end
  end

  # Configuration de la machine virtuelle debnode
  config.vm.define :debnode do |c|
    c.vm.box = "debian7_amd64-3"
    c.vm.network :private_network, ip: "10.7.0.100"
    c.vm.hostname = "debnode.srv.gov.pf"
    c.vm.provision :shell do |shell|
      shell.path = "bootstrap/default-bootstrap.sh"
    end
    c.vm.provider "virtualbox" do |v|
      v.name = "debnode"
    end
  end

  # Configuration de la machine virtuelle centnode
  config.vm.define :centnode do |c|
    c.vm.box = "centos6_amd64-1"
    c.vm.network :private_network, ip: "10.7.0.101"
    c.vm.hostname = "centnode.srv.gov.pf"
  end
end
