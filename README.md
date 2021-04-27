# Feedme
new feed of my interest

# [DATABASE SESSION]
- user configured in settings.py must be priviliged user
    mysql> CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password'; 
    mysql> GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost'; 
    mysql> FLUSH PRIVILEGES; 
    mysql> exit 

- create database manually in mysql ,make sure it supports charset - utf8
  > CREATE DATABASE Feedme CHARACTER SET utf8 COLLATE utf8_general_ci;
  > select * from information_schema.SCHEMATA;


