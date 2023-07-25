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