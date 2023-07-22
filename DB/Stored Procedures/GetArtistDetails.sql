/****** Object:  StoredProcedure [dbo].[GetArtistDetails1]    Script Date: 7/21/2023 10:56:53 PM ******/
CREATE PROCEDURE [dbo].[GetArtistDetails]
	-- Add the parameters for the stored procedure here
	@artistID INT =107
AS
BEGIN
	SELECT a.[title] AS ArtistTitle, a.[biography], a.[imageURL], a.[heroURL],
	al.[albumID], al.[title] AS AlbumTitle, al.[imageURL] AS AlbumImage, al.[year],
	s.[songID], s.[dateCreation], s.[title], s.[bpm], s.[timeSignature], s.[multitracks], s.[customMix],
	s.[chart], s.[rehearsalMix], s.[patches], s.[songID], s.[proPresenter]
	FROM Artist a
	LEFT JOIN Album al ON a.[artistID] = al.[artistID]
	LEFT JOIN Song s ON al.[albumID] = s.[albumID]
	WHERE 
		a.[artistID] = @artistID
END