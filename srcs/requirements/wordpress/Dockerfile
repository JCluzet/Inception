FROM debian:buster

# update apt to get last version of packages
RUN apt update -y 

# install wget 
RUN apt install wget -y

# color to remove
RUN apt install zsh -y
RUN apt install vim -y
RUN apt install git -y
# RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"


# install apache2
RUN apt install apache2 -y

# install systemctl to start apache2
RUN apt-get install systemd -y

# start and enable apache2
# RUN systemctl start apache2
RUN systemctl enable apache2

# tuto PHP https://www.rosehosting.com/blog/how-to-install-wordpress-with-nginx-on-debian-10/

# install php-fpm and enable it
RUN apt install php php-fpm -y

# copy config file of php
COPY conf/conf_php /etc/php/7.3/fpm/pool.d/www.conf 
COPY conf/conf_phpini /etc/php/7.3/fpm/php.ini

#launch php
RUN systemctl enable php7.3-fpm
