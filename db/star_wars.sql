DROP TABLE characters;
DROP TABLE lightsaber;

CREATE TABLE characters(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  darkside BOOLEAN,
  age INT NOT NULL
);

CREATE TABLE lightsaber(

  id SERIAL PRIMARY KEY,
  colour VARCHAR(255),
  hilt_metal VARCHAR(255),
  owner_id INT REFERENCES characters(id)
);

-- Create
INSERT INTO characters (name, darkside, age) VALUES ('Obi-Wan', false, 100);
INSERT INTO characters (name, darkside, age) VALUES ('Anakin Skywalker', false, 29);
INSERT INTO characters (name, darkside, age) VALUES ('Darth Maul', true, 32);
INSERT INTO characters (name, darkside, age) VALUES ('Yoda', false, 500);

-- Update
UPDATE characters
SET darkside = true
WHERE name = 'Anakin Skywalker' AND age = 29;

UPDATE characters
SET age = 65
WHERE name = 'Obi-Wan';

DELETE FROM characters
WHERE name = 'Darth Maul';

INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 27);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 27);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 27);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 27);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 27);

UPDATE characters
SET age = 28
WHERE id = 8;

-- Read. * after select will show all data however if we put name and age then it will only return name and age data
SELECT * FROM characters
ORDER BY name, age DESC;


SELECT COUNT(*) FROM characters;

-- ***********************************LIGHTSABER**********************************************



INSERT INTO lightsaber (colour, hilt_metal, owner_id) VALUES ('blue', 'Steel', 8);
INSERT INTO lightsaber (colour, hilt_metal, owner_id) VALUES ('red', 'copper', 2);
INSERT INTO lightsaber (colour, hilt_metal, owner_id) VALUES ('green', 'Lead', 6);

SELECT * FROM lightsaber;
