DROP TABLE IF EXISTS student_course CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS teacher CASCADE;


CREATE TABLE teacher (
    id BIGSERIAL,
    first_name VARCHAR(25),
    last_name VARCHAR(25)
);

CREATE TABLE course (
    id BIGSERIAL,
    name VARCHAR(70),
    teacher_id BIGINT
);

CREATE TABLE student (
    id BIGSERIAL,
    first_name VARCHAR(25),
    last_name VARCHAR(25)
);

CREATE TABLE student_course (
    student_id BIGINT,
    course_id BIGINT
);

INSERT INTO teacher (id, first_name, last_name) VALUES
(1, 'Taylah', 'Booker'),
(2, 'Sarah-Louise', 'Blake');

INSERT INTO course (id, name, teacher_id) VALUES
(1, 'Database design', 1),
(2, 'English literature', 2),
(3, 'Python programming', 1);

INSERT INTO student (id, first_name, last_name) VALUES
(1, 'Sherya', 'Bain'),
(2, 'Rianna', 'Foster'),
(3, 'Yosef', 'Naylor');

INSERT INTO student_course (student_id, course_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1);

ALTER TABLE teacher
ADD CONSTRAINT teacher_pk PRIMARY KEY (id);

ALTER TABLE course
ADD CONSTRAINT course_pk PRIMARY KEY (id);

ALTER TABLE student
ADD CONSTRAINT student_pk PRIMARY KEY (id);

ALTER TABLE course
ADD CONSTRAINT course_teacher_fk FOREIGN KEY (teacher_id)
REFERENCES teacher(id)
ON DELETE CASCADE;

ALTER TABLE student_course
ADD CONSTRAINT sc_student_fk FOREIGN KEY (student_id)
REFERENCES student(id)
ON DELETE CASCADE;

ALTER TABLE student_course
ADD CONSTRAINT sc_course_fk FOREIGN KEY (course_id)
REFERENCES course(id)
ON DELETE CASCADE;

SELECT * FROM teacher;
SELECT * FROM course;
SELECT * FROM student;
SELECT * FROM student_course;
