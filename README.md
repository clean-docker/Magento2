![Magento 2](https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png)

#  Magento 2 Docker to Development

### Apache 2.4 + PHP 7.0.24 + OPCache + MariaDB
### N98 Magerun 2 + XDebug + Redis

[![Build Status](https://travis-ci.org/clean-docker/Magento2.svg?branch=master)](https://travis-ci.org/clean-docker/Magento2)
[![Build Status](https://images.microbadger.com/badges/image/rafaelcgstz/magento2.svg)](https://microbadger.com/images/rafaelcgstz/magento2)

This cluster ready docker-compose infrastructure.

#### How to use

Execute in your terminal, change the *MAGENTO2* to use the name of your project:

```
curl -s https://github.com/clean-docker/Magento2/blob/master/init.sh | bash -s MAGENTO2
```

#### Projects folder

There is a folder in this project calling **./src**, this folder is the folder **/var/www/html/** inside your container, is the folder that you will work on.

#### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
