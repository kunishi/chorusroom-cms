USE chorusroom;

CREATE TABLE choir (
       urn VARCHAR(20) PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       url VARCHAR(100) NOT NULL,
       pref INTEGER, 
       type ENUM('mixed','male','female','same-voice','children') NULL,
       kind ENUM('general','univ','company','children','highschool',
       	    'junior-highschool','senior-highschool','elementary-school') NULL,
       comment TEXT NULL,
       yomi VARCHAR(40) NULL,
       created DATETIME NOT NULL,
       modified TIMESTAMP);

GRANT ALL PRIVILEGES ON chorusroom.choir TO 'chorusroom'@'localhost'
      IDENTIFIED BY 'pizzetti';
