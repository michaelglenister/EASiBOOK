USE [master]
GO
/****** Object:  Database [Monkey_Business]    Script Date: 2014-10-09 03:29:31 PM ******/
CREATE DATABASE [Monkey_Business]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Monkey_Business', FILENAME = N'C:\SQL Databases\Monkey_Business.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Monkey_Business_log', FILENAME = N'C:\SQL Databases\Monkey_Business_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Monkey_Business] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Monkey_Business].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Monkey_Business] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Monkey_Business] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Monkey_Business] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Monkey_Business] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Monkey_Business] SET ARITHABORT OFF 
GO
ALTER DATABASE [Monkey_Business] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Monkey_Business] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Monkey_Business] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Monkey_Business] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Monkey_Business] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Monkey_Business] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Monkey_Business] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Monkey_Business] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Monkey_Business] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Monkey_Business] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Monkey_Business] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Monkey_Business] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Monkey_Business] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Monkey_Business] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Monkey_Business] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Monkey_Business] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Monkey_Business] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Monkey_Business] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Monkey_Business] SET RECOVERY FULL 
GO
ALTER DATABASE [Monkey_Business] SET  MULTI_USER 
GO
ALTER DATABASE [Monkey_Business] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Monkey_Business] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Monkey_Business] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Monkey_Business] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Monkey_Business', N'ON'
GO
USE [Monkey_Business]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddAvailabilityRecord]    Script Date: 2014-10-09 03:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-03
-- Description:	Adds a new record to the availability table
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddAvailabilityRecord]
	@RoomID int,
	@Date date,
	@Available bit
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Availability (RoomID, [Date], Available)
	VALUES
	(@RoomID, @Date, @Available)

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewMember]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 03-06-2014
-- Description:	Registering a new member
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddNewMember] 
	-- Add the parameters for the stored procedure here
	@Email varchar(MAX),
	@Password varchar(MAX),
	@FirstName varchar(100),
	@Surname varchar(100),
	@AddressLine1 varchar(MAX),
	@AddressLine2 varchar(MAX),
	@Suburb varchar(100),
	@PostalCode varchar(50),
	@City varchar(MAX),
	@PhoneNo varchar(20)
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Member 
	(Email, [Password], FirstName, Surname, AddressLine1, AddressLine2, Suburb, PostalCode, City, PhoneNo, [Role])
	VALUES
	(@Email, @Password, @FirstName, @Surname, @AddressLine1, @AddressLine2, @Suburb, @PostalCode, @City, @PhoneNo, 1)
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewRate]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 15/08/2014
-- Description:	Stored procedure to add a new rom type rate
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddNewRate] 
	-- Add the parameters for the stored procedure here
	@RatePerNight float,
	@TypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
    -- Insert statements for procedure here
			INSERT INTO Rate(RatePerNight, RoomTypeID)
			VALUES (@RatePerNight, @TypeID)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		THROW
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewRoom]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014/08/03
-- Description:	Add a new room
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddNewRoom] 
	@RoomNo varchar(50),
	@Description varchar(MAX),
	@Picture varchar(50),
	@TypeID int,
	@WifiStatus varchar(10),
	@AirconStatus varchar(10),
	@RoomserviceStatus varchar(10),
	@TelevisionStatus varchar(10)
AS
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Room (RoomNo, [Description], Picture, TypeID, [Status], WifiStatus, AirconStatus, RoomserviceStatus, TelevisionStatus)
			VALUES (@RoomNo, @Description, @Picture, @TypeID, 'Enabled', @WifiStatus, @AirconStatus, @RoomserviceStatus, @TelevisionStatus)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewRoomType]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddNewRoomType] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50),
	@MaxCapacity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			-- Insert statements for procedure here
			INSERT INTO Room_Type(Name, MaxCapacity, Available)
			VALUES (@Name, @MaxCapacity, 'Yes')
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		THROW
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CancelBooking]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-28
-- Description:	Cancel's a booking
-- =============================================
CREATE PROCEDURE [dbo].[sp_CancelBooking]
	-- Add the parameters for the stored procedure here
	@BookingID int
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Booking
	SET [Status] = 'C'
	WHERE
	BookingID = @BookingID

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_CheckAvailability]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-04
-- Description:	Checks availability of a room
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckAvailability]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@StartDate date,
	@EndDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoomID
	FROM Availability
	WHERE
	[Date] BETWEEN @StartDate AND @EndDate
	AND
	Available = 0
	AND RoomID = @RoomID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CheckForDuplicateRoomTypeNames]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckForDuplicateRoomTypeNames] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Name
	FROM Room_Type
	WHERE Name = @Name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Checkin]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-25
