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
    base_ticket_price DECIMAL(10,2) NOT NULL CHECK(base_ticket_price>=0),
    match_status VARCHAR(30) NOT NULL,
    
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

-- INSERT SOME DATA TO MY DATABASE  

--1. INSERT USER DATA 

INSERT INTO users(full_name,email,role,phone_number) 
VALUES('Diganta Sikder','digantasikder123@gmail.com','FootBall Fan','01308340811'),
('Shasank Sikder','shasanksikder088@gmail.com','FootBall Fan','01742814803'),
('Jharna Rani Sikder','jharnasikder088@gmail.com','Ticket Manager','01811387952'),
('Shipan Sikder ','shipansikder123@gmail.com','FootBall Fan','01610673585'),
('Shuchitra Sikder','shuchitrasikder123@gmail.com','FootBall Fan',NULL);