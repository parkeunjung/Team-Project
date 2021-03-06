CREATE DATABASE movieholic DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON movieholic.* TO 'kbc13'@'localhost' IDENTIFIED BY 'a12345';

use movieholic;

CREATE TABLE awards (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	title VARCHAR(255) NOT NULL,
	year VARCHAR(255) NOT NULL,
	award1 VARCHAR(255) NOT NULL,
	name1 VARCHAR(255) NOT NULL,
	award2 VARCHAR(255),
	name2 VARCHAR(255),
	award3 VARCHAR(255),
	name3 VARCHAR(255),
	award4 VARCHAR(255),
	name4 VARCHAR(255),
	award5 VARCHAR(255),
	name5 VARCHAR(255)
);
