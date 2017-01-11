# Magento 2 Docker to Development

Apache 2.4 + PHP 7.0.8 + OPCache + MariaDB + Magerun + DevAlias

[![Build Status](https://travis-ci.org/clean-docker/Magento2.svg?branch=master)](https://travis-ci.org/clean-docker/Magento2)
[![Microbadger](https://images.microbadger.com/badges/image/rafaelcgstz/magento2.svg)](https://microbadger.com/images/rafaelcgstz/magento2 "Get your own image badge on microbadger.com")

This cluster ready docker-compose infrastructure.

### Copy and run

```
git clone https://github.com/clean-docker/Magento2.git m2-docker &&
cd m2-docker &&
docker-compose up -d ;
docker ps
```

After start your containers you can utilize these commands below inside of your containers.

### Install Magento 2

Access you folder `/var/www/html` and run this command:

```
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento2
```

### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