-- Description:	Check in
-- =============================================
CREATE PROCEDURE [dbo].[sp_Checkin]
	-- Add the parameters for the stored procedure here
	@BookingID int,
	@CheckinDate datetime
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Booking
	SET CheckinDate = @CheckinDate
	WHERE
	BookingID = @BookingID

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_Checkout]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-25
-- Description:	Check out
-- =============================================
CREATE PROCEDURE [dbo].[sp_Checkout]
	-- Add the parameters for the stored procedure here
	@BookingID int,
	@CheckoutDate datetime
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Booking
	SET CheckoutDate = @CheckoutDate
	WHERE
	BookingID = @BookingID

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_ConfirmBooking]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-17
-- Description:	Confirm a booking
-- =============================================
CREATE PROCEDURE [dbo].[sp_ConfirmBooking]
	-- Add the parameters for the stored procedure here
	@BookingID int
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Booking
	SET [Status] = 'A'
	WHERE
	BookingID = @BookingID

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBooking]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-07
-- Description:	Creates a new booking
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateBooking]
	-- Add the parameters for the stored procedure here
	@ArriveDate date,
	@DepartDate date,
	@MemberID int
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Booking
	(ArriveDate, DepartDate, MemberID, [Status])
	VALUES
	(@ArriveDate, @DepartDate, @MemberID, 'P')

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_CreateInvoice]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-12
-- Description:	Adds data to the invoice table
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateInvoice]
	-- Add the parameters for the stored procedure here
	@BookingID int,
	@Rooms varchar(MAX),
	@Rates varchar(MAX)
AS
BEGIN TRY
	BEGIN TRANSACTION
	SET NOCOUNT ON;

	INSERT INTO Invoice
	(BookingID, Rooms, Rates)
	VALUES
	(@BookingID, @Rooms, @Rates)

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_DeclineBooking]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-17
-- Description:	Decline a booking
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeclineBooking]
	-- Add the parameters for the stored procedure here
	@BookingID int
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Booking
	SET [Status] = 'D'
	WHERE
	BookingID = @BookingID

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRoomType]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 15/08/2014
-- Description:	Stored procedure for deleting a room type
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteRoomType] 
	-- Add the parameters for the stored procedure here
	@TypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Room_Type 
			SET Available = 'No'
			WHERE TypeID = @TypeID
	COMMIT TRANSACTION
		END TRY

		BEGIN CATCH
			THROW
			ROLLBACK TRANSACTION
		END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DisableRoom]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-08
-- Description:	Disable a specific room
-- =============================================
CREATE PROCEDURE [dbo].[sp_DisableRoom]
	@RoomID int

AS
BEGIN
	SET NOCOUNT ON;

    UPDATE Room
	SET	[Status] = 'Disabled'
	WHERE RoomID = @RoomID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_FindOccupant]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_FindOccupant] 
	-- Add the parameters for the stored procedure here
	@UserInput varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Room_Type
	WHERE Name LIKE '%'+@UserInput+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProvisionalBookings]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-12
-- Description:	Get list of all provisional bookings
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllProvisionalBookings]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Booking.BookingID, (Member.FirstName + ' ' + Member.Surname) AS NAME, Booking.ArriveDate, Booking.DepartDate
	FROM Booking, Member
	WHERE
	Booking.MemberID = Member.MemberID
	AND
	[Status] = 'P'
	ORDER BY ArriveDate
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAvailableRoomTypes]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 15/08/2014
-- Description:	Stored procedure for generating a list of active room types
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAvailableRoomTypes]
	-- Add the parameters for the stored procedure here
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT *, Rate.RatePerNight
	FROM Room_Type, Rate
	WHERE Room_Type.Available = 'Yes' AND Room_Type.TypeID = Rate.RoomTypeID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookingHistory]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-28
