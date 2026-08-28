USE quickride;

-- Question1
SELECT trip_id, rider_name, fare, city 
FROM quickride.trips 
WHERE city = 'Lagos';

-- Question2
SELECT rider_name, city, fare 
FROM trips 
ORDER BY fare 
DESC LIMIT 5;

-- Question3
SELECT DISTINCT city 
FROM trips;

-- Question4
SELECT * 
FROM quickride.trips 
WHERE payment_method = 'Card' 
and fare > 5000; 

-- Question5
SELECT * 
FROM trips 
WHERE distance_km 
BETWEEN 5 AND 10;


-- Question6
SELECT * 
FROM quickride.trips 
WHERE rider_name LIKE 'A%';

-- Question7
SELECT * 
FROM quickride.trips 
WHERE payment_method 
IN ('Card', 'Wallet');

-- Question8
SELECT * 
FROM quickride.trips 
WHERE rating IS NULL;

-- Question9
SELECT city, max(fare) as highest_fare 
FROM quickride.trips 
WHERE status = 'Completed' 
GROUP BY city ORDER BY highest_fare DESC;

-- Question10

SELECT *
FROM trips 
WHERE status = 'Cancelled' 
;

-- Question11
SELECT 
    MAX(fare),
	MIN(fare)
FROM trips
WHERE status = 'Completed';

-- Question12
SELECT 
	vehicle_type,
	COUNT(*)
FROM trips
WHERE status = 'Completed'
GROUP BY vehicle_type;

