CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  genre VARCHAR(50) NOT NULL,
  showtimes TIMESTAMP[] NOT NULL
);

CREATE TABLE showtimes (
  id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES movies(id),
  showtime TIMESTAMP NOT NULL
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  showtime_id INT REFERENCES showtimes(id),
  row CHAR(1) NOT NULL,
  number INT NOT NULL,
  available BOOLEAN DEFAULT TRUE
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  movie_id INT REFERENCES movies(id),
  showtime_id INT REFERENCES showtimes(id),
  seats INT[] NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status VARCHAR(20) DEFAULT 'pending'
);
