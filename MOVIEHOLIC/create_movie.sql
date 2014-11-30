CREATE DATABASE movieholic DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON movieholic.* TO 'kbc13'@'localhost' IDENTIFIED BY 'a12345';

use movieholic;

CREATE TABLE movie (
	movienumber INT AUTO_INCREMENT PRIMARY KEY, 
	M_name VARCHAR(100) NOT NULL,
	
	
);