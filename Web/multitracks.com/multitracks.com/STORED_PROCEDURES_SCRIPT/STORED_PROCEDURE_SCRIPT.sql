USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MultitracksDB')
BEGIN
    CREATE DATABASE MultitracksDB;
    PRINT 'MultitracksDB database created successfully.';
END
ELSE
BEGIN
    PRINT 'MultitracksDB database already exists.';
END

USE [MultiTracksDB]
GO
/****** Object:  StoredProcedure [dbo].[AddArtist]    Script Date: 7/24/2023 6:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[AddArtist]
    @title VARCHAR(100),
    @biography VARCHAR(MAX),
    @imageURL VARCHAR(500),
    @heroURL VARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Artist (title, biography, imageURL, heroURL)
    VALUES (@title, @biography, @imageURL, @heroURL);

    DECLARE @artistID INT;
    SET @artistID = SCOPE_IDENTITY();

	DECLARE @currentYear INT;
    SET @currentYear = YEAR(GETDATE());

    INSERT INTO dbo.Album (dateCreation, artistID, title, imageURL, [year])
    VALUES (GETDATE(), @artistID, 'new artist no album Title yet', 'new artist no album Image yet', @currentYear);

    DECLARE @albumID INT;
    SET @albumID = SCOPE_IDENTITY();

    INSERT INTO dbo.Song (dateCreation, albumID, artistID, title, bpm, timeSignature, multitracks, customMix, chart, rehearsalMix, patches, songSpecificPatches, proPresenter)
    VALUES (GETDATE(), @albumID, @artistID, 'new artist no songs yet', 0.0, 0, 0, 0,0, 0, 0,0, 0);
END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistDetails]    Script Date: 7/24/2023 6:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetArtistDetails]
	-- Add the parameters for the stored procedure here
	@artistID INT =107
AS
BEGIN
	SELECT a.[title] AS ArtistTitle, a.[biography] AS Bio, a.[imageURL] AS Img, a.[heroURL] AS HeroImg,
	al.[albumID], al.[title] AS AlbumTitle, al.[imageURL] AS AlbumImage, al.[year] AS AlbumYear,
	s.[songID] AS SongID, s.[dateCreation] AS SongDate, s.[title] AS SongTitle, s.[bpm] AS BPM, s.[timeSignature] AS TS
	, s.[multitracks] AS MT, s.[customMix] AS Mix,
	s.[chart] AS Chart, s.[rehearsalMix] AS RM, s.[patches] AS patches, s.[proPresenter] AS Pro
	FROM Artist a
	LEFT JOIN Album al ON a.[artistID] = al.[artistID]
	LEFT JOIN Song s ON al.[albumID] = s.[albumID]
	WHERE 
		a.[artistID] = @artistID
END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistDetailsByName]    Script Date: 7/24/2023 6:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetArtistDetailsByName]
    @artistName NVARCHAR(100)
AS
BEGIN
    SELECT a.[artistID] as ArtistID, a.[title] AS ArtistTitle, a.[biography] AS Bio, a.[imageURL] AS Img, a.[heroURL] AS HeroImg,
    al.[albumID], al.[title] AS AlbumTitle, al.[imageURL] AS AlbumImage, al.[year] AS AlbumYear,
    s.[songID] AS SongID, s.[dateCreation] AS SongDate, s.[title] AS SongTitle, s.[bpm] AS BPM, s.[timeSignature] AS TS
    , s.[multitracks] AS MT, s.[customMix] AS Mix,
    s.[chart] AS Chart, s.[rehearsalMix] AS RM, s.[patches] AS patches, s.[proPresenter] AS Pro
    FROM Artist a
    LEFT JOIN Album al ON a.[artistID] = al.[artistID]
    LEFT JOIN Song s ON al.[albumID] = s.[albumID]
    WHERE 
        a.[title] LIKE '%' + @artistName + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetAssessmentSteps]    Script Date: 7/24/2023 6:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAssessmentSteps]
	@stepID INT = -1
AS
BEGIN

	SELECT [text]
	FROM AssessmentSteps
	WHERE
		@stepID = -1 OR
		stepID = @stepID

END
GO
