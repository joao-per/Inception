FROM debian:bullseye-slim

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


# Install WordPress CLI (WP-CLI) for command-line WordPress management.
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# This directory is required for creating the php7.4-fpm.pid file
RUN mkdir /run/php/ && chmod 755 /run/php/

# Update the 'listen' configuration in www.conf to use a network socket (0.0.0.0:9000)
RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wp_install_config.sh /home
RUN chmod +x /home/wp_install_config.sh

EXPOSE 9000

ENTRYPOINT ["/home/wp_conf.sh"]

CMD ["php-fpm7.4", "-F", "-R"]
