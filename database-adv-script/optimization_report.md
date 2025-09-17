# Query Optimization Report

## 🎯 Objective
Refactor a complex query to improve performance in the **Airbnb Database** project.

---

## 📝 Step 1: Initial Query
The initial query joins four tables:

```sql
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
    pay.id AS payment_id,
    
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
```
# Query Optimization Report

## 🎯 Objective
Refactor a complex query to improve performance in the **Airbnb Database** project.

---

## 📝 Step 2: Performance Analysis`EXPLAIN`
Sequential scans `Seq Scan` on `users`, `properties` and `bookings`
joins on foreign keys `user_id`,`property_id`and `booking_id` are not indexed

```sql
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
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    pay.method AS payment_method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
AND b.total_price > 0;

