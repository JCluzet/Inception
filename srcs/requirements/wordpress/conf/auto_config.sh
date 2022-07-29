#!bin/bash
sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
# wp-config.php file
    wp config create	--allow-root \
    					--dbname=$SQL_DATABASE \
    					--dbuser=$SQL_USER \
    					--dbpass=$SQL_PASSWORD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'
    sleep 2
    # --allow-root
    # wp core install     --allow-root --url=$DOMAIN \
    # 					--title=$WP_TITLE \
    # 					--admin_user=$WP_ADMIN \
    #                     --admin_password=$WP_ADMINPASS \
    #                     --admin_email=$WP_EMAIL1 \
    #                     --path='/var/www/wordpress'
    # wp user create      --allow-root $WP_USER $WP_EMAIL2 \
    # 					--user_pass=$WP_USERPASS \
    # 					--role=author\
    #                     --path='/var/www/wordpress' >> /log.txt
fi

# echo "define( 'CONCATENATE_SCRIPTS', false );" >> /var/www/wordpress/wp-config.php
# echo "define( 'SCRIPT_DEBUG', true );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_HOME', 'https://jcluzet.42.fr' );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_SITEURL', 'https://jcluzet.42.fr' );" >> /var/www/wordpress/wp-config.php

# echo "define( 'WP_DEBUG', true);" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_DEBUG_LOG', true);" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_DEBUG_DISPLAY', false);" >> /var/www/wordpress/wp-config.php
# echo "define('WP_ALLOW_REPAIR', true);" >> /var/www/wordpress/wp-config.php

	

# if /run/php folder does not exist, create it
if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F

# user 
# wp user list --allow-root




# sed -i "s/votre_nom_de_bdd/${SQL_DATABASE}/g" /var/www/wordpress/wp-config-sample.php
# sed -i "s/votre_utilisateur_de_bdd/${SQL_USER}/g" /var/www/wordpress/wp-config-sample.php
# sed -i "s/votre_mdp_de_bdd/${SQL_PASSWORD}/g" /var/www/wordpress/wp-config-sample.php
# sed -i "s/localhost/mariadb:3306/g" /var/www/wordpress/wp-config-sample.php


# mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

