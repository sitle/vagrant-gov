Ce projet permet de constituer une envrionnement de développement pour module puppet. Il est nécessaire de récupérer les logiciels suivant :

* git (http://git-scm.com/downloads)
* vagrant 1.2.2 (http://downloads.vagrantup.com/)
* virtualbox 4.2.16 (http://www.virtualbox.org)

En fonction de votre distribution, ces logiciels seront plus ou moins simple à installer.
Il faut savoir que ces logiciels fonctionnent aussi sous Microsoft/Windows.

# Préparation de l'environnement
Il faut créer un répertoire et récupérer le projet :
```
  $ mkdir -p infra/boxes
  $ cd infra
  $ git clone https://github.com/sitle/vagrant-gov.git .
```

On récupére la box et on l'intégre à Vagrant :
```
  $ cd infra/boxes
  $ wget -c https://www.dropbox.com/s/0hze6qfdi0g6p23/debian7_amd64-3.box
  $ vagrant box add debian7_amd64-3 debian7_amd64-3.box
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

Votre environnement est prêt à être utilisé.

# Remarques

* Les systèmes des boxes seront par défaut dans leurs dernières versions disponibles (Debian 7 et Centos 6).
* Pour l'instant, seul la box debian est fournie. A terme, la box centos sera disponible. Celui-ci permettra d'écrire des modules pour tout les environnements basés sur RedHat.
* Les boxes sont conçu à partir de modèle fournie dans ce projet (dans les répertoires preseed et kickstart).

