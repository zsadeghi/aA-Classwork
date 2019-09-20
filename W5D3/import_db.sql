
DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS toys;
DROP TABLE IF EXISTS cats;

CREATE TABLE cats (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  color VARCHAR(255),
  breed VARCHAR(255)
);

INSERT INTO cats(name, color, breed)
VALUES ('Jimmy', 'Yellow', 'Tabby'),
('Bobby', 'White', 'Persian'),
('Frederick', 'Black', 'British Shorthair'),
('Ali', 'Gray', 'Siamese'),
('Madonna', 'Naked', 'Sphynx');

CREATE TABLE toys (
  id SERIAL PRIMARY KEY,
  price INTEGER,
  color VARCHAR(255),
  name VARCHAR(255)
);

INSERT INTO toys(price, color, name)
VALUES (4, 'Pink', 'Shrimp Doll'),
(7, 'Brown', 'Bouncer Wand'),
(10, 'White', 'Robot Mouse'),
(12, 'Red', 'Catnip Pillows'),
(43, 'Green', 'Hungry Hippo');

CREATE TABLE cattoys (
  id SERIAL PRIMARY KEY,
  cat_id INTEGER,
  toy_id INTEGER, 

  FOREIGN KEY (cat_id) REFERENCES cats(id),
  FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO cattoys(cat_id, toy_id)
VALUES (
  (SELECT
    id
  FROM
    cats
  WHERE
    name = 'Jimmy'),
  (SELECT
    id
  FROM
    toys
  WHERE
    name = 'Shrimp Doll')
);
-- VALUES (2, 2),
-- VALUES (3, 1),
-- VALUES (4, 5),
-- VALUES (5, 3);