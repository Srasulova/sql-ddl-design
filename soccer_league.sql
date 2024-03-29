
-- Drop the database if it exists
DROP DATABASE IF EXISTS soccer_league;

-- Create the database
CREATE DATABASE soccer_league;

-- Connect to the database
\c soccer_league;

CREATE TABLE league (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    teams INTEGER DEFAULT 0
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INTEGER,
    players INTEGER REFERENCES players
    league TEXT REFERENCES league(name)
)

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team TEXT REFERENCES teams(name)
    goal INTEGER DEFAULT 0
)

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL
    team1 INTEGER REFERENCES teams(id)
    team2 INTEGER REFERENCES teams(id)
    goals INTEGER REFERENCES players(goal),
    referee INTEGER REFERENCES referees(id)
)

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    games INTEGER REFERENCES games
)

CREATE TABLE league_season (
    id SERIAL PRIMARY KEY,
    name TEXT REFERENCES leagues(name)
    start_date DATE,
    end_date DATE
)


-- Drop the database if it exists
DROP DATABASE IF EXISTS soccer_league;

-- Create the database
CREATE DATABASE soccer_league;

-- Connect to the database
\c soccer_league;

-- Table to store leagues
CREATE TABLE leagues (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Table to store teams
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    league_id INTEGER REFERENCES leagues(id),
    ranking INTEGER DEFAULT 0
);

-- Table to store players
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams(id),
    goals_scored INTEGER DEFAULT 0
);

-- Table to store games
CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    team1_id INTEGER REFERENCES teams(id),
    team2_id INTEGER REFERENCES teams(id),
    referee_id INTEGER REFERENCES referees(id)
);

-- Table to store goals scored in games
CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games(id),
    player_id INTEGER REFERENCES players(id)
);

-- Table to store referees
CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Table to store league standings
CREATE TABLE standings (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(id),
    league_id INTEGER REFERENCES leagues(id),
    rank INTEGER DEFAULT 0
);
