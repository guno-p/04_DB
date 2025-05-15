-- ○ 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서
-- 학생을 기준으로 학생 이름/지역/가입한 동아리/동아리방을 출력하세요.
USE sqldb;
SELECT s.stdName AS '학생이름',
       s.addr AS '지역',
       sc.clubName AS '가입한 동아리',
       c.roomNo AS '동아리방'
FROM
    stdtbl s
        INNER JOIN
    stdclubtbl sc ON s.stdName = sc.stdName
        INNER JOIN
    clubtbl c ON sc.clubName = c.clubName
ORDER BY s.stdName;

-- 동아리를 기준으로 가입한 학생의 목록을 출력하세요.
--  출력정보: clubName, roomNo, stdName, addr
SELECT
    c.clubName,
    c.roomNo,
    s.stdName,
    s.addr
FROM
    stdtbl s
        INNER JOIN
    stdclubtbl sc ON sc.stdName = s.stdName
        INNER JOIN
    clubtbl c ON sc.clubName = c.clubName
ORDER BY c.clubName;

-- '우대리'의 상관 연락처 정보를 확인하세요.
-- ○ 출력할 정보
--  부하직원, 직속상관, 직속상관연락처
SELECT
    a.emp AS '부하직원',
    a.manager AS '직속상관',
    b.empTel AS '직속상관연락처'
FROM
    emptbl a
        INNER JOIN
    emptbl b ON a.manager = b.emp
WHERE a.emp = '우대리';

-- 현재 재직 중인 직원의 정보를 출력하세요
-- ○ 출력 항목: emp_no, first_name, last_name, title
USE employees;
SELECT
    E.emp_no,
    E.first_name,
    E.last_name,
    T.title
FROM employees E
        INNER JOIN
    dept_emp DE ON E.emp_no = DE.emp_no
        INNER JOIN
    titles T ON E.emp_no = T.emp_no
WHERE DE.to_date = '9999-01-01'

-- 현재 재직 중인 직원 정보를 출력하세요
-- ○ 출력항목: 직원의 기본 정보 모두, title, salary
SELECT
    E.emp_no,
    E.birth_date,
    E.first_name,
    E.last_name,
    E.gender,
    E.hire_date,
    T.title,
    S.salary
FROM
    employees E
        INNER JOIN
    salaries S
        ON E.emp_no = S.emp_no AND S.to_date = '9999-01-01'
        INNER JOIN
    titles T ON E.emp_no = T.emp_no;


-- 현재 재직중인 직원의 정보를 출력하세요.
-- ○ 출력항목: emp_no, first_name, last_name, department
-- ○ 정렬: emp_no 오름 차순
SELECT
    E.emp_no,
    E.first_name,
    E.last_name,
    D.dept_name
FROM
    employees E
        INNER JOIN
    dept_emp DE ON E.emp_no = DE.emp_no
        INNER JOIN
    departments D ON DE.dept_no = D.dept_no
ORDER BY E.emp_no;


-- 부서별 재직중인 직원의 수를 출력하세요.
-- ○ 출력 항목: 부서 번호, 부서명, 인원수
-- ○ 정렬: 부서 번호 오름차순
SELECT
    D.dept_no,
    D.dept_name,
    COUNT(DE.emp_no)
FROM
    departments D
        INNER JOIN
    dept_emp DE ON D.dept_no = DE.dept_no
WHERE DE.to_date = '9999-01-01'
GROUP BY D.dept_no, D.dept_name
ORDER BY D.dept_no;


-- 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
-- ○ 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date
SELECT
    E.emp_no,
    E.first_name,
    E.last_name,
    D.dept_name,
    DE.from_date,
    DE.to_date
FROM
    employees E
        INNER JOIN
    dept_emp DE ON E.emp_no = DE.emp_no
        INNER JOIN
    departments D ON DE.dept_no = D.dept_no
WHERE E.emp_no = '10209';