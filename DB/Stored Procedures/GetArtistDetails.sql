/****** Object:  StoredProcedure [dbo].[GetArtistDetails1]    Script Date: 7/21/2023 10:56:53 PM ******/
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