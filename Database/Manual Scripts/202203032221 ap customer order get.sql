CREATE OR ALTER PROCEDURE dbo.customer_orders_by_date_range_get
(
    @customer_id INT,
    @from_date DATETIME,
    @to_date DATETIME
)
AS
BEGIN
    SELECT c.[name] AS customer_name, pt.[type] AS product_type, SUM(op.quantity) AS total_quantity, SUM(op.ordered_price) AS total_price
    FROM dbo.customer c
    INNER JOIN dbo.[order] o ON o.customer_id = c.id
    INNER JOIN dbo.order_product op ON op.order_id = o.id
    INNER JOIN dbo.product p ON p.id = op.product_id
    INNER JOIN dbo.product_type pt ON pt.id = p.product_type_id
    WHERE o.added_date BETWEEN @from_date AND @to_date
    GROUP BY c.[name], pt.[type]
END;
