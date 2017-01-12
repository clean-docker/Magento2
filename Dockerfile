FROM php:7.0.8-apache

MAINTAINER Rafael Corrêa Gomes <rafaelcg_stz@hotmail.com>

# Install System Dependencies

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	python-software-properties

RUN apt-get update \
	&& apt-get install -y \
	libfreetype6-dev \
	libicu-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng12-dev \
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

ADD conf/php.ini /usr/local/etc/php/conf.d/999-rafaelcgstz.ini
COPY ./bin/* /usr/local/bin/

VOLUME /var/www/html
WORKDIR /var/www/html

CMD ["/usr/local/bin/start"]
