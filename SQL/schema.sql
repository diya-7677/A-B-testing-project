CREATE DATABASE ab_testing_project;
USE ab_testing_project;

CREATE TABLE users (
user_id INT PRIMARY KEY,
sign_up_date DATE,
country VARCHAR(50),
device VARCHAR(20)
);

CREATE TABLE experiment_group (
user_id INT PRIMARY KEY,
experiment_variant CHAR(1),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE sessions (
 session_id INT PRIMARY KEY,
    user_id INT,
    start_time DATETIME,
    duration_seconds INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
    );

CREATE TABLE clicks (
    click_id INT PRIMARY KEY,
    user_id INT,
    button_clicked BOOLEAN,
    click_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE conversions (
    conversion_id INT PRIMARY KEY,
    user_id INT,
    purchase_amount DECIMAL(10,2),
    conversion_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    user_id INT,
    event_type VARCHAR(30),
    event_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM experiment_group;
SELECT COUNT(*) FROM sessions;
SELECT COUNT(*) FROM clicks;
SELECT COUNT(*) FROM conversions;
SELECT COUNT(*) FROM events;


