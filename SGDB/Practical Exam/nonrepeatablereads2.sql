--Non-repeatable reads part 2
BEGIN TRAN
UPDATE MainResidents SET name = 'Mara' WHERE MRId=1
COMMIT TRAN