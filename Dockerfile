# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/07 18:28:18 by kefujiwa          #+#    #+#              #
#    Updated: 2021/05/16 13:28:50 by kefujiwa         ###   ########.fr        #
# **************************************************************************** #

# set the base image from debian:buster
FROM debian:buster

# set maintainer and version information
LABEL maintainer="Kenshi Fujiwara <kefujiwa@student.42tokyo.jp>"
LABEL version="1.0"
LABEL description="LEMP stack on an Devian Buster server"

# install necessary tools
RUN apt-get update; \
	apt-get install -y --no-install-recommends \
		default-mysql-server \
		default-mysql-client \
		nginx \
		openssl \
		php7.3 \
		php-fpm \
		php-mbstring \
		php-mysql \
		supervisor \
		vim \
		wget; \
	rm -rf /var/lib/apt/lists/*

# copy config files to tmp directory
COPY srcs/* /tmp/

# wget wordpress
RUN mkdir -p /var/www/html/wordpress; \
	wget -O wordpress.tar.gz --no-check-certificate https://wordpress.org/latest.tar.gz; \
	tar -xvzf wordpress.tar.gz -C /var/www/html/wordpress --strip-components 1; \
	rm wordpress.tar.gz; \
	mv /tmp/wp-config.php /var/www/html/wordpress; \
	chown -R www-data:www-data var/www/html/wordpress;

# wget phpmyadmin
RUN mkdir -p /var/www/html/phpmyadmin; \
	wget -O phpmyadmin.tar.gz --no-check-certificate https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz; \
	tar -xvzf phpmyadmin.tar.gz -C /var/www/html/phpmyadmin --strip-components 1; \
	rm phpmyadmin.tar.gz; \
	mv /tmp/config.inc.php /var/www/html/phpmyadmin; \
	chown -R www-data:www-data var/www/html/phpmyadmin;

# run create_tables.sql
RUN service mysql start; \
	mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql; \
	mysql -u root < /tmp/setup.sql; \
	rm -f /tmp/setup_mysql;

# create secret key > create csr > create digital certificate
RUN	mkdir -p /etc/nginx/ssl; \
	openssl genrsa -out /etc/nginx/ssl/server.key 2048; \
	openssl req -new \
				-subj "/C=JP/ST=Tokyo/L=Minato/O=42/OU=42Tokyo/CN=localhost" \
				-key /etc/nginx/ssl/server.key \
				-out /etc/nginx/ssl/server.csr; \
	openssl x509 -in /etc/nginx/ssl/server.csr \
				 -days 365000 \
				 -req -signkey /etc/nginx/ssl/server.key \
				 -out /etc/nginx/ssl/server.crt;

# move supervisord.conf under supervisor directory
# move template config file of nginx to sites-available directory
RUN mv /tmp/supervisord.conf /etc/supervisor/conf.d/supervisord.conf; \
	mv /tmp/default.tmpl /etc/nginx/sites-available/default.tmpl;

# set default of expose port (able to omit expose port of -p option)
EXPOSE 80 443

# install entrykit for autoindex
# by using render cmd included in entrykit, it is able to create config file from template
RUN wget --no-check-certificate -O entrykit.tgz https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz; \
	tar -xvzf entrykit.tgz -C /bin; \
	rm entrykit.tgz; \
	chmod +x /bin/entrykit; \
	entrykit --symlink;

ENTRYPOINT [ "render", "/etc/nginx/sites-available/default", "--", "/usr/bin/supervisord" ]