-- Description:	Gets booking history for a specific member
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBookingHistory]
	-- Add the parameters for the stored procedure here
	@MemberID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT BookingID, ArriveDate, DepartDate, ProofOfPayment, [Status]
	FROM Booking
	WHERE
	MemberID = @MemberID
	ORDER BY BookingID DESC
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookingOwner]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-28
-- Description:	Get booking owner
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBookingOwner]
	-- Add the parameters for the stored procedure here
	@BookingID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MemberID FROM Booking WHERE BookingID = @BookingID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetBusinessDetails]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-12
-- Description:	Returns the business data
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBusinessDetails]

AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Business
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCheckedInBookings]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-24
-- Description:	Get a list of all checked in bookings
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCheckedInBookings] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Booking.BookingID, (Member.FirstName + ' ' + Member.Surname) AS Name, Booking.CheckinDate
	FROM Booking, Member
	WHERE
	Booking.MemberID = Member.MemberID
	AND
	Booking.CheckinDate IS NOT NULL
	And
	Booking.CheckoutDate IS NULL
	ORDER BY Booking.ArriveDate
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCities]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 29/08/2014
-- Description:	Get cities for combo box
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCities]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM City
	ORDER BY CityName ASC
	END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetConfirmedBookings]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-24
-- Description:	Get's a list of all confirmed bookings
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetConfirmedBookings]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Booking.BookingID, (Member.FirstName + ' ' + Member.Surname) AS Name, Booking.ArriveDate, Booking.DepartDate
	FROM Booking, Member
	WHERE
	Booking.MemberID = Member.MemberID
	AND
	Booking.Status = 'A'
	AND Booking.CheckinDate IS NULL
	ORDER BY Booking.ArriveDate
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCurrentOccupants]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCurrentOccupants] 
	-- Add the parameters for the stored procedure here
	@TodaysDate date, 
	@UserInput varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT BookingID, ArriveDate, DepartDate, MemberID, (SELECT FirstName+' '+Surname FROM Member WHERE Member.MemberID = Booking.MemberID) as FullName, (SELECT Rooms FROM Invoice WHERE Invoice.BookingID = Booking.BookingID) as RoomsBooked
	FROM Booking
	WHERE CheckinDate <= @TodaysDate AND CheckoutDate IS NULL 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetDeletedRoomTypes]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 15/08/2014
-- Description:	Stored procedure that generates a list of deleted room types
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetDeletedRoomTypes]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *, Rate.RatePerNight
	FROM Room_Type, Rate
	WHERE Available = 'No' AND Room_Type.TypeID = Rate.RoomTypeID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetDepositAmount]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-12
-- Description:	Get deposit amount
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetDepositAmount] 
	-- Add the parameters for the stored procedure here
	@BookingID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Booking.ArriveDate, Booking.DepartDate, Invoice.Rates
	FROM
	Booking, Invoice
	WHERE
	Booking.BookingID = Invoice.BookingID
	AND
	Invoice.BookingID = @BookingID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetDisabledRoomList]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014/08/02
-- Description:	Returns a list of all rooms that have disabled status
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetDisabledRoomList]

AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Room, Room_Type
	WHERE [Status] = 'disabled' AND Room.TypeID = Room_Type.TypeID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetInvoiceDetails]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-10-04
-- Description:	Get's invoice details
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetInvoiceDetails] 
	-- Add the parameters for the stored procedure here
	@InvoiceID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT BookingID, Rooms, Rates
	FROM Invoice
	WHERE BookingID = @InvoiceID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetLastBookingID]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-07
