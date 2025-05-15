USE sqldb;

SELECT *
FROM buytbl;

SELECT *
FROM usertbl;

-- 구매이력이 없는 사용자를 출력
SELECT *
FROM usertbl u
LEFT OUTER JOIN buytbl b
ON u.userID = b.userID
-- WHERE b.userID = NULL
WHERE IFNULL(b.userID, TRUE)
ORDER BY u.userID;

SELECT *
FROM usertbl
WHERE IFNULL(mobile1, FALSE);

SELECT *
FROM usertbl
WHERE NOT ISNULL(mobile1);

SELECT name, IFNULL(mobile1, '없음') AS '지역번호'
FROM usertbl;

SELECT
    name,
    birthYear,
    CASE
        WHEN birthYear>=1980 THEN '1980년대생'
        WHEN birthYear>=1970 THEN '1970년대생'
        WHEN birthYear>=1960 THEN '1960년대생'
        ELSE '1950년대생'
        END '몇년도생?'
FROM usertbl;

SELECT
    u.userID,
    u.name,
    GROUP_CONCAT(b.prodName SEPARATOR ',') AS '상품목록'
FROM
    usertbl u
        LEFT OUTER JOIN
    buytbl b ON u.userID = b.userID
GROUP BY
    u.userID, u.name
ORDER BY
    u.userID;

SELECT *
FROM
    usertbl LEFT JOIN buytbl
            ON buytbl.userID = usertbl.userID;