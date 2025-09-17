# Index Performance

## 🎯 Objective
Identify and create indexes to improve query performance in the **User**, **Booking**, and **Property** tables.

---

## 🔍 Step 1: Identify High-Usage Columns
Indexes were chosen for columns frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses:

- **users**
  - `email` → often searched during login or lookups
- **bookings**
  - `user_id` → joins with `users`
  - `property_id` → joins with `properties`
  - `created_at` → used in ORDER BY and filtering by date
- **properties**
  - `location` → used in WHERE clauses for searches
  - `price` → used in sorting and range queries

> Note: Primary keys (`id`) are already indexed by default.

---

## 🛠 Step 2: Create Indexes
The SQL commands are stored in 


Example:
```sql
CREATE INDEX idx_users_email ON users(email);
-- Bookings table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
- Properties table indexes
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price_per_night);
```
---

## 🚀 Step 3: Measure performance
Use `EXPLAIN ANALYZE` to compare query performance before and after adding indexes.
Example:
```sql
EXPLAIN ANALYZE
SELECT u.name, p.title, b.created_at
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE p.location = 'Nairobi'
ORDER BY b.created_at DESC;
```