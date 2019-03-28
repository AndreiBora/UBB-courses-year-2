create procedure addStudentCourse(@s_name varchar(20),@s_age int,@c_name varchar(20),@credits int,@teacher_id int)
AS
BEGIN
	DECLARE @ERROR_CHAIN VARCHAR(200) = ''
	DECLARE @STUDENT_ID INT
	DECLARE @COURSE_ID INT
	BEGIN TRAN
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
		
		
		INSERT INTO STUDENT(name,age) VALUES(@s_name,@s_age);
		SET @STUDENT_ID = IDENT_CURRENT('dbo.student');

		INSERT INTO Course(name,credits,teacherId) VALUES(@c_name,@credits,@teacher_id);
		SET @COURSE_ID = IDENT_CURRENT('dbo.couse');

		INSERT INTO student_course(student_id,course_id) VALUES(@STUDENT_ID,@COURSE_ID);
		COMMIT TRAN
		SELECT 'Transaction committed'
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT 'Transaction rollbacked'
		SELECT ERROR_MESSAGE()
	END CATCH
END