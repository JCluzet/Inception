# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jcluzet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/25 17:39:33 by jcluzet           #+#    #+#              #
#    Updated: 2022/07/29 15:00:59 by jcluzet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ==> Create a container from DEBIAN
FROM debian:buster

# ==> MAJ of apt-get, to get the last version of packages
RUN apt-get update && apt-get upgrade -y

# ==> Install MariaDB server (MySQL)
RUN apt-get install mariadb-server -y

# ==> Copy into the container the config file of MariaDB from folder conf
COPY conf/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# ==> Copy the bash script to create the database and the user into the container
COPY conf/auto_config.sh /auto_config.sh

# ==> Execute the bash script to create the database and the user
ENTRYPOINT ["bash", "auto_config.sh"]

# ==> Expose the only port allowed by the subject (MySQL)
EXPOSE 3306