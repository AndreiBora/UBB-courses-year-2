--deadlock transaction 1
--lock on a row
BEGIN TRAN
	UPDATE Student SET age = 10 where id = 2
	WAITFOR DELAY '00:00:10'
	UPDATE Course SET credits = 2 WHERE id = 1
COMMIT TRAN

select * from student;