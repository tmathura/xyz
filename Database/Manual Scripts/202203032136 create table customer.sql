IF NOT EXISTS
(
    SELECT *
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
          AND TABLE_NAME = 'customer'
)
BEGIN
    CREATE TABLE [dbo].[customer]
    (
        [id] INT NOT NULL IDENTITY(1, 1),
        [name] VARCHAR(200) NOT NULL,
        [surname] VARCHAR(200) NOT NULL,
        [address_line_1] VARCHAR(2000) NOT NULL,
        [added_date] DATETIME NOT NULL
        CONSTRAINT [PK_customer_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [PRIMARY]
    );
END;
GO