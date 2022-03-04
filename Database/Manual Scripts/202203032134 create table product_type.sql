IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
          AND TABLE_NAME = 'product_type'
)
BEGIN
    CREATE TABLE [dbo].[product_type]
    (
        [id] INT NOT NULL IDENTITY(1, 1),
        [type] VARCHAR(50) NOT NULL,
        CONSTRAINT [PK_product_type_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY]
    );
END;