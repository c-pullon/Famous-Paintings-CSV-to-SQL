-- showing the museum which is open for the longest hours during a day
-- CTE or subquery is needed as window functions like RANK() cannot be used directly in the WHERE clause of the same query where they are defined. 
-- Using a subquery:

SELECT * FROM (
    SELECT 
        m.name,
        m.state,
        CONVERT(time, mh.[open]) AS open_time,
        CONVERT(time, mh.[close]) AS close_time,
        CONVERT(time, DATEADD(MINUTE, DATEDIFF(MINUTE, 
                                               CONVERT(datetime, mh.[open], 100), 
                                               CONVERT(datetime, mh.[close], 100)
                                              ), '00:00:00')) AS duration,
        RANK() OVER(ORDER BY DATEADD(MINUTE, DATEDIFF(MINUTE, 
                                               CONVERT(datetime, mh.[open], 100), 
                                               CONVERT(datetime, mh.[close], 100)
                                              ), '00:00:00') DESC) AS rank
    FROM museum_hours mh
    JOIN museum m ON m.museum_id = mh.museum_id) x

WHERE x.rank = 1;

