/*
  Warnings:

  - You are about to drop the `Amenity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Booking` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Host` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Location` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Payment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Property` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Property_Image` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Review` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [Booking_host_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [Booking_property_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [Booking_user_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Message] DROP CONSTRAINT [Message_host_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Message] DROP CONSTRAINT [Message_user_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT [Payment_booking_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Property] DROP CONSTRAINT [Property_host_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Property] DROP CONSTRAINT [Property_location_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Property_Amenities] DROP CONSTRAINT [Property_Amenities_amenity_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Property_Amenities] DROP CONSTRAINT [Property_Amenities_property_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Property_Image] DROP CONSTRAINT [Property_Image_property_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Review] DROP CONSTRAINT [Review_property_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[Review] DROP CONSTRAINT [Review_user_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[User_Favorites] DROP CONSTRAINT [User_Favorites_property_id_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[User_Favorites] DROP CONSTRAINT [User_Favorites_user_id_fkey];

-- DropTable
DROP TABLE [dbo].[Amenity];

-- DropTable
DROP TABLE [dbo].[Booking];

-- DropTable
DROP TABLE [dbo].[Host];

-- DropTable
DROP TABLE [dbo].[Location];

-- DropTable
DROP TABLE [dbo].[Message];

-- DropTable
DROP TABLE [dbo].[Payment];

-- DropTable
DROP TABLE [dbo].[Property];

-- DropTable
DROP TABLE [dbo].[Property_Image];

-- DropTable
DROP TABLE [dbo].[Review];

-- DropTable
DROP TABLE [dbo].[User];

-- CreateTable
CREATE TABLE [dbo].[Hosts] (
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
    CONSTRAINT [Hosts_pkey] PRIMARY KEY CLUSTERED ([host_id]),
    CONSTRAINT [Hosts_host_name_key] UNIQUE NONCLUSTERED ([host_name]),
    CONSTRAINT [Hosts_email_key] UNIQUE NONCLUSTERED ([email]),
    CONSTRAINT [Hosts_phone_number_key] UNIQUE NONCLUSTERED ([phone_number])
);

-- CreateTable
CREATE TABLE [dbo].[Users] (
    [user_id] INT NOT NULL IDENTITY(1,1),
    [user_name] NVARCHAR(1000) NOT NULL,
    [first_name] NVARCHAR(1000) NOT NULL,
    [last_name] NVARCHAR(1000) NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [phone_number] NVARCHAR(1000) NOT NULL,
    [password] NVARCHAR(1000) NOT NULL,
    [birth_date] DATETIME2 NOT NULL,
    CONSTRAINT [Users_pkey] PRIMARY KEY CLUSTERED ([user_id]),
    CONSTRAINT [Users_user_name_key] UNIQUE NONCLUSTERED ([user_name]),
    CONSTRAINT [Users_email_key] UNIQUE NONCLUSTERED ([email]),
    CONSTRAINT [Users_phone_number_key] UNIQUE NONCLUSTERED ([phone_number])
);

-- CreateTable
CREATE TABLE [dbo].[Locations] (
    [location_id] INT NOT NULL IDENTITY(1,1),
    [city] NVARCHAR(1000) NOT NULL,
    [street] NVARCHAR(1000) NOT NULL,
    [latitude] FLOAT(53) NOT NULL,
    [longitude] FLOAT(53) NOT NULL,
    CONSTRAINT [Locations_pkey] PRIMARY KEY CLUSTERED ([location_id])
);

-- CreateTable
CREATE TABLE [dbo].[Properties] (
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
    CONSTRAINT [Properties_pkey] PRIMARY KEY CLUSTERED ([property_id])
);

-- CreateTable
CREATE TABLE [dbo].[Property_Images] (
    [image_id] INT NOT NULL IDENTITY(1,1),
    [property_id] INT NOT NULL,
    [image_url] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Property_Images_pkey] PRIMARY KEY CLUSTERED ([image_id])
);

-- CreateTable
CREATE TABLE [dbo].[Amenities] (
    [amenity_id] INT NOT NULL IDENTITY(1,1),
    [amenity_name] NVARCHAR(1000) NOT NULL,
    [amenity_description] NVARCHAR(1000),
    CONSTRAINT [Amenities_pkey] PRIMARY KEY CLUSTERED ([amenity_id])
);

-- CreateTable
CREATE TABLE [dbo].[Bookings] (
    [booking_id] INT NOT NULL IDENTITY(1,1),
    [user_id] INT NOT NULL,
    [property_id] INT NOT NULL,
    [host_id] INT NOT NULL,
    [booking_date] DATETIME2 NOT NULL,
    [check_in_date] DATETIME2 NOT NULL,
    [check_out_date] DATETIME2 NOT NULL,
    [num_guests] INT NOT NULL,
    [total_cost] FLOAT(53) NOT NULL,
    CONSTRAINT [Bookings_pkey] PRIMARY KEY CLUSTERED ([booking_id])
);

-- CreateTable
CREATE TABLE [dbo].[Payments] (
    [payment_id] INT NOT NULL IDENTITY(1,1),
    [booking_id] INT NOT NULL,
    [payment_date] DATETIME2 NOT NULL,
    [payment_amount] FLOAT(53) NOT NULL,
    [payment_method] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Payments_pkey] PRIMARY KEY CLUSTERED ([payment_id])
);

-- CreateTable
CREATE TABLE [dbo].[Reviews] (
    [review_id] INT NOT NULL IDENTITY(1,1),
    [user_id] INT NOT NULL,
    [property_id] INT NOT NULL,
    [review_date] DATETIME2 NOT NULL,
    [review_rating] FLOAT(53) NOT NULL,
    [review_text] NVARCHAR(1000),
    CONSTRAINT [Reviews_pkey] PRIMARY KEY CLUSTERED ([review_id])
);

-- CreateTable
CREATE TABLE [dbo].[Messages] (
    [message_id] INT NOT NULL IDENTITY(1,1),
    [user_id] INT NOT NULL,
    [host_id] INT NOT NULL,
    [message_date] DATETIME2 NOT NULL,
    [message_time] DATETIME2 NOT NULL,
    [message_text] NVARCHAR(1000),
    CONSTRAINT [Messages_pkey] PRIMARY KEY CLUSTERED ([message_id])
);

-- AddForeignKey
ALTER TABLE [dbo].[Properties] ADD CONSTRAINT [Properties_host_id_fkey] FOREIGN KEY ([host_id]) REFERENCES [dbo].[Hosts]([host_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Properties] ADD CONSTRAINT [Properties_location_id_fkey] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations]([location_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Property_Images] ADD CONSTRAINT [Property_Images_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Properties]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Property_Amenities] ADD CONSTRAINT [Property_Amenities_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Properties]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Property_Amenities] ADD CONSTRAINT [Property_Amenities_amenity_id_fkey] FOREIGN KEY ([amenity_id]) REFERENCES [dbo].[Amenities]([amenity_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[User_Favorites] ADD CONSTRAINT [User_Favorites_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[User_Favorites] ADD CONSTRAINT [User_Favorites_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Properties]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Bookings] ADD CONSTRAINT [Bookings_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Bookings] ADD CONSTRAINT [Bookings_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Properties]([property_id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Bookings] ADD CONSTRAINT [Bookings_host_id_fkey] FOREIGN KEY ([host_id]) REFERENCES [dbo].[Hosts]([host_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Payments] ADD CONSTRAINT [Payments_booking_id_fkey] FOREIGN KEY ([booking_id]) REFERENCES [dbo].[Bookings]([booking_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Reviews] ADD CONSTRAINT [Reviews_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Reviews] ADD CONSTRAINT [Reviews_property_id_fkey] FOREIGN KEY ([property_id]) REFERENCES [dbo].[Properties]([property_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Messages] ADD CONSTRAINT [Messages_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Messages] ADD CONSTRAINT [Messages_host_id_fkey] FOREIGN KEY ([host_id]) REFERENCES [dbo].[Hosts]([host_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
