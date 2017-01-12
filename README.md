<h1 align="center">
  <br>
    <img src="https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png" alt="Magento 2 Docker" width="128" height="128">
  <br>
  Magento 2 Docker to Development
  <br>
  <br>
</h1>

<h4 align="center">Apache 2.4 + PHP 7.0.8 + OPCache + MariaDB + Magerun + DevAlias</h4>

<p align="center">  
  <a href="https://travis-ci.org/clean-docker/Magento2"><img src="https://travis-ci.org/clean-docker/Magento2.svg?branch=master" alt="Build Status"></a>       
  <a href="https://microbadger.com/images/rafaelcgstz/magento2"><img src="https://images.microbadger.com/badges/image/rafaelcgstz/magento2.svg" alt="Build Status"></a>   
</p>

This cluster ready docker-compose infrastructure.

### Copy and run

```
git clone https://github.com/clean-docker/Magento2.git m2-docker &&
cd m2-docker &&
docker-compose up -d ;
docker ps
```

### Projects folder

There is a folder with the name **magento2**, this folder is the folder **/var/www/html/** inside your container.

### Access the container Docker

To access in you browser you can use http://localhost ( I recommend change your /etc/hosts ).

```
docker exec -ti m2docker_apache_1 bash
```

### Install Magento 2

You can access in this URL http://localhost/magento/ after installed with this commands below.

```
magerun install
```

OR

```
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento
```

### Access the MySQL

In your terminal out of the container run this command.

```
mysql -u root -proot -h 0.0.0.0 -P 3300
```

To know what is the IP to use in the Magento 2 installation (Database Server Host), you can use this command out the container.

```
docker inspect m2docker_db_1 | grep IPAddress
```

### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