-- Description:	Get the last Booking ID
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLastBookingID]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT BookingID
	FROM Booking
	ORDER BY BookingID DESC
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetLastRoomID]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-08
-- Description:	Get the last room ID
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLastRoomID]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT RoomID 
	FROM Room
	ORDER BY RoomID DESC

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetLastRoomTypeID]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 15/08/2014
-- Description:	Stored procedure to get the last room type ID entered into the database
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLastRoomTypeID]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TypeID
	FROM Room_Type
	ORDER BY TypeID DESC
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfAllRooms]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-04
-- Description:	Get a list of all rooms for availability
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetListOfAllRooms]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT Room.RoomID, Room.RoomNo, Room.Picture, Room_Type.Name, Room_Type.MaxCapacity, Rate.RatePerNight
	FROM
	Room, Room_Type, Rate
	WHERE
	Room.TypeID = Room_Type.TypeID
	AND
	Room_Type.TypeID = Rate.RoomTypeID
	AND
	Room.[Status] = 'enabled'
	ORDER BY Room.RoomNo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfSpecificRooms]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-04
-- Description:	Get list of rooms for a specific room type. Used for filtering rooms on availability page
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetListOfSpecificRooms] 
	-- Add the parameters for the stored procedure here
	@TypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Room.RoomID, Room.RoomNo, Room.Picture, Room_Type.Name, Room_Type.MaxCapacity, Rate.RatePerNight
	FROM
	Room, Room_Type, Rate
	WHERE
	Room.TypeID = Room_Type.TypeID
	AND Room.TypeID = @TypeID
	AND Room_Type.TypeID = Rate.RoomTypeID
	AND Room.[Status] = 'enabled'
	ORDER BY Room.RoomNo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetMemberDetails]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-06-10
-- Description:	This gets the profile details for a member
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMemberDetails] 
	@MemberID int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT MemberID, FirstName, Surname, AddressLine1, AddressLine2, Suburb, PostalCode, City, PhoneNo, Email, [Role] FROM Member WHERE MemberID = @MemberID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetMemberNameList]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014/08/18
-- Description:	Returns a list of MemberID, and combined FirstName and Surname
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMemberNameList]

AS
BEGIN
	SET NOCOUNT ON;

	SELECT MemberID, (Member.FirstName + ' ' + Member.Surname) AS Name
	FROM Member
	ORDER BY FirstName;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetMemberSearchList]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-19
-- Description:	Return a list of members based on a search query
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMemberSearchList]
	@SearchQuery varchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT MemberID, (FirstName + ' ' + Surname) AS Name
	FROM Member
	WHERE FirstName LIKE '%' + @SearchQuery + '%'
	OR Surname LIKE '%' + @SearchQuery + '%'
	OR  FirstName + Surname LIKE '%' + @SearchQuery + '%'
	OR Surname + FirstName LIKE '%' + @SearchQuery + '%'
	ORDER BY Name;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetProvisionalBookingDetails]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-14
-- Description:	Get details about a provisional booking
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetProvisionalBookingDetails]
	-- Add the parameters for the stored procedure here
	@BookingID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (Member.FirstName + ' ' + Member.Surname) AS Name, Member.Email, Member.PhoneNo, Booking.ArriveDate, Booking.DepartDate, Booking.ProofOfPayment
	FROM Booking, Member
	WHERE
	Booking.BookingID = @BookingID
	AND
	Member.MemberID = Booking.MemberID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetProvisionalBookingsPOP]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-14
-- Description:	Get all provisional bookings with proof of payment
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetProvisionalBookingsPOP]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Booking.BookingID, (Member.FirstName + ' ' + Member.Surname) AS NAME, Booking.ArriveDate, Booking.DepartDate
	FROM Booking, Member
	WHERE
	Booking.MemberID = Member.MemberID
	AND
	[Status] = 'P'
	AND
	Booking.DateOfDeposit IS NOT NULL
	ORDER BY ArriveDate
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetProvisionalBookingsWithoutPOP]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-14
-- Description:	Gets a list of all provisional bookings without proof of payment
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetProvisionalBookingsWithoutPOP]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Booking.BookingID, (Member.FirstName + ' ' + Member.Surname) AS NAME, Booking.ArriveDate, Booking.DepartDate
	FROM Booking, Member
	WHERE
	Booking.MemberID = Member.MemberID
	AND
	[Status] = 'P'
	AND
	Booking.DateOfDeposit IS NULL
	ORDER BY ArriveDate
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRate]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-11
-- Description:	Get's the current rate for a room
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRate]
	-- Add the parameters for the stored procedure here
	@RoomID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Rate.RatePerNight 
	FROM Rate, Room, Room_Type
	WHERE
	Room.RoomID = @RoomID
	AND
	Room.TypeID = Room_Type.TypeID
	AND
	Room_Type.TypeID = Rate.RoomTypeID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRole]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-12
