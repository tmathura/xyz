INSERT INTO product ([name], [description], [product_type_id], [price], [added_date])
SELECT 'Super bike', 'This is the super bike description', 1, 10, GETDATE()

INSERT INTO product ([name], [description], [product_type_id], [price], [added_date])
SELECT 'Super helmet', 'This is the super helmet description', 2, 5, GETDATE()

INSERT INTO product ([name], [description], [product_type_id], [price], [added_date])
SELECT 'Super knee caps', 'This is the super knee caps description', 3, 7, GETDATE()

INSERT INTO product ([name], [description], [product_type_id], [price], [added_date])
SELECT 'Super tyre', 'This is the super tyre description', 3, 4, GETDATE()

SELECT *
FROM dbo.product