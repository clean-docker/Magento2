FROM php:7.0-apache

MAINTAINER Rafael Corrêa Gomes <rafaelcg_stz@hotmail.com>

ENV XDEBUG_PORT 9000

# Install System Dependencies

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	python-software-properties \
	&& apt-get update \
	&& apt-get install -y \
	libfreetype6-dev \
	libicu-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng12-dev \
	libedit-dev \
	libedit2 \
	libxslt1-dev \
	apt-utils \
	git \
	vim \
	wget \
	curl \
	lynx \
	psmisc \
	unzip \
	tar \
	&& apt-get clean

# Install Magento Dependencies

RUN docker-php-ext-configure \
	gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
	docker-php-ext-install \
	opcache \
	gd \
	bcmath \
	intl \
	mbstring \
	mcrypt \
	pdo_mysql \
	soap \
	xsl \
	zip

# Install oAuth

RUN apt-get update \
	&& apt-get install -y \
	libpcre3 \
	libpcre3-dev \
	php-pear \
	&& pecl install oauth \
	&& echo "extension=oauth.so" > /usr/local/etc/php/conf.d/docker-php-ext-oauth.ini

# Configuring system

RUN chmod 777 -R /var/www/html \
	&& usermod -u 1000 www-data \
 	&& a2enmod rewrite \
	&& a2enmod headers

# Install DevAlias

RUN mkdir ~/.dev-alias \
	&& wget https://github.com/rafaelstz/dev-alias/archive/master.zip -P ~/.dev-alias \
	&& unzip -qo ~/.dev-alias/master.zip -d ~/.dev-alias \
	&& mv ~/.dev-alias/dev-alias-master/* ~/.dev-alias \
	&& rm -rf ~/.dev-alias/dev-alias-master \
	&& rm ~/.dev-alias/master.zip \
	&& echo "source ~/.dev-alias/alias.sh;alias n98='magerun2';alias magerun='magerun2';" >> ~/.bashrc

# Install Magerun 2

RUN mkdir -p ~/.dev-alias/tools \
	&& wget https://files.magerun.net/n98-magerun2.phar \
	&& chmod +x ./n98-magerun2.phar \
	&& cp ./n98-magerun2.phar /usr/local/bin/

# Install Grunt

RUN apt-get install -y build-essential \
	&& apt-get update \
	&& apt-get install -y nodejs npm libssl-dev \
  && curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh \
  && npm i -g grunt grunt-cli

# Install Composer

RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Install XDebug

RUN yes | pecl install xdebug && \
	echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

ADD conf/php.ini /usr/local/etc/php/php.ini
ADD conf/custom-xdebug.ini /usr/local/etc/php/conf.d/custom-xdebug.ini
COPY ./bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

VOLUME /var/www/html
WORKDIR /var/www/html
