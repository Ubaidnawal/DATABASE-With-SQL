-- Create database
CREATE DATABASE NetflixTVShowsDB;
USE NetflixTVShowsDB;

-- Create table for Genres
CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(100) NOT NULL UNIQUE
);

-- Create table for TV Shows
CREATE TABLE TVShows (
    ShowID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear YEAR NOT NULL,
    GenreID INT,
    Language VARCHAR(100) NOT NULL,
    Rating DECIMAL(2,1) CHECK (Rating >= 0.0 AND Rating <= 10.0),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Create table for Seasons
CREATE TABLE Seasons (
    SeasonID INT AUTO_INCREMENT PRIMARY KEY,
    ShowID INT,
    SeasonNumber INT NOT NULL,
    ReleaseDate DATE,
    FOREIGN KEY (ShowID) REFERENCES TVShows(ShowID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create table for Episodes
CREATE TABLE Episodes (
    EpisodeID INT AUTO_INCREMENT PRIMARY KEY,
    SeasonID INT,
    EpisodeTitle VARCHAR(255) NOT NULL,
    Duration INT CHECK (Duration > 0), -- in minutes
    AirDate DATE,
    FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insert Genres
INSERT INTO Genres (GenreName) VALUES
('Drama'),
('Comedy'),
('Thriller'),
('Documentary'),
('Sci-Fi');

-- Insert TV Shows
INSERT INTO TVShows (Title, ReleaseYear, GenreID, Language, Rating) VALUES
('Stranger Things', 2016, 5, 'English', 8.7),
('The Crown', 2016, 1, 'English', 8.6),
('Narcos', 2015, 3, 'Spanish', 8.8),
('Our Planet', 2019, 4, 'English', 9.3),
('Brooklyn Nine-Nine', 2013, 2, 'English', 8.4);

-- Insert Seasons
INSERT INTO Seasons (ShowID, SeasonNumber, ReleaseDate) VALUES
(1, 1, '2016-07-15'),
(1, 2, '2017-10-27'),
(2, 1, '2016-11-04'),
(3, 1, '2015-08-28'),
(4, 1, '2019-04-05'),
(5, 1, '2013-09-17'),
(5, 2, '2014-09-28');

-- Insert Episodes
INSERT INTO Episodes (SeasonID, EpisodeTitle, Duration, AirDate) VALUES
(1, 'Chapter One: The Vanishing', 48, '2016-07-15'),
(1, 'Chapter Two: The Weirdo', 55, '2016-07-15'),
(2, 'MADMAX', 46, '2017-10-27'),
(3, 'Wolferton Splash', 57, '2016-11-04'),
(4, 'Descenso', 57, '2015-08-28'),
(5, 'One Planet', 50, '2019-04-05'),
(6, 'Pilot', 22, '2013-09-17'),
(7, 'Undercover', 22, '2014-09-28');
