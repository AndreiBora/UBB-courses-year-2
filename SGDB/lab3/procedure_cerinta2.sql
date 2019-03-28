CREATE procedure addStudentCourse2(@s_name varchar(20),@s_age int,@c_name varchar(20),@credits int,@teacher_id int)
AS
BEGIN
	DECLARE @ERROR_CODE INT = 1
	DECLARE @ERROR_CHAIN VARCHAR(200) = ''
	DECLARE @STUDENT_ID INT
	DECLARE @COURSE_ID INT
	--try to insert a student
	BEGIN TRAN one
	BEGIN TRY
		IF(dbo.uf_ValidateAge(@s_age) = 0)
		BEGIN
			SET @ERROR_CHAIN += 'Age cannot be negative; ';
		END
		IF(dbo.uf_ValidateName(@s_name) = 0)
		BEGIN
			SET @ERROR_CHAIN += 'Name must start with upper case;';
		END
		IF LEN(@ERROR_CHAIN) > 0
		BEGIN
			RAISERROR(@ERROR_CHAIN,14,1);
		END
		SELECT @STUDENT_ID = id from student where name = @s_name
		if(@STUDENT_ID is null)
		BEGIN
			INSERT INTO STUDENT(name,age) VALUES(@s_name,@s_age)
			SET @STUDENT_ID = IDENT_CURRENT('dbo.Student')
		END
		COMMIT TRAN one
		SELECT 'Student inserted successfuly'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN one
		SET @ERROR_CODE = 0
		SELECT 'Transaction student was rollback'
		SELECT ERROR_MESSAGE()
	END CATCH
		
	--try to insert a course
	BEGIN TRAN two
	BEGIN TRY
		IF(dbo.uf_ValidateName(@c_name) = 0)
		BEGIN
			RAISERROR('Name of the course must start with upper case letter',14,1);
		END
		SELECT @COURSE_ID = id from Course where name = @c_name
		IF(@COURSE_ID is null)
		BEGIN
			INSERT INTO Course(name,credits,teacherId) VALUES(@c_name,@credits,@teacher_id)
			SET @COURSE_ID = IDENT_CURRENT('dbo.Course')
		END
		COMMIT TRAN two
		SELECT 'Transaction course committed successfuly'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN two
		SET @ERROR_CODE = 0
		SELECT 'Transaction course was rollbacked'
		SELECT ERROR_MESSAGE()
	END CATCH

	--try to insert into the link table only if previous transactions have completed successfuly
	IF(@ERROR_CODE = 1)
	BEGIN
		INSERT INTO student_course(student_id,course_id) VALUES(@STUDENT_ID,@COURSE_ID)
	END
			
END