USE quickride_plus;

-- Q1.  “For the report I need every completed trip showing the rider's name, the driver's name, the city and the fare. The trips table only keeps ids, so bring in the actual names.
SELECT  rider_name, driver_name, trips.city, fare
FROM trips
join riders on trips.rider_id = riders.rider_id
join drivers on trips.driver_id = drivers.driver_id
WHERE status = 'Completed';

-- Q2.  “Pull all our Lagos trips, showing the rider, the driver, the vehicle type and the fare.”

SELECT rider_name, driver_name, vehicle_type, fare
FROM trips
join riders on trips.rider_id = riders.rider_id
join drivers on trips.driver_id = drivers.driver_id
WHERE trips.city = 'Lagos'; 

-- Q3.  “Who are our most valuable riders? Total spend per rider on completed trips, biggest spender first.”
SELECT rider_name, SUM(fare) AS total_spend
FROM riders
JOIN trips ON trips.rider_id = riders.rider_id
WHERE status = 'Completed'
GROUP BY riders.rider_id, riders.rider_name
ORDER BY total_spend DESC;

-- Q4.  “For the driver scorecard: for each driver, how many completed trips they did and their average rating.”

SELECT driver_name, COUNT(trip_id) AS completed_trips, AVG(rating) AS average_rating
FROM drivers 
JOIN trips ON drivers.driver_id = trips.driver_id
WHERE status = 'Completed'
GROUP BY drivers.driver_id, drivers.driver_name;

-- Q5.  “Show me the trips that cost more than our average fare. I want to see the premium rides.”
SELECT *
FROM trips
WHERE status = 'Completed'
AND fare > (
    SELECT AVG(fare)
    FROM trips
    WHERE status = 'Completed'
);

-- “For a reliability badge, which drivers have never had a single cancelled trip?”

SELECT driver_name
FROM drivers
WHERE driver_id NOT IN (
    SELECT driver_id
    FROM trips
    WHERE status = 'Cancelled'
);

-- Q7.  “Marketing wants to feature our biggest ride ever. Which rider took the most expensive trip of all?”

SELECT rider_name
FROM riders
JOIN trips on trips.rider_id = riders.rider_id
WHERE fare = ( SELECT max(fare) from trips);

-- Q8.  “Chioma Bello is our benchmark regular rider. Which riders have taken more trips than she has?”

SELECT rider_name, COUNT(trip_id) AS trip_count
FROM riders 
JOIN trips 
    ON riders.rider_id = trips.rider_id
GROUP BY riders.rider_id, riders.rider_name
HAVING trip_count > (
    SELECT COUNT(*)
    FROM trips
    JOIN riders
        ON trips.rider_id = riders.rider_id
    WHERE riders.rider_name = 'Chioma Bello'
);

-- Q9.  “We want to thank our happy riders. Which riders have given us at least one 5-star trip?”
SELECT rider_name
FROM riders
JOIN trips on trips.rider_id = riders.rider_id
WHERE rating = 5.0;

-- Q10.  “Investors want one combined contact list of everyone in the system: riders and drivers together, each with their name, their city, and whether they are a Rider or a Driver.”
SELECT rider_name AS name,
       city,
       'Rider' AS person_type
FROM riders

UNION

SELECT driver_name AS name,
       home_city AS city,
       'Driver' AS person_type
FROM drivers;

-- Q11.  “Give me one clean list of every city we touch, whether a trip happened there or a driver is based there. No duplicates.”
SELECT city
FROM trips

UNION

SELECT home_city
FROM drivers;

-- Q12.  “Which single driver has earned us the most money in total, and how much? I only want the top earner.”
SELECT driver_name,
       SUM(fare) AS total_earnings
FROM drivers 
JOIN trips 
    ON drivers.driver_id = trips.driver_id
WHERE status = 'Completed'
GROUP BY drivers.driver_id, drivers.driver_name
ORDER BY total_earnings DESC
LIMIT 1;
