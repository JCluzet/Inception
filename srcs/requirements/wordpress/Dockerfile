# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jcluzet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/25 17:40:17 by jcluzet           #+#    #+#              #
#    Updated: 2022/08/03 04:24:22 by jcluzet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ==> Create a container from DEBIAN
FROM debian:buster

# ==> MAJ of apt-get, to get the last version of packages
RUN apt-get update && apt-get upgrade -y

# ==> Install WGET to download the WordPress source code
RUN apt-get -y install wget

# ==> Install PHP 7.3 and its dependencies
RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client 
	# not sure for mariadb client

# download wordpress 6.0 from wordpress.org into /var/www/ and extract it with tar command
RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

#copy of php configuration
COPY	./conf/php.conf			/etc/php/7.3/fpm/pool.d/www.conf

# give the right to the user to write in the directory
RUN		chown -R root:root /var/www/wordpress

# install wp-cli to manage wordpress installation
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# copy wp-cli to /usr/local/bin/wp and give the right to the user to write in the directory
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#copy auto_config
COPY conf/auto_config.sh auto_config.sh

# RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
ENTRYPOINT ["bash", "auto_config.sh"]