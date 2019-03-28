--Cerinta 1


--select * from student;
--select * from Course;
--select * from student_course;
----rollback
----exec dbo.addStudentCourse 'dora',18,'Algebra',6,1;
--exec dbo.addStudentCourse 'Mora',-18,'Algebra',6,1;
----committed
----exec dbo.addStudentCourse 'Dora',18,'Algebra',6,1;
--select * from student;
--select * from Course;
--select * from student_course;


----Cerinta 2
--select * from student;
--select * from Course;
--select * from student_course;
----rollback
----exec dbo.addStudentCourse 'dora',18,'Algebra',6,1;
----exec dbo.addStudentCourse 'Mora',-18,'Algebra',6,1;
----committed
----course not committed because is lower case
--exec dbo.addStudentCourse2 'Goe',21,'Analiza',6,1;
--select * from student;
--select * from Course;
--select * from student_course;

