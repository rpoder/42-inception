FROM		debian:buster

MAINTAINER	Ronan PODER @rpoder

RUN			apt update
RUN			apt install -y nginx
RUN			apt install openssl -y

RUN			mkdir -p /etc/nginx/ssl

RUN			openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=rpoder.42.fr/UID=login"
#
RUN			mkdir -p /var/run/nginx

COPY		conf/nginx.conf /etc/nginx/nginx.conf

COPY		html/ /var/www/html

RUN			chmod 755 /var/www/html
RUN			chown -R www-data:www-data /var/www/html

EXPOSE		443

CMD			["nginx","-g", "daemon off;"]

