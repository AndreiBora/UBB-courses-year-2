create procedure deadlock3
AS 
BEGIN
	BEGIN TRAN
		UPDATE Pacient set name = 'Dordoi' where PaId = 1
		WAITFOR DELAY '00:00:10'
		UPDATE Dentist set name = 'Mara' where ssn = 120
	COMMIT TRAN
END


create procedure deadlock4
AS 
BEGIN
	BEGIN TRAN
		UPDATE Dentist set name = 'Mara' where ssn = 120
		WAITFOR DELAY '00:00:10'
		UPDATE Pacient set name = 'Dordoi' where PaId = 1	
	COMMIT TRAN
END


exec deadlock4;