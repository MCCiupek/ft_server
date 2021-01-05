#!/bin/bash
echo ${auto_index}
if [ ${auto_index}="off" ]
then
	echo "Setting autoindex off"
	sed -i -e "s/autoindex in/autoindex off/g" localhost.conf
fi
