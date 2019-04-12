/* Create the database and the user */

CREATE DATABASE baseball;

GRANT ALL ON *.* TO 'baseball'@'localhost' IDENTIFIED BY 'insert password';

/* FOR REMOTE USERS FOLLOW THIS TEMPLATE */

CREATE USER 'baseball'@'%' IDENTIFIED BY 'insert password'

GRANT ALL ON *.* TO 'baseball'@'%';

 
