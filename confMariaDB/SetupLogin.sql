SELECT @DB_NAME := 'PROTO_DB_NAME';
SELECT @USER_NAME := 'PROTO_DB_NAME';
SELECT @USER_PWD := 'PROTO_DB_NAME';
-- SET @subscriptionId = (select subscriptionId from User where emailAddress='ac@tmail.com'); 
-- SELECT col1, @var_name := col2 from tb_name WHERE "condition";

-----------------------
--  DB
-----------------------
SET @query = CONCAT('DROP DATABASE IF EXISTS `', @DB_NAME, '`');
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @query = CONCAT('CREATE DATABASE IF NOT EXISTS `', @DB_NAME, '`');
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

ALTER DATABASE @DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE @DB_NAME;


-----------------------
-- user d'acces a la DB
-----------------------
CREATE USER @USER_NAME@'localhost' IDENTIFIED BY @USER_PWD;
GRANT ALL PRIVILEGES ON @DB_NAME.* TO @USER_NAME@'localhost';
FLUSH PRIVILEGES;


DELIMITER //
CREATE PROCEDURE sp_test(var1 INT) 
BEGIN   
    DECLARE start  INT unsigned DEFAULT 1;  
    DECLARE finish INT unsigned DEFAULT 10;

    SELECT  var1, start, finish;
    SELECT * FROM places WHERE place BETWEEN start AND finish; 
END; //

DELIMITER ;
-- CALL sp_test(5);


-----------------------
-- Table des users
-----------------------
CREATE TABLE list (
    id int not null auto_increment,
    user_name varchar(255) not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    PRIMARY KEY (id)
);