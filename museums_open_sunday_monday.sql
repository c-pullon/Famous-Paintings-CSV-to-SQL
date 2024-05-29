-- displaying the names and cities of museums open on both sunday and monday

-- method 1: joining museum_hours twice and setting one day condition on both identical tables
SELECT m.name, m.city
FROM museum m
JOIN museum_hours mh1 ON m.museum_id = mh1.museum_id
JOIN museum_hours mh2 ON m.museum_id = mh2.museum_id
WHERE mh1.day = 'Sunday' AND mh2.day = 'Monday'


-- method 2: using a subquery with EXISTS. this is more efficient
SELECT 
	name, 
	city 
FROM museum
JOIN museum_hours mh1 ON museum.museum_id = mh1.museum_id
WHERE day = 'Sunday'
AND EXISTS (
	SELECT 1 
	FROM museum_hours mh2 
	WHERE mh2.museum_id = mh1.museum_id 
	AND mh2.day = 'Monday'
);

