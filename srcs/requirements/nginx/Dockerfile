FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/CN=localhost"

COPY ./config/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]