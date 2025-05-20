USE sqldb;

SELECT * FROM usertbl;
SHOW INDEX FROM usertbl;
ANALYZE TABLE usertbl;
SHOW TABLE STATUS LIKE 'usertbl';

CREATE INDEX idx_usertbl_addr
ON usertbl(addr);

SHOW INDEX FROM usertbl;

SHOW TABLE STATUS LIKE 'usertbl';

CREATE UNIQUE INDEX idx_usertbl_birthYear
ON usertbl(birthYear);
-- unique 인덱스는 birthYear에 중복값이 없어야 함

CREATE UNIQUE INDEX idx_usertbl_nam
ON usertbl(name);

SHOW INDEX FROM usertbl;
SHOW TABLE STATUS LIKE 'usertbl';

DROP INDEX idx_usertbl_nam ON usertbl;

CREATE UNIQUE INDEX idx_usertbl_name_birthYear
ON usertbl(name, birthYear);

SHOW INDEX FROM usertbl;


DROP INDEX idx_usertbl_name_birthYear ON usertbl;
DROP INDEX idx_usertbl_addr ON usertbl;


CREATE DATABASE scoula_db;
DROP USER IF EXISTS 'scoula'@'%';

CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON scoula_db.* TO 'scoula'@'%';

FLUSH PRIVILEGES;