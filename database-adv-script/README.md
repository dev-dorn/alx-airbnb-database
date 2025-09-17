# ALX Airbnb Advanced SQL Joins Queries

This folder contains advanced SQL join queries for the ALX Airbnb Database project.  
The queries demonstrate different types of SQL joins to retrieve related data from multiple tables.

---

## 0. INNER JOIN – Retrieve all bookings and the users who made them
```sql
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
```
> Retrieves only bookings that have a corresponding user.

---

## 1. LEFT JOIN – Retrieve all properties and their reviews, including properties with no reviews
```sql
select
    p.id AS property_id,
    p.title,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

```
> Retrieves all properties, showing reviews where available. Properties without reviews will still appear with `NULL` in review columns.

---

## 2. RIGHT JOIN – Retrieve all reviews and their properties, including reviews not linked to a property
```sql
SELECT
    r.id AS review_id,
    r.rating,
    r.comment,
    p.id AS property_id,
    p.name AS property_name
FROM reviews r
RIGHT JOIN properties p ON r.property_id = p.id;
```
> Retrieves all properties and their reviews. Reviews not linked to a property will appear as `NULL` in property columns.

---

## 3. FULL OUTER JOIN – Retrieve all users and all bookings, even if the user has no booking or the booking is not linked to a user
```sql
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

```
> Retrieves all users and all bookings. Users without bookings and bookings without users will appear with `NULL` in missing columns.

---

## 4. SELF JOIN – Retrieve pairs of users who share the same email domain
```sql
SELECT
    u1.id AS user1_id,
    u1.name AS user1_name,
    u2.id AS user2_id,
    u2.name AS user2_name
FROM users u1
INNER JOIN users u2 
    ON u1.id <> u2.id
    AND SUBSTRING(u1.email FROM POSITION('@' IN u1.email)) = SUBSTRING(u2.email FROM POSITION('@' IN u2.email));
```
> Compares users within the same table to find relationships, such as shared email domains.

---

## 5. CROSS JOIN – Retrieve all possible combinations of properties and users
```sql
SELECT
    p.id AS property_id,
    p.name AS property_name,
    u.id AS user_id,
    u.name AS user_name
FROM properties p
CROSS JOIN users u;
```


### Non-Correlated Subquery  
**Objective:** Find all properties where the average rating is greater than 4.0.  

```sql
SELECT 
    p.id,
    p.title,
    p.location,
    p.price_per_night
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);
```
### Correlated Subquery  
**Objective:** Find users who have made more than 3 bookings 
```sql
SELECT 
    u.id,
    u.name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;




---