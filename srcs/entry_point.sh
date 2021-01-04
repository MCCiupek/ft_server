#!/bin/bash

path="/var/www/localhost"

### Copy config files
echo -e "Copying config files..."
mkdir ${path}
cp -r wordpress ${path}/wordpress
cp -r phpmyadmin ${path}/phpMyAdmin

### Modify admin rights
echo -e "Changing admin rights..."
chown -R www-data:www-data *
chmod -R 775 /var/www/*
# mkdir ${path}/phpMyAdmin/tmp && chmod 777 ${path}/phpMyAdmin/tmp
chmod 777 ${path}/wordpress/wp-content

### Generate SSL certificates 
echo -e "Generating SSL certificate..."
mkdir /etc/nginx/ssl
openssl req -out /etc/nginx/ssl/localhost.csr -new -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=France/L=Paris/O=42/OU=42/CN=localhost.com"
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt -subj "/C=FR/ST=France/L=Paris/O=42/OU=42/CN=localhost.com"

### Activate virtual host
echo -e "Activating virtual host..."
cp localhost.conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# Create database
echo -e "Creating database..."
# mysql -u root < create_tables.sql
service mysql start
mysql -u root < db.sql

# Restart
echo -e "Restarting services..."
nginx -t
service nginx restart
service php7.3-fpm start

echo -e "Success!"

#tail -f /dev/null
sh
