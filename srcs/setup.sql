CREATE DATABASE wordpress_db;
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'localhost';
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'wordpress_user'@'localhost';
