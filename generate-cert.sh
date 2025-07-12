#!/bin/sh
# Self-signed SSL certificate generation script
# Output: cert.key (private key), cert.crt (certificate)

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout cert.key \
  -out cert.crt \
  -subj "/C=KR/ST=Seoul/L=Seoul/O=Airisu/OU=Dev/CN=ChatBoongProxy"

echo "Self-signed certificate generated: cert.key, cert.crt"
