CREATE DATABASE CatalogOfThings;
USE CatalogOfMyThings;

CREATE TABLE item (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    publish_date DATE,
    publisher VARCHAR(255),
    cover_state VARCHAR(255)
    archived BOOLEAN,
    label_id INT, -- Add a foreign key for the label (one-to-many relationship)
    genre_id INT, -- Add a foreign key for the genre (one-to-many relationship)
    author_id INT, -- Add a foreign key for the author (one-to-many relationship)
    FOREIGN KEY (label_id) REFERENCES labels (id)  
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
);

-- Create the books table
CREATE TABLE books (
  id INT PRIMARY KEY,
  item_id INT, -- A foreign key to reference the parent item table
  title VARCHAR(255),
  publish_date DATE,
  publisher VARCHAR(255),
  cover_state VARCHAR(255)
  archived BOOLEAN DEFAULT false
);

-- Create the labels table
CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

-- Create the music_albums table
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  item_id INT, -- A foreign key to reference the parent item table
  title VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  on_spotify BOOLEAN DEFAULT false
);

-- Create the genres table
CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create the games table
CREATE TABLE games (
  id INT PRIMARY KEY,
  item_id INT, -- A foreign key to reference the parent item table
  title VARCHAR(255),
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  archived BOOLEAN DEFAULT false,
  author_id INT, -- Add a foreign key for the author (one-to-many relationship)
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

-- Create the authors table
CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
