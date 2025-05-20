USE sqldb;

DROP TABLE IF EXISTS tbl1;

CREATE TABLE tbl1(
     a   INT     PRIMARY KEY,
     b   INT,
     c   INT
);

SHOW INDEX FROM tbl1;

DROP TABLE IF EXISTS tbl2;

CREATE TABLE tbl2(
     a   INT     PRIMARY KEY,
     b   INT     UNIQUE,
     c   INT     UNIQUE,
     d   INT
);

SHOW INDEX FROM tbl2;


DROP TABLE IF EXISTS tbl3;

CREATE TABLE tbl3(
     a   INT     UNIQUE,
     b   INT     UNIQUE,
     c   INT     UNIQUE,
     d   INT
);

SHOW INDEX FROM tbl3;


DROP TABLE IF EXISTS tbl4;

CREATE TABLE tbl4(
     a   INT     UNIQUE NOT NULL,
     b   INT     UNIQUE,
     c   INT     UNIQUE,
     d   INT
);

SHOW INDEX FROM tbl4;

DROP TABLE IF EXISTS tbl5;

CREATE TABLE tbl5(
     a   INT     UNIQUE NOT NULL,
     b   INT     UNIQUE,
     c   INT     UNIQUE,
     d   INT     PRIMARY KEY
);

SHOW INDEX FROM tbl5;


DROP DATABASE IF EXISTS testdb;

CREATE DATABASE testdb;

USE testdb;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID      CHAR(8)     NOT NULL PRIMARY KEY ,
    name        VARCHAR(10) NOT NULL ,
    birthYear   INT         NOT NULL ,
    addr        NCHAR(2)    NOT NULL
);

INSERT INTO usertbl VALUES ('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES ('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES ('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES ('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES ('SSK', '성시경', 1979, '서울');

SHOW INDEX FROM usertbl;

ALTER TABLE usertbl
    DROP PRIMARY KEY;

ALTER TABLE usertbl
    ADD CONSTRAINT pk_name PRIMARY KEY (name);

SHOW INDEX FROM usertbl;
