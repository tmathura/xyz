IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
          AND TABLE_NAME = 'order_product'
)
BEGIN
    CREATE TABLE [dbo].[order_product]
    (
        [id] INT NOT NULL IDENTITY(1, 1),
        [order_id] INT NOT NULL,
        [product_id] INT NOT NULL,
        [quantity] INT NOT NULL,
        [ordered_price] MONEY NOT NULL
        CONSTRAINT [PK_order_product_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY]
    );
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_order_product_product_id]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[order_product]')
)
BEGIN
    ALTER TABLE [dbo].order_product WITH CHECK ADD CONSTRAINT [FK_order_product_product_id] FOREIGN KEY (product_id) REFERENCES [dbo].product ([id]);
END;

IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_order_product_order_id]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[order_product]')
)
BEGIN
    ALTER TABLE [dbo].order_product WITH CHECK ADD CONSTRAINT [FK_order_product_order_id] FOREIGN KEY (order_id) REFERENCES [dbo].[order] ([id]);
END;