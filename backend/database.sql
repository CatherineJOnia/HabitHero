-- Create habit_hero database --
DROP DATABASE IF EXISTS habit_hero;
CREATE DATABASE habit_hero;
\c habit_hero;

-- Create users table --
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL
);

-- Create habit table --
DROP TABLE IF EXISTS habits;
CREATE TABLE habits (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    difficulty VARCHAR(4) NOT NULL,
    CONSTRAINT check_difficulty CHECK (difficulty IN ('*', '**', '***', '****')),
    frequency VARCHAR(100) NOT NULL,
    notes_and_or_description VARCHAR(255) NULL,
    user_id INTEGER NOT NULL DEFAULT 1 REFERENCES users(id)
);

-- Create task table --
DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    difficulty VARCHAR(4) NOT NULL,
    CONSTRAINT check_difficulty CHECK (difficulty IN ('*', '**', '***', '****')),
    date_due DATE NULL,
    time_due TIME NULL,
    notes_and_or_description VARCHAR(255) NULL,
    user_id INTEGER NOT NULL DEFAULT 1 REFERENCES users(id)
);

-- Add sample user --
INSERT INTO users (username) VALUES ('sample_user');

-- Add sample habits --
INSERT INTO habits (title, difficulty, frequency, notes_and_or_description, user_id) VALUES
('Morning Jog', '****', 'Daily', 'Jog for at least 30 minutes every morning.', 1),
('Practice Data Structures and Algorithms', '***', 'Weekly', 'Spend at least 3 hours practicing coding problems.', 1),
('Make Bed', '*', 'Daily', 'Make the bed every morning after getting up.', 1),
('Floss', '****', 'Daily', 'Floss teeth before going to bed.', 1),
('Put On Sunscreen', '**', 'Twice Daily', 'Apply sunscreen in the morning and afternoon.', 1),
('Complete a Single Task Before Work', '***', 'Daily', 'Finish one important task before starting work.', 1),
('Read for 30 Minutes', '**', 'Daily', 'Read a book or article for at least 30 minutes.', 1),
('Meditate', '****', 'Daily', 'Meditate for at least 10 minutes to reduce stress.', 1),
('Plan the Day Ahead', '**', 'Daily', 'Spend 10 minutes planning the day ahead each morning.', 1);

-- Add sample tasks --
INSERT INTO tasks (title, difficulty, date_due, time_due, notes_and_or_description, user_id) VALUES
('Finish Project Report', '****', '2024-07-01', '17:00', 'Complete and submit the final project report to the manager.', 1),
('Grocery Shopping', '**', '2024-06-30', '12:00', 'Buy groceries for the week including fruits, vegetables, and snacks.', 1),
('Doctor Appointment', '***', '2024-07-02', '09:30', 'Annual check-up with Dr. Smith at the downtown clinic.', 1),
('Team Meeting Preparation', '****', '2024-06-29', '15:00', 'Prepare slides and talking points for the upcoming team meeting.', 1),
('Call Mom', '*', '2024-06-28', '20:00', 'Catch up with mom and see how she is doing.', 1),
('Car Maintenance', '***', '2024-07-03', '10:00', 'Take the car for its scheduled maintenance and oil change.', 1),
('Read New Book', '**', '2024-07-05', '18:00', 'Start reading the new novel I bought last week.', 1);

