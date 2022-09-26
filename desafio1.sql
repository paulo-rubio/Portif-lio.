DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.subscription(
  subscription_id INT AUTO_INCREMENT PRIMARY KEY,
  subscription_name VARCHAR(90) NOT NULL,
  subscription_price NUMERIC(3, 2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(90) NOT NULL,
  age INT NOT NULL,
  subscription_id INT NOT NULL,
  subscription_date DATETIME NOT NULL,
	FOREIGN KEY (subscription_id) REFERENCES SpotifyClone.subscription(subscription_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.artist(
	artist_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(90) NOT NULL
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.followers(
	user_id INT NOT NULL,
  artist_id INT NOT NULL,
      CONSTRAINT FK_follow PRIMARY KEY (user_id, artist_id),
      CONSTRAINT FK_follow_user FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
      CONSTRAINT FK_follow_artist FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
  ) engine = InnoDB;
  
	CREATE TABLE SpotifyClone.album(
	album_id INT AUTO_INCREMENT PRIMARY KEY,
  album_name VARCHAR(90) NOT NULL,
  artist_id INT NOT NULL,
  posting_date INT NOT NULL,
      CONSTRAINT FK_album_artist FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
    ) engine = InnoDB;
    
	CREATE TABLE SpotifyClone.music(
	music_id INT AUTO_INCREMENT PRIMARY KEY,
  music_name VARCHAR(90) NOT NULL,
  music_length INT NOT NULL,
  album_id INT NOT NULL,
	CONSTRAINT FK_music_album FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
      ) engine = InnoDB;
  
	CREATE TABLE SpotifyClone.history(
	user_id INT NOT NULL,
  music_id INT NOT NULL,
  play_date DATETIME NOT NULL,
	CONSTRAINT FK_history_PKey PRIMARY KEY (user_id, music_id, play_date),
  CONSTRAINT FK_history_user FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
	CONSTRAINT FK_history_music FOREIGN KEY (music_id) REFERENCES SpotifyClone.music(music_id)
      ) engine = InnoDB;


  INSERT INTO SpotifyClone.subscription (subscription_name, subscription_price)
  VALUES
    ('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.user (
name,
age,
subscription_id,
subscription_date
  )
  
  VALUES
    ('Barbara Liskov', 82, 1 , '2019-10-20'),
    ('Robert Cecil Martin', 58, 1 ,'2017-01-06'),
    ('Ada Lovelace', 46 , 4 , '2017-12-30'),
    ('Martin Fowler', 58 , 4 , '2017-01-17'),
    ('Sandi Metz', 19, 4 ,'2018-04-29'),
    ('Paulo Freire', 19 ,2 ,'2018-02-14'),
    ('Bell Hooks', 26, 2,'2018-01-05'),
    ('Christopher Alexander', 85,3 ,'2019-06-05'),
    ('Judith Butler', 45, 3 ,'2020-05-13'),
    ('Jorge Amado', 58, 3, '2017-02-17');
    
    INSERT INTO SpotifyClone.artist (artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

    INSERT INTO SpotifyClone.followers (user_id, artist_id)
VALUES
  ( 1, 1),
  ( 1, 2),
  ( 1, 3),
  ( 2, 1),
  ( 2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

    INSERT INTO SpotifyClone.album (album_name, artist_id, posting_date)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz',  2, 1978),
  ('Hot Space',  2 ,1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio',  3, 2001),
  ('QVVJFA?',  4, 2003),
  ('Somewhere Far Beyond',  5, 2007),
  ('I Put A Spell On You',  6, 2012);

  INSERT INTO SpotifyClone.music (music_name, music_length, album_id)
  VALUES
('BREAK MY SOUL', 279, 1),
("VIRGO’S GROOVE", 369, 1),
('ALIEN SUPERSTAR', 116, 1),
("Don’t Stop Me Now", 203, 2),
('Under Pressure', 152, 3),
('Como Nossos Pais', 105, 4),
('O Medo de Amar é o Medo de Ser Livre', 207, 5),
('Samba em Paris', 267, 6),
("The Bard’s Song", 244, 7),
('Feeling Good', 100, 8);

  INSERT INTO SpotifyClone.history (play_date, music_id, user_id )
VALUES
('2022-02-28 10:45:55', 8, 1),
('2020-05-02 05:30:35', 2, 1),
('2020-03-06 11:22:33', 10, 1),
('2022-08-05 08:05:17', 10, 2),
('2020-01-02 07:40:33', 7, 2),
('2020-11-13 16:55:13', 10, 3),
('2020-12-05 18:38:30', 2, 3),
('2021-08-15 17:10:10', 8, 4),
('2022-01-09 01:44:33', 8, 5),
('2022-08-06 15:23:43', 5, 5),
('2017-01-24 00:31:17', 7, 6),
('2017-10-12 12:35:20', 1, 6),
('2011-12-15 22:30:49', 4, 7),
('2012-03-17 14:56:41', 4, 8),
('2022-12-13 21:14:22', 9, 9),
('2015-12-13 08:20:22', 3 , 10);