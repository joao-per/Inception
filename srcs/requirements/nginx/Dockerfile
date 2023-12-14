FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/joao-per.crt \
    -keyout /etc/nginx/ssl/joao-per.key \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/CN=joao-per.42.fr"

COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
