-- Active: 1747480580900@@localhost@5432@conservation_db

-- 1 Create rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- Insert into rangers
INSERT INTO
    rangers (ranger_id, name, region)
VALUES (
        1,
        'Alice Green',
        'Northern Hills'
    ),
    (2, 'Bob White', 'River Delta'),
    (
        3,
        'Carol King',
        'Mountain Range'
    );

SELECT * FROM rangers;

DROP Table rangers;

-- 2 Create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50)
);

-- Insert into species
INSERT INTO
    species (
        species_id,
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        1,
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        2,
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        3,
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        4,
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

SELECT * FROM species;

-- 3 Create sightings table

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers (ranger_id),
    species_id INTEGER REFERENCES species (species_id),
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

-- Insert into sightings
INSERT INTO
    sightings (
        sighting_id,
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        4,
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

SELECT * FROM sightings;

-- - Problem 1️⃣ : Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO
    rangers (ranger_id, name, region)
VALUES (
        4,
        'Derek Fox',
        'Coastal Plains'
    );

SELECT * FROM rangers WHERE name = 'Derek Fox';

SELECT * FROM rangers;

SELECT * FROM species;

SELECT * FROM sightings;

-- - Problem  2️⃣: Count unique species ever sighted

SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- Problem 3️⃣ Find all sightings where the location includes "Pass".

SELECT * FROM sightings;

SELECT * FROM sightings WHERE location ILIKE '%pass%'

--  Using REGEXP_MATCHES() or ~ Operator Search by Google
SELECT * FROM sightings WHERE location ~* 'Snowfall';

SELECT * FROM sightings WHERE location LIKE '%Pass';

-- problem 4️⃣ List each ranger's name and their total number of sightings.
--short name / alias

SELECT * FROM sightings ;

SELECT r.name , COUNT(s.sighting_id) AS total_sightings_number 
FROM rangers r 
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name ;

-- Problem 5️⃣ List species that have never been sighted.
SELECT * FROM species ;

SELECT * FROM sightings ;

-- FROM species
SELECT common_name AS common_name_sighted
 FROM species 
WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings ) ;



-- Problem 6️⃣ Show the most recent 2 sightings.

SELECT * FROM rangers ;
SELECT * FROM species ;
SELECT * FROM sightings ;

SELECT sp.common_name , s.sighting_time , r.name
FROM sightings s 
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY sighting_time DESC
LIMIT 2 ;
