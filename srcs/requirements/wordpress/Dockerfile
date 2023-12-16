FROM debian:buster

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    php \
    php-fpm \
    php-mysql \
    php-opcache \
    php-xml \
    php-gd \
    php-curl \
    php-mbstring \
    && rm -rf /var/lib/apt/lists/*

# Download WordPress
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz \
    && mv wordpress/* /var/www/html/ \
    && rm -rf wordpress latest.tar.gz


# Ensure permissions are set
# Change the ownership of the WordPress files to the www-data user, which is the user PHP-FPM runs as.
RUN chown -R www-data:www-data /var/www/html

# Create directory for PHP-FPM run files
# /run/php is created because PHP-FPM expects a directory to store its runtime files, including the PID file. It may not be present in a minimal base image.
RUN mkdir /run/php

# Expose the port PHP-FPM is reachable on
# PHP-FPM listens on port 9000 by default, so I expose that port to the host.
EXPOSE 9000

# Configure entrypoint and cmd
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm7.3", "-F"]
