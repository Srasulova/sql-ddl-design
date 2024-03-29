-- Drop the database if it exists
DROP DATABASE IF EXISTS craigslist;

-- Create the craigslist database
CREATE DATABASE craigslist;

-- Connect to the craigslist database
\c craigslist

-- Create the regions table to store different regions
CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the users table to store user information and preferred region
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES regions(id)
);

-- Create the categories table to store different post categories
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the posts table to store post information
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id),
    location TEXT,
    region_id INTEGER REFERENCES regions(id),
    category_id INTEGER REFERENCES categories(id)
);


INSERT INTO regions (name) VALUES
    ('San Francisco'),
    ('Atlanta'),
    ('Seattle');

INSERT INTO users (name, preferred_region_id) VALUES
    ('Alice', 1),  -- Alice prefers San Francisco
    ('Bob', 2),    -- Bob prefers Atlanta
    ('Charlie', 3);-- Charlie prefers Seattle

INSERT INTO categories (name) VALUES
    ('Jobs'),
    ('Housing'),
    ('For Sale');

INSERT INTO posts (title, text, user_id, location, region_id, category_id) VALUES
    ('Job Opening', 'Looking for software engineers', 1, 'San Francisco, CA', 1, 1), -- Alice posts a job in San Francisco
    ('Apartment for Rent', '2-bedroom apartment available', 2, 'Atlanta, GA', 2, 2), -- Bob posts a rental in Atlanta
    ('Used Car for Sale', '2008 Honda Civic in good condition', 3, 'Seattle, WA', 3, 3); -- Charlie posts a car for sale in Seattle

