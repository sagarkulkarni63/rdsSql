CREATE TABLE assignment(
    assignment_id int NOT NULL,
    created_by text NOT NULL,
    updated_by text,
    is_deleted boolean DEFAULT false,
    assignment_title text NOT NULL,
    number_of_questions int NOT NULL, 
    PRIMARY KEY(assignment_id)
);

CREATE TABLE questions(
    question_id int NOT NULL,
    created_by text NOT NULL,
    updated_by text,
    question_title text NOT NULL,
    question_body varchar(60) NOT NULL,
    PRIMARY KEY(question_id)
);

ALTER TABLE questions ADD COLUMN assignment_id int NOT NULL;

ALTER TABLE questions ADD FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id);

ALTER TABLE assignment ADD CONSTRAINT add_unique UNIQUE (assignment_id);

CREATE INDEX index_question ON questions(question_title);

INSERT INTO assignment (assignment_id, created_by, updated_by, is_deleted, assignment_title,number_of_questions)
VALUES ('101', 'xyz', 'abc', false,'Assignment 2',6);

INSERT INTO assignment (assignment_id, created_by, updated_by, is_deleted, assignment_title,number_of_questions)
VALUES ('201', 'xyz', 'lmn', false,'Assignment 3',3);

INSERT INTO assignment (assignment_id, created_by, updated_by, is_deleted, assignment_title,number_of_questions)
VALUES ('301', 'xyz', 'abc', false,'Assignment 1',2);

--Q6
SELECT * FROM assignment WHERE created_by='xyz'; 
SELECT * FROM assignment WHERE not updated_by='abc';
SELECT * FROM assignment WHERE assignment_title LIKE 'Assignment %';
SELECT assignment_title from assignment WHERE updated_by LIKE 'lmn_' ORDER BY assignment_id DESC;

--Q7;
--GROUP BY HAVING 
select count(assignment_id), assignment_title from assignment group by assignment_id having count(assignment_id)<200;


--Q8
SELECT * FROM assignment INNER JOIN questions ON assignment.assignment_title=questions.question_title;

--Q9
SELECT * FROM assignment LEFT JOIN questions ON assignment.created_by=questions.created_by;



