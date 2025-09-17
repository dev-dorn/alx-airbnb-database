# Partitioning Performance Report

## Objective
Optimize queries on the large `bookings` table by implementing **table partitioning** using the `start_date` column.

---

## Steps Taken
1. Renamed the old `bookings` table to `bookings_old`.
2. Created a new `bookings` table partitioned by **RANGE (start_date)**.
3. Added partitions for `2024` and `2025` (more can be added as needed).
4. Migrated all existing data from `bookings_old` into the new `bookings` partitioned table.
5. Tested query performance using `EXPLAIN ANALYZE`.

---

## Test Query
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-07-01' AND '2024-07-31';
