create table Student(
	id int IDENTITY(1,1) PRIMARY KEY,
	name varchar(20) not null,
	age int not null
)

create table Teacher(
	id int IDENTITY(1,1) PRIMARY KEY,
	name varchar(20) not null,
	age int not null,
	title varchar(10),
)

drop table Teacher

create table Course(
	id int IDENTITY(1,1) PRIMARY KEY,
	name varchar(20),
	credits int not null,
	teacherId int FOREIGN KEY REFERENCES Teacher(id)
)

create table student_course(
	student_id int not null,
	course_id int not null,
	CONSTRAINT student_course_pk PRIMARY KEY(student_id,course_id),
	CONSTRAINT FK_Student FOREIGN KEY(student_id) REFERENCES Student(id),
	CONSTRAINT FK_Course FOREIGN KEY(course_id) REFERENCES Course(id)
)