/*
[Entities/ 개체]
- Professor

[Properties / 속성]
- id				(BIGSERIAL)		-- 자동으로 증가하는 숫자
- name 				(VARCHAR(30))
- dept 				(VARCHAR(50))
- salary 			(NUMERIC)
- salary_level 		(NUMERIC))
- hire_date 		(DATE)
*/

CREATE TABLE prof(
	id bigserial,
	name varchar(30),
	dept varchar(50),
	salary numeric,
	salary_level numeric,
	hire_date date -- 'YYYY-MM-DD'
);

TABLE prof;

-- 데이터 삽입
INSERT INTO prof (name, dept, salary, salary_level, hire_date)
VALUES
	('ABC', '소프트웨어공학', 100000, 2, '1900-09-08'),
	('ADF', '소프트웨어공학', 100000, 2, '1900-09-08'),
	('YYY', '소프트웨어공학', 900000, 4, '2077-10-08'),
	('QWER', '소프트웨어공학', 100000, 2, '1932-09-08'),
	('AAA', '소프트웨어공학', 100000, 2, '1902-09-08');

SELECT * FROM prof;

SELECT name, salary FROM prof;
SELECT name, salary FROM prof ORDER BY salary DESC; -- OR ASC
SELECT name, salary FROM prof WHERE salary > 90000;

SELECT name, salary FROM prof WHERE name LIKE 'Q%'; -- PostgreSQL ILIKE 대/소문자 상관X

SELECT name, dept FROM prof
	WHERE dept LIKE '%공%'
	ORDER BY dept DESC;

SELECT name, salary FROM prof WHERE salary BETWEEN 70000 AND 900000;