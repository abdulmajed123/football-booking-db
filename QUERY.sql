-- ১. Users 
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(50),
    phone_number VARCHAR(20)
);

-- ২. Matches 
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    fixture VARCHAR(150),
    tournament_category VARCHAR(100),
    base_ticket_price INT,
    match_status VARCHAR(50)
);


-- ৩. Bookings 
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    match_id INT REFERENCES Matches(match_id),
    seat_number VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost INT
);


-- Users Data Insert
INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL); 

-- Matches Data Insert
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80, 'Available');

-- Bookings Data Insert
INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150),
(502, 1, 102, 'B-04', 'Confirmed', 120),
(503, 2, 101, 'A-13', 'Confirmed', 150),
(504, 2, 101, NULL, NULL, 150),
(505, 3, 102, 'C-20', 'Pending', 120);

-- ====================================================
-- Part 2: SQL Queries & Solutions
-- ====================================================

-- Query 1: Retrieve all upcoming football matches belonging to 'Champions League' where status is 'Available'.
SELECT match_id, fixture, base_ticket_price 
FROM Matches 
WHERE tournament_category = 'Champions League' 
  AND match_status = 'Available';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain 'Haque' (case-insensitive).
SELECT user_id, full_name, email 
FROM Users 
WHERE full_name ILIKE 'Tanvir%' 
   OR full_name ILIKE '%Haque%';

-- Query 3: Retrieve booking records where payment status is NULL, replacing it with 'Action Required'.
SELECT booking_id, user_id, match_id, 
       COALESCE(payment_status, 'Action Required') AS systematic_status 
FROM Bookings 
WHERE payment_status IS NULL;

-- Query 4: Retrieve match booking details along with User's full name and Match fixture teams.
SELECT b.booking_id, u.full_name, m.fixture, b.total_cost 
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Matches m ON b.match_id = m.match_id;

-- Query 5: Comprehensive list of all users and their booking IDs (including fans who never bought a ticket).
SELECT u.user_id, u.full_name, b.booking_id 
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id;

-- Query 6: Find all ticket bookings where total cost is strictly higher than the average cost.
SELECT booking_id, match_id, total_cost 
FROM Bookings 
WHERE total_cost > (SELECT AVG(total_cost) FROM Bookings);

-- Query 7: Retrieve top 2 most expensive matches sorted by base price, skipping the absolute highest premium match.
SELECT match_id, fixture, base_ticket_price 
FROM Matches 
ORDER BY base_ticket_price DESC 
LIMIT 2 OFFSET 1;