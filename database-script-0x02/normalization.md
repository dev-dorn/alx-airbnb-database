# Airbnb Database Normalization to 3NF

## Step 1: Identify Redundancies
- Host ID in bookings is redundant (host info is via property).
- Amenities and photos stored as text violate atomicity.
- City and country repeated for multiple properties.

## Step 2: Apply 1NF
- Create `property_amenities` and `property_photos` tables.
- Ensure each column stores atomic values.

## Step 3: Apply 2NF
- Remove `host_id` from bookings table to eliminate partial dependency.
- All non-key attributes depend entirely on the primary key.

## Step 4: Apply 3NF
- Create `locations` table for city and country.
- Link properties to locations via `location_id`.
- Consider splitting reviews into `user_reviews` and `property_reviews` to remove transitive dependencies.
- Confirm no non-key attribute depends on another non-key attribute.

## Step 5: Benefits
- Reduced data redundancy.
- Easier maintenance and updates.
- Improved data integrity.
