--FOOTBALL TICKET BOOKING SYSTEM 


--1. CREATE USERS TABLE 

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY ,
    full_name  VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    role VARCHAR(20) NOT NULL CHECK(role IN ('Ticket Manager','FootBall Fan')),
    phone_number TEXT
);

--2. CREATE MATCH TABLE

CREATE TABLE matches(
    match_id SERIAL PRIMARY KEY,
    fixture VARCHAR(150) NOT  NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price DECIMAL(10,2) NOT NULL,
    match_status VARCHAR(30) NOT NULL,
    CHECK(base_ticket_price>=0),
    CHECK(match_status IN ('Available','Selling fast','Sold Out','Postponed'))
);

--3. CREATE BOOKINGS TABLE 

CREATE TABLE Bookings(
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    match_id INT REFERENCES matches(match_id),
    seat_number VARCHAR(20),
    payment_status VARCHAR(20),
    total_cost DECIMAL(10,2) NOT NULL CHECK(total_cost>=0),
    
    CHECK(payment_status IN ('Pending','Confirmed','Cancelled','Refunded') OR payment_status IS NULL)

);