#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp 

wp core download  --path="/var/www/html/" --allow-root

sleep 5

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$USER_PASSWORD --dbhost=$DB_HOST --path=/var/www/html/ --allow-root

mkdir run/php

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


php-fpm7.3 -F 