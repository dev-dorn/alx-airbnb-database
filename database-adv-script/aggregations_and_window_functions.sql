-- Task 2: Aggregations and window functions

-- 1. find the total number of bookings made by each user

SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

-- 2. Rank properties based on the number of bookings
SELECT
    p.id AS property_id,
    p.title,
    COUNT(b.id) AS total_bookings,
    RANK() over (ORDER BY COUNT(b.id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_row_number
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY total_bookings DESC;