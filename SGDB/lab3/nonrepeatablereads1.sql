--Non-repeatable reads part 2
BEGIN TRAN
UPDATE Student SET age = 19 WHERE id=1
COMMIT TRAN