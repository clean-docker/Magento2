# docker-sync-magento2
Docker configuration running Magento 2 using docker-compose and docker-sync

## Setup Instructions ##

1. Install Docker for Mac, download it from [here](https://docs.docker.com/docker-for-mac/install/).
2. Install docker-compose
   - `brew install docker-compose`
3. Install docker-sync
   - `sudo gem install docker-sync`
4. Clone a docker-sync instance for your project
   - `git clone git@github.com:redstage/docker-sync-magento2.git <your-project-name>`
5. Clone your project repository under ./src
   - `cd src`
   - `git clone <your_project_git_url>`
6. Run `composer install` from the host
7. Place a database dump into ./src
8. Run the following command. This will adjust your docker-compose and docker-sync files to your current project. Be cautious not to use the same project name inside the same host as this will cause unexpected behaviors:
   - `./init-project project_name`
9. Spin up the docker containers:  
   - `./start`
10. Attach to the phpfpm container:
   - `docker-compose exec phpfpm bash`
11. From the phpfpm container, import the db and set the base_urls:
   - `mysql -hmariadb -umagento -pmagento magento < db.sql`
12. Adjust app/etc/env.php, using this [file](https://github.com/redstage/docker-sync-magento2/blob/master/env.sample.php)
13. Create an entry in /etc/hosts pointing to 127.0.0.1
    - `sudo vim /etc/hosts`
14. Enable all modules, sets the config.php file
    - `./magento module:enable --all`
    - `./magento setup:upgrade`
15. Open a new browser and open http://<your_domain>/ (nginx is running at port 80)

## Available Commands ##
- `./start` - At the first run will create all containers, sync all the codebase with docker, and start up the containers. At the next runs, it will simply start up the containers
- `./stop` - Stops the containers
- `./shell` - Enters a shell at the php-fpm container, under user `www-data`. Make sure you always run commands as this user, so the permissions will always be set right 
- `./magento <command>` - Will run the magento cli from the php-fpm container, under user www-data. 
- `docker-sync log -f` - To be used in case you want to take a look at what docker-sync is up to 
- `docker-compose logs -f` - Will show logs for all running containers 

## Grunt ##
Grunt is installed globally in the phpfpm container, so you only need to install it locally for the project
- `./grunt-init` - Installs grunt locally in the magento project. Will also set the store to developer mode, in order to allow changes to be made directly from themes and modules files. Prior to running this command, you need to place a package.json file at the root of your magento folder. Magento 2 comes with a package.json.sample file which can be used.
- `./grunt` - Compiles all less tasks defined in the themes.js file, and starts a watch task, which will monitor your less files for changes and automatically fire a compilation when needed. You can pass the task name, as defined in themes.js as a first parameter i.e.: `./grunt <task_name>`

## PhpMyAdmin ##
PhpMyAdmin will be available at http://<your_domain>:8080/

## Xdebug ##
When running the start script, a new loopback interface will be setup on your Mac with IP 10.254.254.254. This is needed because of a [known issue with docker for mac connectivity](https://forums.docker.com/t/ip-address-for-xdebug/10460).
Xdebug will be trying to connect through DBGp on that IP and port 9004. This means that the configuration in PHPStorm must be as follows:

1. Open PHPStorm and press `Cmd + ,`
2. Under *Languages & Frameworks -> PHP -> Debugger -> Xdebug*, set Debug port as 9004
3. Under *Languages & Frameworks -> PHP -> Debugger -> Xdebug -> DBGp Proxy* set Host as `10.254.254.254` and port as `9004`

## Mailhog ##
PHP is configured to send all e-mails sent through the mail() function to the mailhog smtp container. To see the e-mail activity, point your browser to http://<your_domain>:8025