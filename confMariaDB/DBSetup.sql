-- ---------------------
--  DB
-- ---------------------

DROP DATABASE IF EXISTS `proto_db_name`;
CREATE DATABASE IF NOT EXISTS `proto_db_name`;

ALTER DATABASE `proto_db_name` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proto_db_name`;

-- ---------------------
-- user d'acces a la DB
-- ---------------------

CREATE OR REPLACE USER proto_user_name@'localhost' IDENTIFIED BY 'proto_user_pwd' PASSWORD EXPIRE NEVER;
GRANT ALL PRIVILEGES ON `proto_db_name`.* TO proto_user_name@'localhost';
FLUSH PRIVILEGES;

-- ---------------------
-- Table des users
-- ---------------------

DROP DATABASE IF EXISTS `proto_table_user_name`;
CREATE TABLE proto_table_user_name (
    id int not null auto_increment,
    user_name varchar(255) not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    PRIMARY KEY (id)
);