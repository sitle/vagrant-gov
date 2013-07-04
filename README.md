Ce projet permet de constituer une envrionnement de développement de module puppet. Il est nécessaire de récupérer les paquets suivant :

* vagrant 1.2.2 (http://downloads.vagrantup.com/)
* virtualbox 4.2.12 (http://www.virtualbox.org)

Il faut ensuite créer un répertoire et récupérer les sources :
```
  $ mkdir -p Devellopement/{boxes,manifests,modules}
  $ cd Devellopement
  $ git clone https://github.com/sitle/vagrant.git
```

On récupére les boxes et on les intégre à Vagrant :
```
  $ cd Devellopement/boxes
  $ wget https://github.com/sitle/debian7_amd64-2.box
  $ wget https://github.com/sitle/centos6_amd64-1.box
  $ vagrant box add debian7_amd64-2 debian7_amd64-2.box
  $ vagrant box add centos6_amd64-1 centos6_amd64-1.box
```

Nous pouvons dès lors construire notre environnement de développement :
```
  $ vagrant up proxy
  $ vagrant up puppetmaster
  $ vagrant up debnode
  $ vagrant up centnode
```