-- Description:	Get member role
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRole]
	-- Add the parameters for the stored procedure here
	@MemberID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Role] FROM Member
	WHERE
	MemberID = @MemberID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRoomDetails]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-07
-- Description:	Get details of a specific room
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoomDetails] 
	@RoomID int

AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM Room
	WHERE RoomID = @RoomID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRoomList]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014/08/02
-- Description:	Returns a list of all rooms with enabled status
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoomList]  

AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Room, Room_Type 
	WHERE [Status] = 'enabled' AND Room.TypeID = Room_Type.TypeID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRoomName]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoomName] 
	-- Add the parameters for the stored procedure here
	@RoomNo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoomNo
	FROM Room
	WHERE RoomID = @RoomNo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRoomTypeDetails]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 15/08/2014
-- Description: Stored procedure to get a set room types details
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoomTypeDetails] 
	-- Add the parameters for the stored procedure here
	@TypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TypeID, Name, MaxCapacity, Rate.RatePerNight
	FROM Room_Type, Rate
	WHERE TypeID = @TypeID AND Room_Type.TypeID = Rate.RoomTypeID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetRoomTypeList]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-01
-- Description:	Get List of Room Types
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoomTypeList]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT TypeID, Name 
	FROM Room_Type
	WHERE Available = 'Yes'
	ORDER BY MaxCapacity
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetSpecificAvailableRoom]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason
-- Create date: 2014-08-05
-- Description:	Get's a specific room that is available.
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSpecificAvailableRoom]
	-- Add the parameters for the stored procedure here
	@RoomID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Room.RoomID, Room.RoomNo, Room_Type.Name, Room_Type.MaxCapacity, Rate.RatePerNight
	FROM
	Room, Room_Type, Rate
	WHERE
	Room.TypeID = Room_Type.TypeID
	AND Room.RoomID = @RoomID
	AND Room_Type.TypeID = Rate.RoomTypeID
	ORDER BY Room.RoomNo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetSuburbs]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stuart
-- Create date: 29/08/2014
-- Description:	Get all  suburbs for combo box
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSuburbs] 
	-- Add the parameters for the stored procedure here
	@CityID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SuburbName, PostalCode
	FROM Suburb
	WHERE CityID = @CityID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTypeList]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014/08/03
-- Description:	Returns a list of every room type
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTypeList] 

AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Room_Type
	WHERE Available = 'Yes'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SetAvailable]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-09-30
-- Description:	Make's the rooms available again
-- =============================================
CREATE PROCEDURE [dbo].[sp_SetAvailable]
	-- Add the parameters for the stored procedure here
	@BookingID int
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Availability]
	SET
	Available = 1,
	BookingID = NULL
	WHERE
	BookingID = @BookingID

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_SetUnavailable]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-08-07
-- Description:	Sets booked rooms to unavailable
-- =============================================
CREATE PROCEDURE [dbo].[sp_SetUnavailable]
	-- Add the parameters for the stored procedure here
	@StartDate date,
	@EndDate date,
	@RoomID int,
	@BookingID int
