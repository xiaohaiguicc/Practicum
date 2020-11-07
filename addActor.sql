DELIMITER //

CREATE PROCEDURE addActor()
BEGIN
  INSERT INTO name_basic(nconst, primaryName, birthYear, deathYear),
  VALUES 
    (nm001, Anya Taylor Joy, 1996, NULL),
    (nm002, Dianna Agron, 1986, NULL),
    (nm003, Letitia Wright, 1993, NULL)
  INSERT INTO name_basic_primaryProfession(nconst)
  (nm001),
  (nm002),
  (nm003),
  INSERT INTO primaryProfession(primaryProfession),
  VALUES 
    (actress)
    (actress)
    (actress)
END //

DELIMITER ;
