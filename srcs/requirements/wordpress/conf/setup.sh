#!/bin/sh

wp --allow-root --path=/var/www core install --url="yoyohann.42.fr" --title="Inception WP" --admin_user="yoyohann" --admin_password="12345" --admin_email="yoyohann@42.fr"
# wp --allow-root --path=/var/www core install --url=$WP_URL --title=$TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL
wp user create wpuser1 "user1" --role=author --user_pass="12345" --allow-root

wp --allow-root --path=/var/www option update blogname "Inception"
wp --allow-root --path=/var/www option update blogdescription "inception WP"
wp --allow-root --path=/var/www option update blog_public 0

wp theme install twentytwentytwo --activate --allow-root

wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root

/usr/sbin/php-fpm8 -F