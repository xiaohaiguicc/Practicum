DELIMITER //

CREATE PROCEDURE addActor()
BEGIN
  INSERT INTO name_basic(primaryName, birthYear, deathYear),
  VALUES 
    (Anya Taylor Joy, 1996, NULL),
    (Dianna Agron, 1986, NULL),
    (Letitia Wright, 1993, NULL)
  INSERT INTO primaryProfession(primaryProfession),
  VALUES 
    (actress)
    (actress)
    (actress)
END //

DELIMITER ;
