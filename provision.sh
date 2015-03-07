#!/bin/sh

## This file gets executed the first time you do a `vagrant up`, if you want it to
## run again you'll need run `vagrant provision`

## Bash isn't ideal for provisioning but Ansible/Chef/Puppet 
## are not within the scope of this article

## Install all the things
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install --assume-yes php5 php5-mysql php5-cli php5-curl php-apc \
	apache2 libapache2-mod-php5 mysql-client mysql-server supervisor \
	vim ntp bzip2 php-pear

## make www-data use /bin/bash for shell
chsh -s /bin/bash www-data

## Create a directory structure
## (These would probably already exist within your project)
mkdir /var/www/etc
mkdir /var/www/blackberry-jam

## Create an Apache vhost
## (This would probably already exist within your project)
echo "<VirtualHost *:80>
ServerName blackberry.jam
DocumentRoot /var/www/blackberry-jam
<Directory /var/www/blackberry-jam>
	AllowOverride All
    Allow from All
</Directory>  

</VirtualHost>" > /var/www/etc/blackberry.jam.conf

## Tell Apache about our vhost
ln -s /var/www/etc/blackberry.jam.conf /var/www/etc/apache2/sites-enabled/blackberry.jam.conf

## Tweak permissions for www-data user
chgrp www-data /var/log/apache2
chmod g+w /var/log/apache2
chown www-data.www-data /var/www/etc
chown www-data.www-data /var/www/blackberry-jam

## Enable Apache's mod-rewrite, if it's not already
a2enmod rewrite

## Disable the default sites 
a2dissite 000-default

## Configure PHP for dev
echo "upload_max_filesize = 15M
log_errors = On
display_errors = On
display_startup_errors = On
error_log = /var/log/apache2/php.log
memory_limit = 1024M
date.timezone = Europe/London" > /var/www/etc/php5/mods-available/siftware.ini

php5enmod siftware

## Restart Apache
service apache2 reload

## Create a database and grant a user some permissions
echo "create database bbjam;" | mysql -u root
echo "grant all on bbjam.* to blackjam@localhost identified by 'p@ssW0rd';" | mysql -u root

## Install wp-cli
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# mv /home/vagrant/wp-cli.phar /var/www/24ways/wp-cli
# chmod +x /var/www/24ways/wp-cli

# ## Install Wordpress core using wp-cli
# /var/www/24ways/wp-cli core download \
# 	--path=/var/www/blackberry-jam \
# 	--force --allow-root
 
# rm /var/www/blackberry-jam/wp-config-sample.php

## Very basic wp-config.php using our recently created MySQL credentials
## Could use wp-cli for this too, but this'll do
# echo "<?php 
# \$table_prefix = 'bbjam_';
# define('DB_NAME',     'blackberry');
# define('DB_USER',     'blackjam');
# define('DB_PASSWORD', 'p@ssW0rd');
# define('DB_HOST',     'localhost');
# define('DB_CHARSET',  'utf8');
# define('WPLANG', '' );
# if (!defined('ABSPATH')) 
# 	define('ABSPATH', dirname(__FILE__) . '/');
# require_once(ABSPATH . 'wp-settings.php');
# ?>" > /var/www/blackberry-jam/wp-config.php
  
## Provision Wordpress using wp-cli
# /var/www/24ways/wp-cli core install \
# 	--url='http://blackberry.jam' \
# 	--path=/var/www/blackberry-jam \
# 	--title='Vagrant FTW' \
# 	--admin_user=admin \
# 	--admin_password=24ways \
# 	--admin_email=bealers@example.org \
# 	--allow-root

# ## siteurl & home are getting /code appended in wp_options, no idea why
# /var/www/24ways/wp-cli option update siteurl 'http://blackberry.jam' \
# 	--path=/var/www/blackberry-jam \
# 	--allow-root

# /var/www/24ways/wp-cli option update home 'http://blackberry.jam' \
# 	--path=/var/www/blackberry-jam \
# 	--allow-root

# /var/www/24ways/wp-cli option update blogdescription 'Brought to you by 24ways.org' \
# 	--path=/var/www/blackberry-jam \
# 	--allow-root

# /var/www/24ways/wp-cli post create \
# 	--path=/var/www/blackberry-jam \
# 	--post_title='What is Vagrant and why should I care?' \
# 	--post_content='<p>OK, I totally get it now<p>' \
# 	--post_status=publish \
# 	--allow-root


 
