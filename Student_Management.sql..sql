create database task;
use task;

create table student(
StudentID int primary key,
StudentNmae varchar(50),
Department varchar(50),
Age int);

select * from student;

insert into student values(1,'Ashwi','ECE',21),
(2,'Rahul','CSE',22),
(3,'Priya','ECE',20),
(4,'Karan','IT',23);

select * from student;

create table marks(
StudentId int,
Subject varchar(30),
Marks int,
foreign key(StudentID) references student(StudentID)
);

insert into marks values(1, 'SQL', 95),
(1, 'Python', 88),
(2, 'SQL', 75),
(2, 'Python', 82),
(3, 'SQL', 91),
(3, 'Python', 89),
(4, 'SQL', 65),
(4, 'Python', 70);

select * from marks;

-- DISPLAY ALL STUDENTS WHOSE AGE GREATER THAN 21
select* from student where age>=21;

-- DISPLAY STUDENTS FROM ECE
select * from student where department='ECE';

-- DISPLAY AVERAGE MARKS
select avg(Marks) as averageMarks from marks;

-- FIND MIN N MAX MARKS
select min(Marks) as mininumMarks, max(Marks) as maximumMarks from marks;

-- COUNT TOTAL STUDENTS
select count(*) from student;

-- AVG MARK OF EACH STUDENT
select StudentID,avg(marks) as AverageMarks from marks group by StudentID;
 
 -- AVG MARK GREATER THAN 85
 select StudentID,avg(marks) as AverageMarks from marks group by StudentID having AverageMarks>85;
 
 -- DISPLAY STUDENT NAME,SUBJECT,MARKS --> JOIN
 -- > INNER JOIN
 select student.studentNmae,marks.subject,marks.marks
 from student
 inner join marks
 on student.studentId=marks.studentID;
 
 -- LEFT JOIN
 select student.studentNmae,marks.subject,marks.marks
 from student
 left join marks
 on student.studentId=marks.studentID;
 
 -- > RIGHT JOIN
 select student.studentNmae,marks.subject,marks.marks
 from student
 RIGHT join marks
 on student.studentId=marks.studentID;
 
 -- > FULL OUTER JOIN
 select student.studentNmae,marks.subject,marks.marks
 from student
 left join marks
 on student.studentId=marks.studentID 
 UNION 
 select student.studentNmae,marks.subject,marks.marks
 from student
 RIGHT join marks
 on student.studentId=marks.studentID;
 
 -- > SUBQUERY FIND MARLS GREATER THAT AVERAGE MARKS
 select * from marks
 where marks >(
 select avg(marks) from marks);
 
 -- > TCL STATEMENTS
 start transaction;
 SET sql_safe_updates=0;
 update marks set marks = marks+5 where subject='SQL';
 select * from marks;
 rollback;
  select * from marks;
  
update marks set marks = marks-5 where subject='SQL';
  
ALTER TABLE student
RENAME COLUMN studentnmae TO studentName;
 select * from student;
 
 -- > VIEW 
 create view vwSTUDENTS as 
  select student.studentname,avg(MARKS.marks) as AVERAGEMARKS
  from student
  join marks
  on student.studentid=marks.studentid
  group by student.studentid;
   SELECT * FROM vwSTUDENTS;
   
-- > CREATING INDEX
create index idx_marks on marks(marks);
select * from marks where marks > 76;

-- > STORED PROCEDURE
-- > IN 
delimiter //
create procedure getstudent(in stud int)
begin
select * from student
where Studentid = stud;
end //
delimiter ;
call getstudent(4);

-- > OUT PROCEDURE
delimiter //
create procedure getcount(out totalMarks int)
begin
select sum(marks) into TotalMarks
from marks;
end //
delimiter ;

call getcount(@count);
select @count

-- > IN OUT PROCEDURE
delimiter //
create procedure higherMarks(inout increase int)
begin
set increase=increase+5;
end //
delimiter ;

set @value=30
call higherMarks(@value);
select @value;
 
 

 
 


