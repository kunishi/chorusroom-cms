CREATE DATABASE chorusroom;
USE chorusroom;

CREATE TABLE choir (
       urn VARCHAR(20) PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       url VARCHAR(100) NOT NULL,
       pref ENUM(
       	    '北海道',
	    '青森県','秋田県','岩手県','山形県','宮城県','福島県',
	    '茨城県','千葉県','栃木県','群馬県','埼玉県','東京都','神奈川県',
	    '新潟県','富山県','石川県','福井県','長野県','岐阜県',
	    '山梨県','静岡県','愛知県','三重県',
	    '滋賀県','京都府','大阪府','兵庫県','奈良県','和歌山県',
	    '鳥取県','島根県','岡山県','広島県','山口県',
	    '香川県','徳島県','愛媛県','高知県',
	    '福岡県','佐賀県','長崎県','熊本県','大分県','宮崎県','鹿児島県',
	    '沖縄県','海外','その他'),
       type ENUM('mixed','male','female','same-voice','children') NULL,
       kind ENUM('general','univ','company','children','highschool',
       	    'junior-highschool','senior-highschool','elementary-school') NULL,
       comment TEXT NULL,
       yomi VARCHAR(40) NULL,
       created DATETIME NOT NULL,
       modified TIMESTAMP);
GRANT ALL PRIVILEGES ON chorusroom.* TO 'chorusroom'@'localhost'
      IDENTIFIED BY 'pizzetti';
