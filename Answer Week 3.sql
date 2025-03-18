- Creating the Movies table
CREATE TABLE Movies (
    movie_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INTEGER,
    director TEXT,
    genre TEXT,
    rating DECIMAL(3,1)
);

-- Creating the Actors table
CREATE TABLE Actors (
    actor_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birth_date DATE,
    nationality TEXT
);

-- Creating a join table for the many-to-many relationship
CREATE TABLE Movie_Actors (
    movie_id INTEGER,
    actor_id INTEGER,
    role TEXT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

-- Inserting data into Movies table
INSERT INTO Movies (movie_id, title, release_year, director, genre, rating) VALUES
(1, 'The Shawshank Redemption', 1994, 'Frank Darabont', 'Drama', 9.3),
(2, 'Inception', 2010, 'Christopher Nolan', 'Sci-Fi', 8.8),
(3, 'Pulp Fiction', 1994, 'Quentin Tarantino', 'Crime', 8.9),
(4, 'The Dark Knight', 2008, 'Christopher Nolan', 'Action', 9.0),
(5, 'Fight Club', 1999, 'David Fincher', 'Drama', 8.8);

-- Inserting data into Actors table
INSERT INTO Actors (actor_id, first_name, last_name, birth_date, nationality) VALUES
(1, 'Morgan', 'Freeman', '1937-06-01', 'American'),
(2, 'Leonardo', 'DiCaprio', '1974-11-11', 'American'),
(3, 'John', 'Travolta', '1954-02-18', 'American'),
(4, 'Christian', 'Bale', '1974-01-30', 'British'),
(5, 'Brad', 'Pitt', '1963-12-18', 'American'),
(6, 'Tim', 'Robbins', '1958-10-16', 'American'),
(7, 'Samuel L.', 'Jackson', '1948-12-21', 'American'),
(8, 'Joseph', 'Gordon-Levitt', '1981-02-17', 'American');

-- Connecting actors to movies
INSERT INTO Movie_Actors (movie_id, actor_id, role) VALUES
(1, 1, 'Ellis Boyd "Red" Redding'),
(1, 6, 'Andy Dufresne'),
(2, 2, 'Dom Cobb'),
(2, 8, 'Arthur'),
(3, 3, 'Vincent Vega'),
(3, 7, 'Jules Winnfield'),
(4, 4, 'Bruce Wayne/Batman'),
(5, 5, 'Tyler Durden');

-- Query 1: List all movies with their ratings in descending order
SELECT title, release_year, rating
FROM Movies
ORDER BY rating DESC;

-- Query 2: Find all actors who appeared in movies released in 1994
SELECT a.first_name, a.last_name, m.title
FROM Actors a
JOIN Movie_Actors ma ON a.actor_id = ma.actor_id
JOIN Movies m ON ma.movie_id = m.movie_id
WHERE m.release_year = 1994;

-- Query 3: Count how many movies each director has in the database
SELECT director, COUNT(*) as movie_count
FROM Movies
GROUP BY director
ORDER BY movie_count DESC;

-- Query 4: Find the highest-rated movie for each genre
SELECT genre, title, rating
FROM Movies m1
WHERE rating = (
    SELECT MAX(rating) 
    FROM Movies m2 
    WHERE m1.genre = m2.genre
)
ORDER BY rating DESC;

-- Query 5: Find actors who have worked together in the same movie
SELECT m.title, a1.first_name || ' ' || a1.last_name as Actor1, 
       a2.first_name || ' ' || a2.last_name as Actor2
FROM Movie_Actors ma1
JOIN Movie_Actors ma2 ON ma1.movie_id = ma2.movie_id AND ma1.actor_id < ma2.actor_id
JOIN Movies m ON ma1.movie_id = m.movie_id
JOIN Actors a1 ON ma1.actor_id = a1.actor_id
JOIN Actors a2 ON ma2.actor_id = a2.actor_id
ORDER BY m.title;