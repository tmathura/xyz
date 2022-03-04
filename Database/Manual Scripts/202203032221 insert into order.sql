INSERT INTO dbo.[order] ([customer_id], [reference_number], [added_date])
SELECT 1, 124345, GETDATE()

INSERT INTO dbo.[order] ([customer_id], [reference_number], [added_date])
SELECT 2, 1244457, GETDATE()

SELECT *
FROM [order]