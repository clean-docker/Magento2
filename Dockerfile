FROM php:7.0.8-apache

MAINTAINER Rafael Corrêa Gomes <rafaelcg_stz@hotmail.com>

# Installing base components

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	python-software-properties

RUN apt-get update \
	&& apt-get upgrade -y

RUN apt-get -y install apt-utils \
	&& apt-get -y install wget \
	&& apt-get -y install curl \
	&& apt-get -y install unzip \
	&& apt-get -y install supervisor \
	&& apt-get -y install g++ \
	&& apt-get -y install make \
	&& apt-get -y install mc \
	&& apt-get -y install vim \
	&& apt-get -y install tar \
	&& apt-get -y install gcc \
	&& apt-get -y install git

# Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installing Docker PHP Ext
RUN apt-get update \
   	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install pdo \
   	&& docker-php-ext-install pdo_mysql \
   	&& apt-get install -y libxml2-dev \
   	&& apt-get install -y libedit-dev \
   	&& apt-get install -y libedit2 \
	&& docker-php-ext-install soap \
	&& apt-get install -y libmcrypt4 libmcrypt-dev \
	&& docker-php-ext-install mcrypt \
	&& apt-get install -y libxslt-dev \
	&& docker-php-ext-install xsl \
	&& apt-get install -y libicu-dev \
	&& docker-php-ext-install intl \
	&& apt-get install -y libpng12-dev libjpeg-dev \
	&& docker-php-ext-configure gd --with-jpeg-dir=/usr/lib \
       	&& docker-php-ext-install gd \
	&& docker-php-ext-install bcmath \
	&& apt-get install -y zlib1g-dev \
	&& docker-php-ext-install zip \
	&& docker-php-ext-install json \
	&& rm -rf /var/lib/apt/lists/*

# Install oAuth
RUN apt-get update \
	&& apt-get install libpcre3 libpcre3-dev -y \
	&& apt-get install php-pear -y \
	&& pecl install oauth \
	&& echo "extension=oauth.so" > /usr/local/etc/php/conf.d/docker-php-ext-oauth.ini

# ----> Configuring system
RUN chmod 777 -R /var/www/html
RUN a2enmod rewrite
RUN a2enmod headers

RUN mkdir ~/.dev-alias \
	&& wget https://github.com/rafaelstz/dev-alias/archive/master.zip -P ~/.dev-alias \
	&& unzip -qo ~/.dev-alias/master.zip -d ~/.dev-alias \
	&& mv ~/.dev-alias/dev-alias-master/* ~/.dev-alias \
	&& rm -rf ~/.dev-alias/dev-alias-master \
	&& rm ~/.dev-alias/master.zip \
	&& echo "alias n98='magerun2'; source ~/.dev-alias/alias.sh" >> ~/.bashrc

VOLUME /var/www/html
WORKDIR /var/www/html
