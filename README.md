# ⚽ Football Ticket Booking System - Database Project

## 📌 Project Overview
This project is a **Football Ticket Booking System Database Design** built using relational database concepts.  
It manages users, football matches, and ticket bookings with proper relationships and constraints.

The system demonstrates:
- ERD Design
- Relational Database Structure
- SQL Queries (JOIN, Subquery, Aggregation, Filtering)
- Referential Integrity using Primary and Foreign Keys

---

## 🎯 Objectives
- Design a proper ERD with relationships
- Implement Users, Matches, and Bookings tables
- Apply Primary Key and Foreign Key constraints
- Write complex SQL queries
- Handle NULL values and aggregations

---

## 🗄️ Database Tables

### 1️⃣ Users Table
Stores all users of the system.

| Field | Description |
|------|------------|
| user_id | Primary Key |
| full_name | User full name |
| email | Login email |
| role | Ticket Manager / Football Fan |
| phone_number | Contact number |

---

### 2️⃣ Matches Table
Stores football match details.

| Field | Description |
|------|------------|
| match_id | Primary Key |
| fixture | Teams playing |
| tournament_category | League name |
| base_ticket_price | Ticket price |
| match_status | Availability status |

---

### 3️⃣ Bookings Table
Stores ticket booking records.

| Field | Description |
|------|------------|
| booking_id | Primary Key |
| user_id | Foreign Key → Users |
| match_id | Foreign Key → Matches |
| seat_number | Seat assigned |
| payment_status | Payment status |
| total_cost | Final price |

---

## 🔗 Relationships

- One User → Many Bookings
- One Match → Many Bookings
- Bookings table links Users and Matches

👉 This ensures **referential integrity**

---

## 🧠 Key Concepts Used

- Primary Key (PK)
- Foreign Key (FK)
- INNER JOIN
- LEFT JOIN
- Subquery
- Aggregation (COUNT, AVG)
- NULL handling (COALESCE)
- Filtering (WHERE, HAVING)
- Pattern matching (LIKE, ILIKE)

---

## 🧾 Sample SQL Queries

### 1. Champions League Available Matches
```sql
SELECT match_id, fixture, base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
AND match_status = 'Available';
```