AS
BEGIN TRY
	BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Availability]
	SET
	Available = 0,
	BookingID = @BookingID
	WHERE
	[Date] BETWEEN @StartDate AND @EndDate
	And RoomID = @RoomID

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	THROW
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBusinessDetails]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateBusinessDetails]  
	-- Add the parameters for the stored procedure here
	@Name varchar(100),
	@PhoneNo varchar(20),
    @Email varchar(100),
    @Server varchar(100),
    @Port int,
	@EmailPassword varchar(50),
    @Address1 varchar(100),
    @Address2 varchar(100),
    @Percentage int,
	@BankName varchar(50),
	@AccountNo varchar(20),
	@BranchCode varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Business
			SET Name = @Name,
				PhoneNo = @PhoneNo,
				Email = @Email,
				EmailServer = @Server,
				EmailPort = @Port,
				EmailPassword = @EmailPassword,
				AddressLine1 = @Address1,
				AddressLine2 = @Address2,
				DepositPercent = @Percentage,
				BankName = @BankName,
				BankAccountNo = @AccountNo,
				BranchCode = @BranchCode
			WHERE BusinessID = '1'

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		THROW
		ROLLBACK TRANSACTION
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMember]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-06-10
-- Description:	Updating member details without updating the password.
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateMember]
	@MemberID int,
	@FirstName varchar(100),
	@Surname varchar(100),
	@AddressLine1 varchar(MAX),
	@AddressLine2 varchar(MAX),
	@Suburb varchar(100),
	@PostalCode varchar(50),
	@City varchar(MAX),
	@PhoneNo varchar(20),
	@Email varchar(MAX),
	@Role int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Member
	SET
	FirstName = @FirstName,
	Surname = @Surname,
	AddressLine1 = @AddressLine1,
	AddressLine2 = @AddressLine2,
	Suburb = @Suburb,
	PostalCode = @PostalCode,
	City = @City,
	PhoneNo = @PhoneNo,
	Email = @Email,
	[Role] = @Role
	WHERE MemberID = @MemberID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMemberPassword]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-20
-- Description:	Update a members password only
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateMemberPassword]
	@Email varchar(MAX),
	@Password varchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Member
	SET	[Password] = @Password
	WHERE Email = @Email

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMemberWithPassword]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-06-10
-- Description:	Update member details including their password
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateMemberWithPassword]
	@MemberID int,
	@FirstName varchar(100),
	@Surname varchar(100),
	@AddressLine1 varchar(MAX),
	@AddressLine2 varchar(MAX),
	@Suburb varchar(100),
	@PostalCode varchar(50),
	@City varchar(MAX),
	@PhoneNo varchar(20),
	@Email varchar(MAX),
	@Password varchar(MAX),
	@Role int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Member
	SET
	FirstName = @FirstName,
	Surname = @Surname,
	AddressLine1 = @AddressLine1,
	AddressLine2 = @AddressLine2,
	Suburb = @Suburb,
	PostalCode = @PostalCode,
	City = @City,
	PhoneNo = @PhoneNo,
	Email = @Email,
	[Password] = @Password,
	[Role] = @Role
	WHERE MemberID = @MemberID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProofOfPayment]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-12
