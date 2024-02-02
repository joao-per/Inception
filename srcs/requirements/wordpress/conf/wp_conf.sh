#!/bin/bash

sleep 2

wp_download()
{
    if wp core download --allow-root; 
    then
        return 1
    else
        return 0
    fi
}

wp_config() 
{
    if wp config create \
        --allow-root \
        --path=/var/www/html/ \
        --dbname=$DB_NAME \
        --dbuser=$DB_ADMIN \
        --dbpass=$DB_PASS \
        --dbhost=$DB_HOST
    then
        return 1
    else
        return 0
    fi
}

wp_install()
{
    if wp core install    \
        --allow-root \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIM_PASS \
        --admin_email=$WP_ADMIM_EMAIL \
        --url=$WP_URL 
    then
        wp user create \
        --allow-root \
        $WP_USER $WP_USER_EMAIL \
        --user_pass=$WP_USER_PASS
        return 1
    else
        return 0
    fi
}

# Check if the wp-config.php file exists
if [ ! -e "/var/www/html/wp-config.php" ]; then
    echo "Downloading Wordpress..."
    wp_download
    echo "Configuring Wordpress..."
    wp_config
    echo "Installing Wordpress..."
    wp_install
    wp theme install twentynineteen --activate
    sleep 1

else
    echo "Wordpress already installed"
fi

exec "$@"