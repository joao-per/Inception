FROM debian:bullseye-slim

RUN apt-get update\
    && apt-get install -y nginx openssl\
    && mkdir -p /var/www/ /etc/nginx/ssl/

EXPOSE 443

RUN mkdir -p /run/nginx

# Generate SSL certificate because wordpress requires https
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/joao-per.crt \
       -keyout /etc/nginx/ssl/joao-per.key \
       -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42/OU=joao-per/CN=localhost/"

COPY ./config/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]

