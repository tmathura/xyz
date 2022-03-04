IF NOT EXISTS
(
    SELECT *
    FROM sys.indexes
    WHERE name = 'IX_order_customer_id_added_date'
          AND object_id = OBJECT_ID('dbo.order')
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_order_customer_id_added_date ON dbo.[order] (customer_id, added_date);
END;