BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Host] (
    [host_id] INT NOT NULL IDENTITY(1,1),
    [host_name] NVARCHAR(1000) NOT NULL,
    [first_name] NVARCHAR(1000) NOT NULL,
    [last_name] NVARCHAR(1000) NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [phone_number] NVARCHAR(1000) NOT NULL,
    [password] NVARCHAR(1000) NOT NULL,
    [host_since] DATETIME2 NOT NULL,
    [host_response_time] NVARCHAR(1000) NOT NULL,
    [host_rate] FLOAT(53) NOT NULL,
    [host_identity_verified] BIT NOT NULL,
    CONSTRAINT [Host_pkey] PRIMARY KEY CLUSTERED ([host_id]),
    CONSTRAINT [Host_host_name_key] UNIQUE NONCLUSTERED ([host_name]),
    CONSTRAINT [Host_email_key] UNIQUE NONCLUSTERED ([email]),
    CONSTRAINT [Host_phone_number_key] UNIQUE NONCLUSTERED ([phone_number])
);

-- CreateIndex
CREATE NONCLUSTERED INDEX [unique_email_phone_number] ON [dbo].[Host]([email], [phone_number]);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
