USE chorusroom;

CREATE TABLE link (
       id MEDIUMINT NOT NULL AUTO_INCREMENT,
       name VARCHAR(30) NOT NULL,
       yomi VARCHAR(70) NOT NULL,
       url VARCHAR(100) NOT NULL,
       comment TEXT NULL,
       created DATETIME NOT NULL,
       modified TIMESTAMP,
       PRIMARY KEY (id));

CREATE TABLE link_key (
       id MEDIUMINT NOT NULL,
       keyword VARCHAR(15));

GRANT ALL PRIVILEGES ON chorusroom.link TO 'chorusroom'@'localhost'
      IDENTIFIED BY 'pizzetti';
GRANT ALL PRIVILEGES ON chorusroom.link_key TO 'chorusroom'@'localhost'
      IDENTIFIED BY 'pizzetti';
