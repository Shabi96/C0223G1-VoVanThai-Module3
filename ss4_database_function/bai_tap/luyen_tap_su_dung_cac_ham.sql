CREATE DATABASE quan_ly_sinh_vien;

USE quan_ly_sinh_vien;

CREATE TABLE class (
    class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    `status` BIT
);

CREATE TABLE student (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);

CREATE TABLE subjects (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    `status` BIT DEFAULT 1
);

CREATE TABLE mark (
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id) REFERENCES subjects (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

INSERT INTO class
VALUE (1, 'A1', '2008-12-20', 1),
	  (2, 'A2', '2008-12-22', 1),
	  (3, 'B3', CURRENT_DATE, 0);

INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);

INSERT INTO student (student_name, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);

INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
  
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT *
FROM student
WHERE student.student_name LIKE 'h%';

SELECT *
FROM class
WHERE MONTH(start_date) = 12;

SELECT *
FROM subjects
WHERE credit >= 3 AND credit <= 5;

SET sql_safe_updates = 0;
UPDATE student 
SET class_id = 2
WHERE student_name = 'Hung';
SET sql_safe_updates = 1;

SELECT m.mark, s.student_name, j.sub_name 
FROM mark m
JOIN student s
ON m.student_id = s.student_id
JOIN subjects j
ON m.sub_id = j.sub_id
ORDER BY mark DESC, s.student_name;

SELECT address, COUNT(student_id)
FROM student
GROUP BY address;

SELECT student.student_name, student.student_id, AVG(mark)
FROM student
JOIN mark
ON student.student_id = mark.student_id
GROUP BY student_name, student_id;

SELECT student.student_name, student.student_id, AVG(mark)
FROM student
JOIN mark
ON student.student_id = mark.student_id
GROUP BY student_name, student_id
HAVING AVG(mark) > 15;

SELECT student.student_name, student.student_id, AVG(mark)
FROM student
JOIN mark
ON student.student_id = mark.student_id
GROUP BY student_name, student_id
HAVING AVG(mark) >= ALL(SELECT AVG(mark) FROM mark GROUP BY mark.student_id);

SELECT *
FROM subjects
WHERE credit = (SELECT MAX(credit) FROM subjects);

SELECT *
FROM subjects
JOIN mark
ON subjects.sub_id = mark.sub_id
WHERE mark = (SELECT MAX(mark) FROM mark);

SELECT student.*, AVG(mark)
FROM student
JOIN mark
ON student.student_id = mark.student_id
GROUP BY student.student_id, student.student_name
ORDER BY AVG(mark) DESC;