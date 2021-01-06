#!/bin/bash

# Set auto-index (Default value = ON)
if [ "$1" = "off" ]; then
	echo "AUTOINDEX OFF"
	sed -i -e "s/autoindex on/autoindex off/g" localhost.conf
else
	echo "AUTOINDEX ON"
	sed -i -e "s/autoindex off/autoindex on/g" localhost.conf
fi

# Copy and link config file
cp localhost.conf /etc/nginx/sites-available/localhost

# Restart Nginx
service nginx restart
