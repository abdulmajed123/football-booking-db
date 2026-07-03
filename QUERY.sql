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
    base_ticket_price DECIMAL(10,2),
    match_status VARCHAR(50)
);

-- ৩. Bookings 
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    match_id INT REFERENCES Matches(match_id),
    seat_number VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost DECIMAL(10,2)
);