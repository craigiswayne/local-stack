FROM johnpbloch/phpfpm:7.3

RUN curl -L https://phar.phpunit.de/phpunit-8.phar > /tmp/phpunit.phar \
	&& chmod +x /tmp/phpunit.phar \
	&& mv /tmp/phpunit.phar /usr/local/bin/phpunit

RUN apt-get update && apt-get install -y \
		git \
		subversion \
		wget \
		libxml2-dev \
        # need to figure out how to re-enable mail sent to be caught
		# ssmtp \
		imagemagick \
		libmagickwand-dev \
		# needed for ping command
		iputils-ping \
		unzip \
		iproute2 \
		libicu-dev \
    gnupg \
    gnupg2 \
    gnupg1 \
    vim \
	&& pecl install imagick \
  # Below is stuff needed for microsoft sql server
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
  && apt-get update \
  && ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
  && apt-get install -y build-essential \
  && apt-get install -y libpcre3-dev  \
  && apt-get install -y make \
  && apt-get install -y unixodbc-dev \
  && pecl install sqlsrv-5.8.1 \
  && pecl install pdo_sqlsrv-5.8.1 \
  && docker-php-ext-enable sqlsrv pdo_sqlsrv \
	&& docker-php-ext-enable imagick \
	&& docker-php-ext-install soap intl \
	# && echo "mailhub=mailcatcher:1025\nUseTLS=NO\nFromLineOverride=YES" > /etc/ssmtp/ssmtp.conf \
	&& apt-get remove -y libmagickwand-dev libxml2-dev libicu-dev \
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& mkdir /var/www/.wp-cli \
	&& chown www-data:www-data /var/www/.wp-cli

RUN XDEBUG=$(find /usr/local/lib/php -name 'xdebug.so' | head -n 1 | tail -n 1) \
	&& ln -s $XDEBUG /usr/local/lib/php/extensions/xdebug.so

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]

EXPOSE 9000
