USE chorusroom;

CREATE TABLE link (
       id MEDIUMINT NOT NULL AUTO_INCREMENT,
       name VARCHAR(30) NOT NULL,
       yomi VARCHAR(70) NOT NULL,
       url VARCHAR(100) NOT NULL,
       keyword1 VARCHAR(15) NOT NULL,
       keyword2 VARCHAR(15),
       keyword3 VARCHAR(15),
       keyword4 VARCHAR(15),
       keyword5 VARCHAR(15),
       comment TEXT NULL,
       created DATETIME NOT NULL,
       modified TIMESTAMP,
       PRIMARY KEY (id));

GRANT ALL PRIVILEGES ON chorusroom.link TO 'chorusroom'@'localhost'
      IDENTIFIED BY 'pizzetti';
