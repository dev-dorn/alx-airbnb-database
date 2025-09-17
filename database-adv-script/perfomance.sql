SELECT
 b.id AS booking_id,
 b.start_date,
 b.end_date,
 b.total_price,
 u.id AS user_id,
 u.name AS user_name,
 u.email AS user_email,
 p.id AS property_id,
 p.title AS property_title,
 p.location AS property_location,
 p.price_per_night AS property_price
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id

-- Anayze the query with EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT
 b.id AS booking_id,
 b.start_date,
 b.end_date,
 b.total_price,
 u.id AS user_id,
 u.name AS user_name,
 u.email AS user_email,
 p.id AS property_id,
 p.title AS property_title,
 p.location AS property_location,
 p.price_per_night AS property_price
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE p.location = 'Nairobi'
ORDER BY b.start_date DESC;
