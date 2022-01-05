SELECT id, name, email, password
FROM users
WHERE email = 'tristanjacobs@gmail.com';


SELECT avg(end_date - start_date) 
FROM reservations;

SELECT properties.id, title, cost_per_night, avg(rating) as average_rating
FROM properties JOIN property_reviews
ON properties.id = property_id
WHERE city like '%ncouver%' 
GROUP BY properties.id
HAVING avg(rating) >= 4
ORDER BY cost_per_night 
Limit 10;



SELECT city, count(reservations.id) as total_reservations
FROM properties JOIN reservations 
ON properties.id=property_id
GROUP BY city
ORDER BY total_reservations DESC;


SELECT properties.id, title, cost_per_night, start_date, avg(rating)  as  average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1 AND reservations.end_date < now()::date
GROUP BY properties.id, title, cost_per_night, start_date
ORDER BY start_date;

