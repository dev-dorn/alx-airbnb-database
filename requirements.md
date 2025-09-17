# Airbnb Database ERD Requirements

## Entities
- User
- Property / Listing
- Booking / Reservation
- Payment / Transaction
- Review / Rating
- Message / Chat
- Wishlist / Favorites

## Relationships
- User → Property : 1-to-Many
- User → Booking : 1-to-Many (Guest)
- User → Booking : 1-to-Many (Host)
- User → Review : 1-to-Many
- User → Message : 1-to-Many (Sender & Receiver)
- User → Wishlist : 1-to-Many
- Property → Booking : 1-to-Many
- Property → Review : 1-to-Many
- Property → Wishlist : 1-to-Many
- Booking → Payment : 1-to-1
- Booking → Review : 1-to-1
