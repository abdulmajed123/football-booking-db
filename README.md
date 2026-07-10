# Football Ticket Booking System - Database Design & SQL Queries

A simplified relational database design and implementation for a **Football Ticket Booking System**. This project showcases the Entity-Relationship Diagram (ERD) architecture, table structures, and intermediate-to-advanced SQL queries to handle real-world ticket purchasing scenarios.

---

## 🚀 Features & Objectives

- **Relational DB Design:** Implementing 1-to-Many and Many-to-1 relationships with full referential integrity.
- **Advanced Querying:** Utilization of inner joins, left joins, subqueries, aggregation, pattern matching (`ILIKE`), and pagination (`LIMIT`/`OFFSET`).
- **Data Integrity:** Strict enforcement of primary keys, foreign keys, and null handling constraint rules.

---

## 🗺️ Entity Relationship Diagram (ERD)

The system is built around three core entities:

1. **Users ($1:N$ with Bookings):** Tracks administrative staff and football fans.
2. **Matches ($1:N$ with Bookings):** Catalogs football tournament events and baseline pricing.
3. **Bookings (Junction/Transactional Table):** Records individual ticket purchases linking a user to a specific match.

> 🔗 **[Click Here to View the Interactive Live ERD on drawSQL](https://drawsql.app/teams/abdul-amjed/diagrams/football-ticket-booking-erd-drawing)**

---

## 🗄️ Database Schema & Architecture

### 1. Users Table

| Field Name     | Data Type    | Constraints | Description                      |
| :------------- | :----------- | :---------- | :------------------------------- |
| `user_id`      | INT          | PRIMARY KEY | Unique ID for each user          |
| `full_name`    | VARCHAR(100) | NOT NULL    | User's first and last name       |
| `email`        | VARCHAR(100) | UNIQUE      | Contact email address            |
| `role`         | VARCHAR(50)  | -           | Account permission (Fan/Manager) |
| `phone_number` | VARCHAR(20)  | -           | Mobile contact number            |

### 2. Matches Table

| Field Name            | Data Type    | Constraints | Description                |
| :-------------------- | :----------- | :---------- | :------------------------- |
| `match_id`            | INT          | PRIMARY KEY | Unique ID for each match   |
| `fixture`             | VARCHAR(150) | NOT NULL    | Competing teams            |
| `tournament_category` | VARCHAR(100) | -           | Tournament or league title |
| `base_ticket_price`   | INT          | -           | Base entry ticket cost     |
| `match_status`        | VARCHAR(50)  | -           | Ticket availability state  |

### 3. Bookings Table

| Field Name       | Data Type   | Constraints | Description                    |
| :--------------- | :---------- | :---------- | :----------------------------- |
| `booking_id`     | INT         | PRIMARY KEY | Unique transaction number      |
| `user_id`        | INT         | FOREIGN KEY | References `Users(user_id)`    |
| `match_id`       | INT         | FOREIGN KEY | References `Matches(match_id)` |
| `seat_number`    | VARCHAR(20) | -           | Allocated stadium seat         |
| `payment_status` | VARCHAR(50) | -           | Financial status of booking    |
| `total_cost`     | INT         | -           | Final invoice price            |

```

```
