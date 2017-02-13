![Magento 2](https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png)

#  Magento 2 Docker to Development

### Apache 2.4 + PHP 7.0.15 + OPCache + MariaDB + Magerun + DevAlias

[![Build Status](https://travis-ci.org/clean-docker/Magento2.svg?branch=master)](https://travis-ci.org/clean-docker/Magento2)
![Build Status](https://images.microbadger.com/badges/image/rafaelcgstz/magento2.svg)

This cluster ready docker-compose infrastructure.

#### Copy and run

```
git clone https://github.com/clean-docker/Magento2.git m2-docker &&
cd m2-docker &&
docker-compose up -d ;
docker ps
```

#### Projects folder

There is a folder in this project calling **./magento2**, this folder is the folder **/var/www/html/** inside your container, is the folder that you will work on.

#### Access the container Docker

To access in you browser you can use http://localhost ( I recommend change your /etc/hosts ).

```
docker exec -ti m2docker_apache_1 bash
```

#### Install Magento 2

You can access in this URL http://localhost/magento2/ after installed with this commands below.

```
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento2
```

#### Access the MySQL

In your terminal out of the container run this command.

```
mysql -u root -proot -h 0.0.0.0 -P 3300
```

To know what is the IP to use in the Magento 2 installation (Database Server Host), you can use this command out the container.

```
docker inspect m2docker_db_1 | grep IPAddress
```

#### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
