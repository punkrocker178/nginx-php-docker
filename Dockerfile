FROM ubuntu:18.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# Install Git
RUN apt-get install -y git

# Install Nano text editor
RUN apt-get install -y nano

# Install ping tool
RUN apt-get install -y iputils-ping

# Install nginx
RUN apt-get install -y nginx

# Install php
RUN apt install -y php7.2-fpm php7.2-mysql php7.2-cli php7.2-cli php7.2-json php7.2-curl php7.2-ldap php7.2-mbstring php7.2-soap php7.2-xml php7.2-zip php7.2-intl 

# Install curl 
RUN apt-get install -y curl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /demo

COPY start.sh /demo/start.sh

RUN chmod 775 start.sh

COPY info.php /var/www/html/info.php

COPY default /etc/nginx/sites-available/default

# Start service
ENTRYPOINT ["/demo/start.sh"]

EXPOSE 80
