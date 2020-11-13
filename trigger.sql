-- This trigger is to update the age and numMovies value in 'name_basic' table
-- when values are inserted in to the 'name_basic' table
DELIMITER $$
DROP TRIGGER IF EXISTS title.name_basic_BEFORE_INSERT $$
CREATE TRIGGER title.name_basic_BEFORE_INSERT
BEFORE INSERT ON title.name_basic
FOR EACH ROW
BEGIN
SET NEW.age = IFNULL(NEW.deadYear, 2020) - NEW.birthYear;
IF NEW.numMovies IS NULL
THEN
	SET NEW.numMovies = IFNULL((SELECT COUNT(DISTINCT TP.nconst) 
		FROM title.principal as TP, title.title_basic as TB
		WHERE TP.nconst = NEW.nconst AND TP.tconst = TB.tconst AND TB.titleType = 'movie'), 0);
END IF;
END$$

-- This trigger is to update the age and numMovies value in 'name_basic' table
-- when values are inserted in to the 'principal' table
DELIMITER $$
DROP TRIGGER IF EXISTS title.principal_AFTER_INSERT $$
CREATE TRIGGER title.principal_AFTER_INSERT
AFTER INSERT ON title.principal
FOR EACH ROW
BEGIN
UPDATE title.name_basic as NB
SET NB.numMovies = IFNULL((SELECT COUNT(DISTINCT TP.nconst) 
		FROM title.principal as TP, title.title_basic as TB
		WHERE TP.nconst = NEW.nconst AND TP.tconst = TB.tconst AND TB.titleType = 'movie'), 0)
WHERE NB.nconst = NEW.nconst;
END$$
DELIMITER ;

-- Test title.name_basic_BEFORE_INSERT trigger
-- After running it, there is new row in name_basic table with correct age and numMovies 0(becuase no corrosponding nconst in pirincipal table)
INSERT INTO title.name_basic (`nconst`, `primaryName`, `birthYear`, `deadYear`, `age`, `numMovies`) VALUES ('nm0000500', 'Richard Linklater ', 1960, NULL, 
NULL, NULL);

DELETE FROM title.name_basic WHERE nconst = 'nm0000500';

-- Test title.principal_AFTER_INSERT trigger
-- After running it, the nconst=nm0000500 row in name_basic updated the numMovies.
INSERT INTO title.principal (`tconst`, `ordering`, `nconst`, `category`, `job`, `characters`) VALUES ('tt0000009', 3, 'nm0000500', 'actor', NULL, NULL);