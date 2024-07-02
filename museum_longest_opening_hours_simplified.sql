SELECT TOP 1 
        m.name,
        m.state,
        CONVERT(time, mh.[open]) AS open_time,
        CONVERT(time, mh.[close]) AS close_time,
        CONVERT(time, DATEADD(MINUTE, DATEDIFF(MINUTE, 
                                               CONVERT(datetime, mh.[open], 100), 
                                               CONVERT(datetime, mh.[close], 100)
                                              ), '00:00:00')) AS duration
        
    FROM museum_hours mh
    JOIN museum m ON m.museum_id = mh.museum_id
	ORDER BY duration DESC;

