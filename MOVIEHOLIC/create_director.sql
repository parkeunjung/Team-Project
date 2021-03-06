CREATE DATABASE movieholic DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON movieholic.* TO 'kbc13'@'localhost' IDENTIFIED BY 'a12345';

use movieholic;

CREATE TABLE directors (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(255) NOT NULL,
	birth VARCHAR(255) NOT NULL,
	debut VARCHAR(255) NOT NULL,
	award VARCHAR(255) ,
	famous VARCHAR(255) NOT NULL,
 	imagename VARCHAR(255) NOT NULL,
 	imagepath BLOB
);
