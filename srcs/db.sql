CREATE DATABASE wordpress_db;
CREATE USER "user42"@"localhost";
SET password FOR "user42"@"localhost" = password('user42');
GRANT ALL PRIVILEGES ON *.* TO "user42"@"localhost" IDENTIFIED BY "user42";
FLUSH PRIVILEGES;
