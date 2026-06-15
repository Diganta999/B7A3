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