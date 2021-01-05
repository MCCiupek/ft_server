#!/bin/bash

path="/var/www/localhost"

### Copy config files
echo -e "Copying config files..."
mkdir ${path}
cp -r wordpress ${path}/wordpress
cp -r phpmyadmin ${path}/phpMyAdmin
ln -s /usr/share/phpMyAdmin ${path}/phpMyAdmin

### Modify admin rights
echo -e "Changing admin rights..."
chown -R www-data:www-data ${path}/*
chmod -R 755 ${path}/wordpress

### Generate SSL certificates 
echo -e "Generating SSL certificate..."
mkdir /etc/nginx/ssl
openssl req -nodes -new -x509 \
	-keyout /etc/nginx/ssl/localhost.key \
	-out /etc/nginx/ssl/localhost.crt \
	-subj "/C=FR/ST=France/L=Paris/O=42/OU=42/CN=localhost.com"

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

# Pause Docker
#tail -f /dev/null
sh
