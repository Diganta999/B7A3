--FOOTBALL TICKET BOOKING SYSTEM 


--1. USERS TABLE 

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY ,
    full_name  VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    role VARCHAR(20) NOT NULL CHECK(role IN ('Ticket Manager','FootBall Fan')),
    phone_number TEXT
);

