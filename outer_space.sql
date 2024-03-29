-- from the terminal run:
-- psql < outer_space.sql

-- DROP DATABASE IF EXISTS outer_space;

-- CREATE DATABASE outer_space;

-- \c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');




  -- Drop the database if it exists
DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

-- Table to store galaxies
CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Table to store orbital bodies (planets, moons, etc.)
CREATE TABLE orbital_bodies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period NUMERIC NOT NULL,
  orbits_around TEXT,
  galaxy_id INTEGER REFERENCES galaxies(id)
);

-- Table to store moons
CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period NUMERIC NOT NULL,
  orbits_around TEXT,
  planet_id INTEGER REFERENCES orbital_bodies(id)
);

-- Populate galaxies table
INSERT INTO galaxies (name)
VALUES ('Milky Way');

-- Populate orbital_bodies table
INSERT INTO orbital_bodies (name, orbital_period, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1),
  ('Mars', 1.88, 'The Sun', 1),
  ('Venus', 0.62, 'The Sun', 1),
  ('Neptune', 164.8, 'The Sun', 1),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1);

-- Populate moons table
INSERT INTO moons (name, orbital_period, orbits_around, planet_id)
VALUES
  ('The Moon', 27.3, 'Earth', 1),
  ('Phobos', 0.32, 'Mars', 2),
  ('Deimos', 1.26, 'Mars', 2),
  ('Naiad', 0.29, 'Neptune', 4),
  ('Thalassa', 0.31, 'Neptune', 4),
  ('Despina', 0.33, 'Neptune', 4),
  -- Additional moons and orbital bodies can be inserted here
  ;
