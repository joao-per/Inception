#!/bin/bash

sleep 3

conf_file="/var/www/html/wp-config.php"

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

# This section of the shell script checks if the file specified by the variable `` exists.
if [ ! -e "$conf_file" ]; then

    command=0
    attempts=0
    max_attempts=5
    
    cd /var/www/html/

    while [ $attempts -le $max_attempts ]; do

        if [ $command -eq 0 ]; then
            wp_download
            ((command+=$?))
        fi
        if [ $command -eq 1 ]; then
            wp_config
            ((command+=$?))
        fi
        if [ $command -eq 2 ]; then
            wp_install
            ((command+=$?))
        fi
        if [ $command -ge 3 ]; then
            break
        fi
        ((attempts+=1))

        sleep 1

    done
    
    if [ $attempts -ge $max_attempts ]; then
        echo "Fail."
    else
        echo "Success"
    fi
  
else
    echo "Already installed"
fi

exec "$@"