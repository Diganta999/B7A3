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
('Shuchitra Sikder','shuchitrasikder123@gmail.com','FootBall Fan',NULL)
('Tanvir Haque','tanvir@gmail.com','FootBall Fan','01915154224')
;

--2. INSERT MATCHES DATA 
INSERT INTO matches(fixture,tournament_category,base_ticket_price,match_status)
VALUES ('Bangladesh vs India','SAFF Championship','500.00','Available'),
('Brazil vs Argentina','International Friendly',1500.00,'Selling fast'),
('Real Madrid vs Barcelona','La Liga',3000.00,'Sold Out'),
('Manchester City vs Liverpool','Premier League',2500.00,'Available'),
('Bayern Munich vs Dortmund','Bundesliga',2000.00,'Postponed')
('PSG vs Arsenal','Champions League',3500.00,'Available');


--3. INSERT BOOKING DATA 


INSERT INTO Bookings(user_id,match_id,seat_number,payment_status,total_cost)
VALUES(1,1,'A01','Confirmed',500.00),
(2,2,'B05','Pending',1500.00),
(4,4,'C10','Confirmed',2500.00),
(1,3,'D15','Cancelled',3000.00),
(2,5,'E20','Refunded',2000.00)
(3,2,'F12',NULL,1500.00);


--QUERY 1 

SELECT match_id, fixture, base_ticket_price FROM matches WHERE tournament_category ='Champions League' AND match_status ='Available';



--QUERY 2 

SELECT user_id,full_name,email FROM users WHERE full_name ILIKE 'Tanvir%' OR full_name ILIKE '%Haque%';



--QUERY 3 

SELECT booking_id,user_id,match_id,COALESCE(payment_status,'Action Required') AS systematic_status FROM Bookings WHERE payment_status IS NULL;


--QUERY 4 

SELECT Bookings.booking_id,users.full_name,matches.fixture,Bookings.total_cost FROM Bookings INNER JOIN users ON Bookings.user_id=users.user_id INNER JOIN matches ON Bookings.match_id=matches.match_id;



--QUERY 5  

SELECT users.user_id,users.full_name,Bookings.booking_id FROM users LEFT JOIN Bookings ON users.user_id=Bookings.booking_id;