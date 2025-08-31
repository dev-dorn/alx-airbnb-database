-- ====================================
-- Airbnb Sample Data Seed Script
-- ====================================

-- ---------------------
-- Users
-- ---------------------
INSERT INTO users (name, email, password_hash, phone_number, role, verification_status, rating)
VALUES
('Alice Johnson', 'alice@example.com', 'hashed_pass_1', '+254700000001', 'host', 'verified', 4.9),
('Bob Smith', 'bob@example.com', 'hashed_pass_2', '+254700000002', 'guest', 'verified', 4.7),
('Carol Wang', 'carol@example.com', 'hashed_pass_3', '+254700000003', 'guest', 'verified', 4.5),
('David Kim', 'david@example.com', 'hashed_pass_4', '+254700000004', 'host', 'pending', 4.6);

-- ---------------------
-- Locations
-- ---------------------
INSERT INTO locations (city, country)
VALUES
('Nairobi', 'Kenya'),
('Mombasa', 'Kenya'),
('Kisumu', 'Kenya');

-- ---------------------
-- Properties
-- ---------------------
INSERT INTO properties (host_id, title, description, property_type, address, location_id, price_per_night)
VALUES
(1, 'Cozy Apartment in City Center', '2 bedroom apartment with modern amenities', 'Apartment', '123 Nairobi St', 1, 50.00),
(4, 'Beachfront Villa', 'Luxury villa with ocean view', 'Villa', '456 Mombasa Ave', 2, 200.00);

-- ---------------------
-- Property Amenities
-- ---------------------
INSERT INTO property_amenities (property_id, amenity)
VALUES
(1, 'WiFi'), (1, 'Air Conditioning'), (1, 'Kitchen'),
(2, 'Pool'), (2, 'WiFi'), (2, 'Parking');

-- ---------------------
-- Property Photos
-- ---------------------
INSERT INTO property_photos (property_id, photo_url)
VALUES
(1, 'https://example.com/photo1.jpg'),
(1, 'https://example.com/photo2.jpg'),
(2, 'https://example.com/villa1.jpg');

-- ---------------------
-- Bookings
-- ---------------------
INSERT INTO bookings (property_id, guest_id, start_date, end_date, status, total_price, payment_status)
VALUES
(1, 2, '2025-09-05', '2025-09-10', 'confirmed', 250.00, 'paid'),
(2, 3, '2025-10-01', '2025-10-07', 'pending', 1400.00, 'pending');

-- ---------------------
-- Payments
-- ---------------------
INSERT INTO payments (booking_id, amount, currency, payment_method, status)
VALUES
(1, 250.00, 'USD', 'PayPal', 'successful');

-- ---------------------
-- Reviews
-- ---------------------
INSERT INTO reviews (reviewer_id, reviewee_id, booking_id, rating, comments)
VALUES
(2, 1, 1, 5, 'Great stay! Highly recommended.'),
(3, 4, 2, 4, 'Beautiful villa, but cleaning could improve.');

-- ---------------------
-- Messages
-- ---------------------
INSERT INTO messages (sender_id, receiver_id, booking_id, message_text, message_type, read_status)
VALUES
(2, 1, 1, 'Hi Alice, looking forward to my stay!', 'text', TRUE),
(1, 2, 1, 'Thanks Bob! See you soon.', 'text', TRUE);

-- ---------------------
-- Wishlists
-- ---------------------
INSERT INTO wishlists (user_id, property_id)
VALUES
(2, 2),
(3, 1);
