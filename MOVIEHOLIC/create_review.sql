CREATE DATABASE movieholic DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON movieholic.* TO 'kbc13'@'localhost' IDENTIFIED BY 'a12345';

use movieholic;

CREATE TABLE reviews (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	M_name VARCHAR(200) NOT NULL,
	C_name VARCHAR(200) NOT NULL,
  	content TEXT NOT NULL,
  	image BLOB NOT NULL
  	imbagename varchar(255) not null
);