-- Description:	Updates the proof of payment for a booking
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateProofOfPayment]
	@BookingID int,
	@ProofOfPayment varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Booking
	SET
	ProofOfPayment = @ProofOfPayment
	WHERE BookingID = @BookingID

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRoom]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-10
-- Description:	Updates a room with supplied data
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateRoom]
	@RoomID int,
	@RoomNo varchar(50),
	@Description varchar(MAX),
	@Picture varchar(50),
	@TypeID int,
	@Status varchar(10),
	@WifiStatus varchar(10),
	@AirconStatus varchar(10),
	@RoomserviceStatus varchar(10),
	@TelevisionStatus varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE Room
	SET
	RoomNo = @RoomNo,
	[Description] = @Description,
	Picture = @Picture,
	TypeID = @TypeID,
	[Status] = @Status,
	WifiStatus = @WifiStatus,
	AirconStatus = @AirconStatus,
	RoomserviceStatus = @RoomserviceStatus,
	TelevisionStatus = @TelevisionStatus
	WHERE RoomID = @RoomID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRoomType]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Stored procedure to update a room type and its associated rate concurrently
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateRoomType]
	-- Add the parameters for the stored procedure here
	@TypeID int,
	@Name varchar(50),
	@MaxCapacity int,
	@RatePerNight float	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Room_Type
			SET Name = @Name,
				MaxCapacity = @MaxCapacity,
				Available = 'Yes'
			WHERE TypeID = @TypeID

			UPDATE Rate
			SET RatePerNight = @RatePerNight
			WHERE Rate.RoomTypeID = @TypeID
			
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		THROW
		ROLLBACK TRANSACTION
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ValidateEmail]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-07-24
-- Description:	Check if an email already exists when registering.
-- =============================================
CREATE PROCEDURE [dbo].[sp_ValidateEmail]
	@Email varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT Email FROM Member WHERE Email = @Email
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ValidateLogin]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jason Louw
-- Create date: 2014-06-10
-- Description:	Checks username and password for a login
-- =============================================
CREATE PROCEDURE [dbo].[sp_ValidateLogin]
	@Email varchar(MAX),
	@Password varchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT MemberID, FirstName, Surname, [Role] FROM Member WHERE Email = @Email AND Password = @Password
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ValidateRoomNo]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael
-- Create date: 2014-08-28
-- Description:	Check if a room number already exists
-- =============================================
CREATE PROCEDURE [dbo].[sp_ValidateRoomNo]
	@RoomNo varchar(20)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT RoomNo FROM Room WHERE RoomNo = @RoomNo
END

GO
/****** Object:  Table [dbo].[Availability]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availability](
	[RoomID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[BookingID] [int] NULL,
 CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[ArriveDate] [date] NOT NULL,
	[DepartDate] [date] NOT NULL,
	[ProofOfPayment] [varchar](max) NULL,
	[DateOfDeposit] [date] NULL,
	[DateOfFinalPayment] [date] NULL,
	[CheckinDate] [datetime] NULL,
	[CheckoutDate] [datetime] NULL,
	[Status] [varchar](1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ConfirmedBy] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Business]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[PhoneNo] [varchar](20) NULL,
	[Email] [varchar](100) NOT NULL,
	[EmailPassword] [varchar](50) NOT NULL,
	[EmailServer] [varchar](100) NOT NULL,
	[EmailPort] [int] NOT NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[DepositPercent] [int] NOT NULL,
	[BankName] [varchar](50) NOT NULL,
	[BankAccountNo] [varchar](20) NOT NULL,
	[BranchCode] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Cuty] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceNo] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[Rooms] [varchar](max) NOT NULL,
	[Rates] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[AddressLine1] [varchar](max) NOT NULL,
	[AddressLine2] [varchar](max) NULL,
	[Suburb] [varchar](max) NOT NULL,
	[PostalCode] [varchar](100) NOT NULL,
	[City] [varchar](max) NOT NULL,
	[PhoneNo] [varchar](20) NOT NULL,
	[Role] [tinyint] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[RatePerNight] [float] NOT NULL,
	[RoomTypeID] [int] NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Picture] [varchar](50) NULL,
	[TypeID] [int] NOT NULL,
	[Status] [varchar](10) NULL,
	[WifiStatus] [varchar](10) NULL,
	[AirconStatus] [varchar](10) NULL,
	[RoomserviceStatus] [varchar](10) NULL,
	[TelevisionStatus] [varchar](10) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room_Type]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room_Type](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[MaxCapacity] [int] NOT NULL,
	[Available] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Room_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suburb]    Script Date: 2014-10-09 03:29:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suburb](
	[SuburbID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[SuburbName] [varchar](max) NOT NULL,
	[PostalCode] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Suburb] PRIMARY KEY CLUSTERED 
(
	[SuburbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Member]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Member1] FOREIGN KEY([ConfirmedBy])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Member1]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Room_Type1] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[Room_Type] ([TypeID])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_Room_Type1]
GO
ALTER TABLE [dbo].[Suburb]  WITH CHECK ADD  CONSTRAINT [FK_Suburb_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Suburb] CHECK CONSTRAINT [FK_Suburb_City]
GO
USE [master]
GO
ALTER DATABASE [Monkey_Business] SET  READ_WRITE 
GO
