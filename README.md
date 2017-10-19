![Magento 2](https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png)

#  Magento 2 Docker to Development

### Apache 2.4 + PHP 7.0.24 + OPCache + MariaDB + N98 Magerun 2 + XDebug + Redis

[![Build Status](https://travis-ci.org/clean-docker/Magento2.svg?branch=master)](https://travis-ci.org/clean-docker/Magento2)
[![Build Status](https://images.microbadger.com/badges/image/rafaelcgstz/magento2.svg)](https://microbadger.com/images/rafaelcgstz/magento2)

### MacOS / Linux Requirements

**MacOS (Docker, Docker-compose and Docker-sync)**

```
  brew tap caskroom/cask
  brew cask install docker
  brew install docker-compose
  sudo gem install docker-sync
```

**Linux (Docker, Docker-compose)**

Use this [official Docker tutorial](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).

### How to use

Execute in your terminal, change the *MAGENTO2* to use the name of your project:

```
curl -s https://raw.githubusercontent.com/clean-docker/Magento2/master/init | bash -s MAGENTO2
```

### Panels

Enjoy your new panels!

**Web server:** http://localhost/

**PHPMyAdmin:** http://localhost:8080

**Local emails:** http://localhost:8025

### Features commands

| Commands  | Description  | Options & Examples |
|---|---|---|
| `./init`  | If you didn't use the CURL setup command above please use this command.  | `./init local` |
| `./start`  | If you continuing not using the CURL you can start your container manually  | |
| `./stop`  | Stop your project containers  | |
| `./shell`  | Access your container  | `./shell root` | |
| `./magento`  | Use the power of the Magento CLI  | |
| `./n98`  | Use the Magerun commands as you want | |
| `./grunt-init`  | Prepare to use Grunt  | |
| `./grunt`  | Use Grunt specifically in your theme or completely, it'll do the deploy and the watcher.  | `./grunt luma` |
| `./xdebug`  |  Enable / Disable the XDebug | |
| `./composer`  |  Use Composer commands | `./composer update` |

### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
