#!/usr/bin/bash
openssl req -new -subj "/C=SE/CN=$(hostname -f)" -addext "subjectAltName = IP:$(ip -br -4 a | awk '/UP/ { print $3 }' | sed 's#/.\+$##'), DNS:$(hostname -s), DNS:$(hostname -f)" -days 3650 -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -nodes
