-- This trigger is to update the age and numMovies value in 'name_basic' table
-- when values are inserted in to the 'name_basic' table
DELIMITER $$
DROP TRIGGER IF EXISTS title.name_basic $$
CREATE TRIGGER title.name_basic_BEFORE_INSERT
BEFORE INSERT ON title.name_basic
FOR EACH ROW
BEGIN
SET NEW.age = IFNULL(NEW.deadYear, 2020) - NEW.birthYear;
IF NEW.numMovies IS NULL
THEN
	SET NEW.numMovies = (SELECT COUNT(*) 
		FROM title.principal as TP
		WHERE TP.nconst = NEW.nconst);
END IF;
END$$

-- This trigger is to update the age and numMovies value in 'name_basic' table
-- when values are inserted in to the 'principal' table
DELIMITER $$
DROP TRIGGER IF EXISTS title.principal $$
CREATE TRIGGER title.principal_AFTER_INSERT
AFTER INSERT ON title.principal
FOR EACH ROW
BEGIN
UPDATE title.name_basic as NB
SET NB.numMovies = (SELECT COUNT(*) 
		FROM title.principal as TP
		WHERE TP.nconst = NEW.nconst)
WHERE NB.nconst = NEW.nconst;
END$$
DELIMITER ;

-- Test title.name_basic_BEFORE_INSERT trigger
-- After running it, there is new row in name_basic table with correct age and numMovies 0(becuase no corrosponding nconst in pirincipal table)
INSERT INTO title.name_basic (`nconst`, `primaryName`, `birthYear`, `deadYear`, `age`, `numMovies`) VALUES ('nm0000050', 'mary', 1950, 2019, 
NULL, NULL);

-- Test title.principal_AFTER_INSERT trigger
-- After running it, the nconst=nm0000050 row in name_basic updated the numMovies.
INSERT INTO title.principal (`tconst`, `ordering`, `nconst`, `category`, `job`, `characters`) VALUES ('tt0000001', 3, 'nm0000050', 'actor', NULL, NULL);
