FROM debian:buster

#install nginx
RUN apt update -y
RUN apt install nginx -y

#install systemctl to start nginx
RUN apt-get install systemd -y

#install curl
RUN apt install curl -y

#install VIM to edit nginx.conf
RUN apt install vim -y


EXPOSE 80

#run nginx
RUN systemctl enable nginx