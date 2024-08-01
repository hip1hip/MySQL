
SELECT user();

CREATE USER 'jimin'@'%' IDENTIFIED BY '1234'; 

DROP USER 'jimin'@'localhost';

DESC mysql.user;

SELECT * FROM mysql.user;  -- user 라는 데이터베이스임

GRANT SELECT ON mycompany.* TO 'jimin'@'%';
FLUSH PRIVILEGES;  -- 권한을 주고 저장하는것 꼭 써줘야함.


GRANT ALL PRIVILEGES ON mycompany.Patient TO 'jimin'@'%';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON mycompany.* TO 'jimin'@'%';
FLUSH PRIVILEGES;


SHOW GRANTS FOR 'jimin'@'%';  -- 권한 보기

REVOKE ALL PRIVILEGES ON mycompany.* FROM 'jimin'@'%';
FLUSH PRIVILEGES;


















