#!/bin/bash

path="/var/www/localhost"

### Copy config files
echo -e "Copying config files..."
mkdir ${path}
cp -r wordpress ${path}/wordpress
cp -r phpmyadmin ${path}/phpMyAdmin

### Modify admin rights
echo -e "Changing admin rights..."
chown -R user42 /var/www
chgrp -R www-data /var/www
chmod -R 755 /var/www
chmod g+s /var/www
#chown -R www-data:www-data *
#chmod -R 775 /var/www/*
#mkdir ${path}/phpMyAdmin/tmp && chmod 777 ${path}/phpMyAdmin/tmp
#chmod 777 ${path}/wordpress/wp-content

#Activate virtual host
echo -e "Activating virtual host..."
cp localhost.conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# Create database
echo -e "Creating databse..."
# mysql -u root < create_tables.sql
service mysql start
mysql -u root < db.sql

# Restart
echo -e "Restarting services..."
service nginx restart
service php7.2-fpm start

echo -e "Success!"
