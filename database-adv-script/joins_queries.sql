
-- INNER JOIN bookings + users
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    b.start_date,
    b.end_date,
    b.total_price
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN properties + reviews
select
    p.id AS property_id,
    p.title,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;


-- FULL OUTER JOIN: users + bookings
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

