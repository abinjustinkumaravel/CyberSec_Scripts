#!/bin/bash

echo "Enter the IP address to scan :"
read ip
echo "scanning open ports on $ip.."

for port in {1..1024};do
	timeout 1 bash -c  "echo > /dev/tcp/$ip/$port" 2>/dev/null && echo "Port $port is open"
done
