--deadlock transaction 2
BEGIN TRAN
	UPDATE Course SET credits = 2 WHERE id = 1
	WAITFOR DELAY '00:00:10'
	UPDATE Student SET age = 10 where id = 2
COMMIT TRAN

select * from student
select * from Course