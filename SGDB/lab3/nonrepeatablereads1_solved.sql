--Non-repeatable reads part 1 solved
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
SELECT * FROM Student where id=1
--crank some data
WAITFOR DELAY '00:00:10'
SELECT * FROM Student where id=1
COMMIT TRAN