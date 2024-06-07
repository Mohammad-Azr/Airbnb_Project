/*
  Warnings:

  - You are about to alter the column `latitude` on the `Location` table. The data in that column could be lost. The data in that column will be cast from `Decimal(10,8)` to `Float(53)`.
  - You are about to alter the column `longitude` on the `Location` table. The data in that column could be lost. The data in that column will be cast from `Decimal(11,8)` to `Float(53)`.

*/
BEGIN TRY

BEGIN TRAN;

-- DropIndex
DROP INDEX [unique_email_phone_number] ON [dbo].[Host];

-- AlterTable
ALTER TABLE [dbo].[Location] ALTER COLUMN [latitude] FLOAT(53) NOT NULL;
ALTER TABLE [dbo].[Location] ALTER COLUMN [longitude] FLOAT(53) NOT NULL;

-- CreateTable
CREATE TABLE [dbo].[User] (
    [user_id] INT NOT NULL IDENTITY(1,1),
    [user_name] NVARCHAR(1000) NOT NULL,
    [first_name] NVARCHAR(1000) NOT NULL,
    [last_name] NVARCHAR(1000) NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [phone_number] NVARCHAR(1000) NOT NULL,
    [password] NVARCHAR(1000) NOT NULL,
    [birth_date] DATETIME2 NOT NULL,
    CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED ([user_id]),
    CONSTRAINT [User_user_name_key] UNIQUE NONCLUSTERED ([user_name]),
    CONSTRAINT [User_email_key] UNIQUE NONCLUSTERED ([email]),
    CONSTRAINT [User_phone_number_key] UNIQUE NONCLUSTERED ([phone_number])
);

-- CreateTable
CREATE TABLE [dbo].[Property] (
    [property_id] INT NOT NULL IDENTITY(1,1),
    [host_id] INT NOT NULL,
    [location_id] INT NOT NULL,
    [property_type] NVARCHAR(1000) NOT NULL,
    [categories] NVARCHAR(1000) NOT NULL,
    [num_bedrooms] INT NOT NULL,
    [num_bathrooms] INT NOT NULL,
    [max_guests] INT NOT NULL,
    [area] FLOAT(53) NOT NULL,
    [price_per_night] FLOAT(53) NOT NULL,
    [availability] BIT NOT NULL,
    CONSTRAINT [Property_pkey] PRIMARY KEY CLUSTERED ([property_id])
);

-- CreateTable
CREATE TABLE [dbo].[Property_Image] (
    [image_id] INT NOT NULL IDENTITY(1,1),
    [property_id] INT NOT NULL,
    [image_url] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Property_Image_pkey] PRIMARY KEY CLUSTERED ([image_id])
);

-- CreateTable
CREATE TABLE [dbo].[Amenity] (
    [amenity_id] INT NOT NULL IDENTITY(1,1),
    [amenity_name] NVARCHAR(1000) NOT NULL,
    [amenity_description] NVARCHAR(1000),
    CONSTRAINT [Amenity_pkey] PRIMARY KEY CLUSTERED ([amenity_id])
);

-- CreateTable
CREATE TABLE [dbo].[Property_Amenities] (
    [property_id] INT NOT NULL,
    [amenity_id] INT NOT NULL,
    CONSTRAINT [Property_Amenities_pkey] PRIMARY KEY CLUSTERED ([property_id],[amenity_id])
);

-- CreateTable
CREATE TABLE [dbo].[User_Favorites] (
    [user_id] INT NOT NULL,
    [property_id] INT NOT NULL,
    CONSTRAINT [User_Favorites_pkey] PRIMARY KEY CLUSTERED ([user_id],[property_id])
);

-- CreateTable
CREATE TABLE [dbo].[Booking] (
    [booking_id] INT NOT NULL IDENTITY(1,1),
    [user_id] INT NOT NULL,
    [property_id] INT NOT NULL,
    [host_id] INT NOT NULL,
    [booking_date] DATETIME2 NOT NULL,
    [check_in_date] DATETIME2 NOT NULL,
    [check_out_date] DATETIME2 NOT NULL,
    [num_guests] INT NOT NULL,
    [total_cost] FLOAT(53) NOT NULL,
    CONSTRAINT [Booking_pkey] PRIMARY KEY CLUSTERED ([booking_id])
);

-- CreateTable
CREATE TABLE [dbo].[Payment] (
    [payment_id] INT NOT NULL IDENTITY(1,1),
    [booking_id] INT NOT NULL,
    [payment_date] DATETIME2 NOT NULL,
    [payment_amount] FLOAT(53) NOT NULL,
    [payment_method] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Payment_pkey] PRIMARY KEY CLUSTERED ([payment_id])
);

-- CreateTable
CREATE TABLE [dbo].[Review] (
    [review_id] INT NOT NULL IDENTITY(1,1),
    [user_id] INT NOT NULL,
    [property_id] INT NOT NULL,
    [review_date] DATETIME2 NOT NULL,
    [review_rating] FLOAT(53) NOT NULL,
    [review_text] NVARCHAR(1000),
    CONSTRAINT [Review_pkey] PRIMARY KEY CLUSTERED ([review_id])
);

-- CreateTable
CREATE TABLE [dbo].[Message] (
    [message_id] INT NOT NULL IDENTITY(1,1),
    [user_id] INT NOT NULL,
    [host_id] INT NOT NULL,
    [message_date] DATETIME2 NOT NULL,
    [message_time] DATETIME2 NOT NULL,
    [message_text] NVARCHAR(1000),
    CONSTRAINT [Message_pkey] PRIMARY KEY CLUSTERED ([message_id])
);

-- AddForeignKey
ALTER TABLE [dbo].[Property] ADD CONSTRAINT [Property_host_id_fkey] FOREIGN KEY ([host_id]) REFERENCES [dbo].[Host]([host_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Property] ADD CONSTRAINT [Property_location_id_fkey] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location]([location_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Property_Image] ADD CONSTRAINT [Property_Image_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Property]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Property_Amenities] ADD CONSTRAINT [Property_Amenities_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Property]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Property_Amenities] ADD CONSTRAINT [Property_Amenities_amenity_id_fkey] FOREIGN KEY ([amenity_id]) REFERENCES [dbo].[Amenity]([amenity_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[User_Favorites] ADD CONSTRAINT [User_Favorites_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[User_Favorites] ADD CONSTRAINT [User_Favorites_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Property]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Booking] ADD CONSTRAINT [Booking_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Booking] ADD CONSTRAINT [Booking_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Property]([property_id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Booking] ADD CONSTRAINT [Booking_host_id_fkey] FOREIGN KEY ([host_id]) REFERENCES [dbo].[Host]([host_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Payment] ADD CONSTRAINT [Payment_booking_id_fkey] FOREIGN KEY ([booking_id]) REFERENCES [dbo].[Booking]([booking_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Review] ADD CONSTRAINT [Review_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Review] ADD CONSTRAINT [Review_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Property]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Message] ADD CONSTRAINT [Message_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Message] ADD CONSTRAINT [Message_host_id_fkey] FOREIGN KEY ([host_id]) REFERENCES [dbo].[Host]([host_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
