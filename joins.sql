-- # YOUR SQL CODE GOES HERE
-- the name of the the database is dogpark
-- You can run it in the terminal by putting: psql dogpark < joins.sql

-- 1. For which collars can we identify an owner?
SELECT lost_dog_collars.dog_name AS dog, dog_owners.name AS owner
FROM lost_dog_collars LEFT OUTER JOIN dog_owners  ON lost_dog_collars.id = dog_owners.id;

-- 2. For which collars is there no known owner?
SELECT lost_dog_collars.dog_name AS dog, dog_owners.name AS owner
FROM lost_dog_collars LEFT OUTER JOIN dog_owners  ON lost_dog_collars.dog_name = dog_owners.dog_name
WHERE dog_owners.dog_name IS NULL;

-- 3. We need to see all collars with an owner, if one matches.
SELECT lost_dog_collars.dog_name AS dog, dog_owners.name AS owner
FROM lost_dog_collars RIGHT OUTER JOIN dog_owners  ON lost_dog_collars.id = dog_owners.id;

-- 4. We need to see all owners, with collars in the Lost and Found, if one matches.
SELECT lost_dog_collars.dog_name AS dog, dog_owners.name AS owner, dog_owners.dog_name
FROM lost_dog_collars
RIGHT OUTER JOIN dog_owners
ON dog_owners.dog_name = lost_dog_collars.dog_name
WHERE lost_dog_collars.dog_name IS NOT NULL;


-- ##other way of solving this:

SELECT dog_owners.name
FROM lost_dog_collars
JOIN dog_owners
ON dog_owners.dog_name = lost_dog_collars.dog_name
