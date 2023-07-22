/****** Object:  StoredProcedure [dbo].[GetArtistDetails1]    Script Date: 7/21/2023 10:56:53 PM ******/
CREATE PROCEDURE [dbo].[GetArtistDetails]
	-- Add the parameters for the stored procedure here
	@artistID INT =107
AS
BEGIN
	SELECT [title],[biography],[imageURL],[heroURL]
	FROM Artist
	WHERE 
		artistID = @artistID
END