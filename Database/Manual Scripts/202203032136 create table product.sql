IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
          AND TABLE_NAME = 'product'
)
BEGIN
    CREATE TABLE [dbo].[product]
    (
        [id] INT NOT NULL IDENTITY(1, 1),
        [name] VARCHAR(200) NOT NULL,
        [description] VARCHAR(2000) NOT NULL,
        [product_type_id] INT NOT NULL,
        [price] MONEY NOT NULL,
        [added_date] DATETIME NOT NULL
        CONSTRAINT [PK_product_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY]
    );
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_product_product_type_id]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[product]')
)
BEGIN
    ALTER TABLE [dbo].product WITH CHECK ADD CONSTRAINT [FK_product_product_type_id] FOREIGN KEY (product_type_id) REFERENCES [dbo].product_type ([id]);
END;