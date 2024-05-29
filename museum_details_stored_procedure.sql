-- Stored procedure to get the details of a museum from the museum id

-- Define the stored procedure
CREATE PROCEDURE GetMuseumDetails
    @museum_id INT
AS
BEGIN
    SELECT name, city, country
    FROM museum
    WHERE museum_id = @museum_id;
END;
GO

-- Execute the stored procedure for museum_id = 30
EXEC GetMuseumDetails @museum_id = 30;

-- Delete the stored procedure
DROP PROCEDURE GetMuseumDetails;





