-- CLUB DB
CREATE TABLE department (				-- department's in club
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,     
    role_desc VARCHAR(255)              -- department role description
);

CREATE TABLE students (					-- students information
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,  
    major VARCHAR(50),                  -- student's major
    join_date DATE,                     -- club join date
    dept_id INT,                        -- club id
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- data insert
INSERT INTO department (dept_id, dept_name, role_desc) 
VALUES (1, '기획부', '동아리 행사 기획 및 운영'),
       (2, '개발부', '내부 프로젝트 및 스터디 진행');

INSERT INTO students (student_id, student_name, major, join_date, dept_id) 
VALUES (20240001, '김철수', '소프트웨어학과', '2024-03-02', 2),
       (20240002, '이영희', '컴퓨터공학과', '2024-03-05', 1),
       (20230015, '박지민', '소프트웨어학과', '2023-09-01', 2);

-- data select
SELECT student_name, major, join_date 
FROM students
WHERE dept_id = 1 
ORDER BY join_date ASC;