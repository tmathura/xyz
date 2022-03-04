INSERT INTO dbo.customer ([name], [surname], [address_line_1], [added_date])
SELECT 'Dave', 'Matthe', '1 Sipres Ave', GETDATE()

INSERT INTO dbo.customer ([name], [surname], [address_line_1], [added_date])
SELECT 'Max', 'Doore', '12 Long Ave', GETDATE()