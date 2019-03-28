--Phantom read part 2
BEGIN TRAN
INSERT INTO Student(name,age) VALUES('Hanna2',19)
COMMIT TRAN