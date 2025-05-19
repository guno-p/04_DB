USE tabledb;

DROP TABLE IF EXISTS userTBL;
DROP TABLE IF EXISTS buyTBL;

CREATE TABLE userTBL(
    userID      CHAR(8)     NOT NULL PRIMARY KEY,
    name        VARCHAR(10) NOT NULL,
    birthyear   INT         NOT NULL
);

CREATE TABLE buyTBL(
    num         INT         AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID      CHAR(8)     NOT NULL,
    prodName    CHAR(6)     NOT NULL,
    CONSTRAINT FOREIGN KEY (userID) REFERENCES userTBL(userID)
);

DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL(
    userID      CHAR(8)     NOT NULL PRIMARY KEY,
    name        VARCHAR(10) NOT NULL,
    birthyear   INT         NOT NULL,
    email       CHAR(30)    NULL,
    CONSTRAINT UNIQUE (email)
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL(
    userID      CHAR(8)     NOT NULL PRIMARY KEY,
    name        VARCHAR(10) NULL,
    birthyear   INT         NULL CHECK ( birthyear >= 1900  AND birthyear <= 2023),
    mobile      CHAR(3)     NOT NULL UNIQUE
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL(
    userID      CHAR(8)     NOT NULL PRIMARY KEY,
    name        VARCHAR(10) NOT NULL,
    birthYear   INT         NOT NULL DEFAULT -1,
    addr        CHAR(2)     NOT NULL DEFAULT '서울',
    mobile1     CHAR(3)     NULL,
    mobile2     CHAR(8)     NULL,
    height      SMALLINT    NULL DEFAULT 170,
    mDate       DATE        NULL
);
INSERT INTO userTBL
VALUES ('LHL', '이혜리', default, default, '011', '1234567',
                            default, '2023-12-12');
SELECT * FROM userTBL;

ALTER TABLE userTBL
    DROP COLUMN mobile1;
SELECT * FROM userTBL;


ALTER TABLE userTBL
    CHANGE COLUMN name uName VARCHAR(10) NULL;
SELECT * FROM userTBL;

ALTER TABLE userTBL
    DROP PRIMARY KEY;
SELECT * FROM userTBL;

DROP TABLE IF EXISTS userTBL;

-- ==========================
USE employees;

DROP VIEW IF EXISTS employees_info;
CREATE VIEW employees_info AS
    SELECT
        E.emp_no,
        E.birth_date,
        E.first_name,
        E.last_name,
        E.gender,
        T.title,
        T.from_date AS 't_from',
        T.to_date AS 't_to',
        S.salary,
        S.from_date AS 's_from',
        S.to_date AS 's_to'
    FROM
        employees E
    INNER JOIN
        titles T ON E.emp_no = T.emp_no
    INNER JOIN
        salaries S ON T.emp_no = S.emp_no
            AND S.from_date <= T.to_date
            AND S.to_date >= T.from_date
WHERE E.emp_no >= 10000;
-- 기간 조건 설정으로 한 사람에 대한 중복 뷰 발생하지 않도록 조치

SELECT * FROM employees_info
WHERE s_to = '9999-01-01';

-- 뷰에서 추출 시 같이 뽑고 다시 그룹핑
SELECT
    emp_no, birth_date,first_name, last_name, gender, title, t_to, salary
FROM
    employees_info main
WHERE
    t_to = '9999-01-01' -- 현재 직급 재직 중
  AND  s_to = '9999-01-01' -- 현재 유효한 급여 정보
GROUP BY
    emp_no, birth_date, first_name, last_name, gender, title, t_from, salary
ORDER BY
    emp_no;

DROP VIEW IF EXISTS emp_dept_info;
CREATE VIEW emp_dept_info AS
    SELECT
        E.emp_no,
        D.dept_no,
        D.dept_name,
        DE.from_date,
        DE.to_date
    FROM
        employees E
    INNER JOIN
        dept_emp DE ON E.emp_no = DE.emp_no
    LEFT OUTER JOIN
        departments D ON DE.dept_no = D.dept_no;

SELECT * FROM emp_dept_info
WHERE to_date = '9999-01-01';