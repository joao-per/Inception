FROM debian:buster

# Update packages and install nginx and openssl
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create SSL directory and generate SSL certificates
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/joao-per.crt \
    -keyout /etc/nginx/ssl/joao-per.key \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/CN=joao-per.42.fr"

# Copy custom Nginx configuration
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

# Ensure the Nginx PID directory exists
RUN mkdir -p /run/nginx

# Expose port 443 for SSL traffic
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
