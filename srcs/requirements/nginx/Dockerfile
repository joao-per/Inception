FROM debian:bullseye-slim

# Install required packages
RUN apt-get update\
    && apt-get install -y nginx openssl\
    && mkdir -p /var/www/ /etc/nginx/ssl/

# Copy the configuration file for nginx
RUN mkdir -p /run/nginx

# Generate SSL certificate because wordpress requires https
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/joao-per.crt \
       -keyout /etc/nginx/ssl/joao-per.key \
       -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42Lisboa/OU=joao-per/CN=localhost/"

COPY ./config/nginx_config.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]

