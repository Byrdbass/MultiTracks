CREATE PROCEDURE dbo.AddArtist
    @title VARCHAR(100),
    @biography VARCHAR(MAX),
    @imageURL VARCHAR(500),
    @heroURL VARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Artist (title, biography, imageURL, heroURL)
    VALUES (@title, @biography, @imageURL, @heroURL);
END