# Description
Ce petit projet est une infrastructure de reverse proxy et loadbalacing basée sur des conteneurs docker nginx. Mon [article de blog](https://foxblog.fr/repartition-de-charge-a-laide-de-nginx-et-docker/) explique plus précisément la mise en place de l'infrastructure. 

Ce projet est encore en cours de développement. La version fonctionnelle est la version 1.0.

# Prérequis

- linux
- docker
- docker-compose

# Utilisation

Cloner le dépôt dans un dossier local. 
```bash
git clone git@github.com:n1c0x/reverse-proxy-dev.git
```

Construire les conteneurs
```bash
sudo docker-compose build
```

Lancer les conteneurs
```bash
sudo docker-compose up
```

Se rendre sur l'URL http://127.0.0.1 et réactualiser la page plusieurs fois pour observer la répartition de charge entre les différents serveurs web. 