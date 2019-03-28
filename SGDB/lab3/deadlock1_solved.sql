--deadlock transaction 1 solved
SET DEADLOCK_PRIORITY NORMAL
BEGIN TRAN
	UPDATE Student SET age = 10 where id = 2
	WAITFOR DELAY '00:00:10'
	UPDATE Course SET credits = 2 WHERE id = 1
COMMIT TRAN
