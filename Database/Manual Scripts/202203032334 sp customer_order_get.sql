CREATE OR ALTER PROCEDURE dbo.customer_orders_get
(@customer_id INT)
AS
BEGIN
    SELECT *
    FROM dbo.[order] c
    WHERE customer_id = @customer_id
END;