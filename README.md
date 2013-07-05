Ce projet permet de constituer une envrionnement de développement pour module puppet. Il est nécessaire de récupérer les logiciels suivant :

* vagrant 1.2.2 (http://downloads.vagrantup.com/)
* virtualbox 4.2.12 (http://www.virtualbox.org)

En fonction de votre distribution, ces logiciels seront plus ou moins simple à installer.

# Préparation de l'environnement
Il faut ensuite créer un répertoire et récupérer les sources :
```
  $ mkdir -p infra/boxes
  $ cd infra
  $ git clone https://github.com/sitle/vagrant.git .
```

On récupére les boxes et on les intégre à Vagrant :
```
  $ cd infra/boxes
  $ wget https://github.com/sitle/debian7_amd64-2.box
  $ wget https://github.com/sitle/centos6_amd64-1.box
  $ vagrant box add debian7_amd64-2 debian7_amd64-2.box
  $ vagrant box add centos6_amd64-1 centos6_amd64-1.box
```

Nous pouvons dès lors construire notre environnement de développement :
```
  $ vagrant up proxy
  $ vagrant up puppetmaster
```

On génère les certificats du serveur proxy :
```
  $ vagrant ssh proxy
  $ sudo puppet agent -t test
  $ exit
```

Sur le puppetmaster, il faut signer la demande de certification du proxy :
```
 $ vagrant ssh puppetmaster
 $ sudo puppet cert sign proxy.srv.gov.pf
 $ exit
```


