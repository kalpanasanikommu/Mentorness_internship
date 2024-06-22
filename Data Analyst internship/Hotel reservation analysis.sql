USE SQL

SELECT * FROM [Hotel Reservation Dataset]

--1. What is the total number of reservations in the dataset?

SELECT COUNT(*)  AS total_reservations_from_hotel
FROM [Hotel Reservation Dataset]

--2. Which meal plan is the most popular among guests?

SELECT TYPE_OF_MEAL_PLAN, COUNT(*) AS COUNT_OF_MEAL_PLAN 
FROM [Hotel Reservation Dataset]
GROUP BY TYPE_OF_MEAL_PLAN
ORDER BY COUNT_OF_MEAL_PLAN DESC 
offset 0 rows
fetch next 1 rows only

---3. What is the average price per room for reservations involving children

SELECT AVG(Avg_price_per_room) AS Avg_price_with_childern
from [HOTEL RESERVATION DATASET]
WHERE no_of_children > 0;

---4. How many reservations were made for the year 20XX (replace XX with the desired year)?

SELECT COUNT(*) AS RESERVATION_IN_2018 
FROM [Hotel Reservation Dataset]
WHERE YEAR(ARRIVAL_DATE)= 2018

--5. What is the most commonly booked room type?
SELECT  room_type_reserved , COUNT(*) AS COUNT
FROM [HOTEL RESERVATION DATASET]
GROUP BY room_type_reserved
ORDER BY COUNT DESC 
offset 0 rows
fetch next 1 rows only;

---6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?

SELECT COUNT(*) AS WEEKEND_RESERVATIONS 
from [HOTEL RESERVATION DATASET]
WHERE no_of_weekend_nights > 0;

---7. What is the highest and lowest lead time for reservations? 

SELECT MAX(LEAD_TIME) AS Highest_lead_time,
MIN(lead_time) as Lowest_lead_time
from [Hotel Reservation Dataset]

-- 8. What is the most common market segment type for reservations?

SELECT  market_segment_type , COUNT(*) AS COUNT
FROM [HOTEL RESERVATION DATASET]
group by market_segment_type
ORDER BY COUNT DESC 
offset 0 rows
fetch next 1 rows only;

--9. How many reservations have a booking status of "Confirmed"? 

SELECT COUNT(booking_status) AS CONFIRMED_RESERVATIONS
from [HOTEL RESERVATION DATASET]
WHERE booking_status = 'NOT CANCELED';

--10. What is the total number of adults and children across all reservations?

SELECT SUM(no_of_adults) AS TOTAL_ADULTS,
SUM(no_of_children) as TOTAL_CHILDERN
FROM [HOTEL RESERVATION DATASET]

--11. What is the average number of weekend nights for reservations involving children? 

SELECT AVG(no_of_weekend_nights) AS Avg_weekend_night_with_children
FROM [HOTEL RESERVATION DATASET]
WHERE no_of_children > 0;

--12. How many reservations were made in each month of the year?

SELECT MONTH(arrival_date) AS MONTH,
COUNT(*) AS COUNT FROM [HOTEL RESERVATION DATASET]
GROUP BY MONTH(arrival_date)
ORDER BY MONTH

--13. What is the average number of nights (both weekend and weekday) spent by guests for each room 
--type? 

SELECT room_type_reserved,
AVG(no_of_weekend_nights + no_of_week_nights) AS AVG_NIGHTS
FROM[Hotel Reservation Dataset]
GROUP BY room_type_reserved

---14. For reservations involving children, what is the most common room type, and what is the average 
--price for that room type?

SELECT room_type_reserved,COUNT(*) AS COUNT,
AVG(avg_price_per_room) AS AVG_PRICE
FROM[Hotel Reservation Dataset]
GROUP BY room_type_reserved
ORDER BY COUNT DESC 
offset 0 rows
fetch next 1 rows only;


--15. Find the market segment type that generates the highest average price per room. 

SELECT market_segment_type, avg(avg_price_per_room)
as Highest_avg_price_per_room
FROM[Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY Highest_avg_price_per_room desc 
offset 0 rows
fetch next 1 rows only;