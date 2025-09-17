-- partitioning.sql

-- step 2 create a new partitioned table
ALTER TABLE bookings RENAME TO bookings_old;

CREATE TABLE bookings (
    id SERIAL,
    user_id INT NOT NULL REFERENCES users(id),
    property_id INT NOT NULL REFERENCES properties(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT bookings_pk PRIMARY KEY (id, start_date)
) PARTITION BY RANGE (start_date);

-- step 3 Create partitions  (yearly)
CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_default PARTITION OF bookings DEFAULT;
-- STEP 4 :COPY EXISTING DATA FROM OLD TABLE
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, total_price)
SELECT id, user_id, property_id, start_date, end_date, total_price
FROM bookings_old;

-- STEP 5: example query to test performance
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';
-- 