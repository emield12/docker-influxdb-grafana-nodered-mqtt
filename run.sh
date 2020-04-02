#!/bin/bash

configure=0
while getopts c name
do
	case $name in
	  c)configure=1;;
	  *)echo "Unknown option" && exit
	esac
done

echo "Starting docker images.. "
docker-compose up -d

if [ "$configure" -eq 1 ];then
	echo "Configuring influx database:"
	echo -n "Administrator username: "
	read admin_username
	echo -n "Password: "
	read -s admin_password
	echo

	curl -XPOST 'http://localhost:8086/query' --data-urlencode "q=CREATE USER $admin_username WITH PASSWORD '$admin_password' WITH all PRIVILEGES"
fi
