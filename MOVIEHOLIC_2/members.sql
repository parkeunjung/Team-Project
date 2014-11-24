GRANT ALL ON movieholic.* TO 'kbc13'@'localhost' IDENTIFIED BY 'a12345';

use movieholic;


CREATE TABLE members (
	userid VARCHAR(100) NOT NULL, 
	name VARCHAR(100) NOT NULL,
	pwd VARCHAR(255) NOT NULL, 
	email VARCHAR(255) NOT NULL
);

