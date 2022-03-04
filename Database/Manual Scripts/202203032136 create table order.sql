IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
          AND TABLE_NAME = 'order'
)
BEGIN
    CREATE TABLE [dbo].[order]
    (
        [id] INT NOT NULL IDENTITY(1, 1),
        [customer_id] INT NOT NULL,
        [reference_number] INT NOT NULL,
        [added_date] DATETIME NOT NULL,
        [cancelled] BIT NOT NULL CONSTRAINT DF_order_cancelled DEFAULT 0,
        [returned] BIT NOT NULL CONSTRAINT DF_order_returned DEFAULT 0,
        [invoiced] BIT NOT NULL CONSTRAINT DF_order_invoiced DEFAULT 0,
        CONSTRAINT [PK_order_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY],
        CONSTRAINT [IX_customer_id_reference_number] UNIQUE NONCLUSTERED ([customer_id], [reference_number] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_PAGE_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON  [PRIMARY];
END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_order_customer_id]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[order]')
)
BEGIN
    ALTER TABLE [dbo].[order] WITH CHECK ADD CONSTRAINT [FK_order_customer_id] FOREIGN KEY (customer_id) REFERENCES [dbo].customer ([id]);
END;