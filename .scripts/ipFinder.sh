#!/bin/sh

url="api.ipify.org"
ip=$(curl "$url")
echo "Your IP is $ip, it is also copied into your clipboard."
echo "$ip" | xclip -sel c


