#!/bin/bash

echo "Enter the ip address of the server to check:"
read ip

echo "Checking for outdated Apache or Nginx Servers on $ip ..."

apache_version=$(timeout 2 curl -sI http://$ip | grep "Server : Apache" )

if [[ $apache_version ]]; then 
	echo "Apache server detected:$apache_version"
	if [[ $apache_version == **"2.2"** ]]; then 
		echo "Warning: Apache 2.2 is outdated and vulnerable!"
	fi
else
	echo "No Apache sever found."
fi

nginx_version=$(timeout 2 curl -sI https://$ip |grep "Server: nignx")
if [[ $nginx_version ]]; then
	echo "Nginx server detected: $nginx_version"
	if [[ $nginx_version == *"1.0"* ]]; then 
		echo "Warning: Ngnix 1.0 is outdated and vulnerable!"
	fi
else
	echo "No Ngnix server found."
fi


