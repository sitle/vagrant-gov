# Vagrant-gov

Ce projet permet de constituer une envrionnement de développement pour module puppet. Il est nécessaire de récupérer les logiciels suivant :

* [git](http://git-scm.com/downloads)
* [vagrant](http://downloads.vagrantup.com/)
* [virtualbox](http://www.virtualbox.org)

En fonction de votre distribution, ces logiciels seront plus ou moins simple à installer. Veuillez utiliser les version fournies par oracle pour l'installation de virtualbox.

Remarque : ces logiciels fonctionnent aussi sous Microsoft/Windows.

## Préparation de l'environnement

Il faut créer un répertoire et récupérer le projet :
```bash
mkdir -p infra/{boxes,modules,manifests,hieradata}
cd infra
git clone https://github.com/sitle/vagrant-gov.git .
```
On récupére la box et on l'intégre à Vagrant :
```bash
cd infra/boxes
wget -c https://www.dropbox.com/s/0hze6qfdi0g6p23/debian7_amd64-3.box
vagrant box add debian7_amd64-3 debian7_amd64-3.box
```

## Construction de l'environnement

Nous pouvons dès lors construire notre environnement de développement :
```bash
vagrant up proxy
vagrant up puppetmaster
```
On génère les certificats du serveur proxy :
```bash
vagrant ssh proxy
sudo puppet agent -t test
exit
```
Sur le puppetmaster, il faut signer la demande de certification du proxy :
```bash
vagrant ssh puppetmaster
sudo puppet cert sign proxy.srv.gov.pf
exit
```
Votre environnement est fin prêt à être utilisé.

## Utilisation

Veuillez jeter un coup d'oeil au fichier ```infra/Vagrantfile```. Celui-ci contient la définition de l'environnement de dévelloppement. N'hésitez pas à le modifier pour rajouter de nouvelles machines.
Pour avoir le status des machines virtuelles, il faut taper la commande suivante :
```bash
vagrant status
```
Pour lancer une machine virtuelle :
```bash
vagrant up NOM_DE_VOTRE_MACHINE
```
Pour arrêter une machine virtuelle :
```bash
vagrant halt NOM_DE_VOTRE_MACHINE
```
Pour détruire votre machine virtuelle :
```bash
vagrant destroy NOM_DE_VOTRE_MACHINE
```

## Remarques

* Les systèmes des boxes seront par défaut dans leurs dernières versions disponibles à savoir Debian 7.1 et Centos 6.4 à l'heure actuelle.
* Pour l'instant, seul la box debian est fournie. A terme, la box centos sera disponible. Celui-ci permettra d'écrire des modules pour tout les environnements basés sur RedHat.
* Les boxes sont conçu à partir de modèle fournie dans ce projet (dans les répertoires preseed et kickstart).

