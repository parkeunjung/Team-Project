CREATE DATABASE movieholic DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON movieholic.* TO 'kbc13'@'localhost' IDENTIFIED BY 'a12345';

use movieholic;

CREATE TABLE selectedmovie (
	usernumber INT NOT NULL,
	movienumber INT NOT NULL
	
);