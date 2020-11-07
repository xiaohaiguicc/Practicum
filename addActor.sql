DELIMITER //

CREATE PROCEDURE addActor()
BEGIN
  INSERT INTO name_basic(nconst, primaryName, birthYear, deathYear),
  VALUES 
    (nm001, Anya Taylor Joy, 1996, NULL),
    (nm002, Dianna Agron, 1986, NULL),
    (nm003, Letitia Wright, 1993, NULL)
  INSERT INTO name_basic_primaryProfession(nconst)
  VALUES
    (nm001),
    (nm002),
    (nm003),
  INSERT INTO primaryProfession(primaryProfession),
  VALUES 
    (actress),
    (actress),
    (actress),
  INSERT INTO title_basic(tconst, titleType, primaryTitle, originalTitle, isAdult, startYear, endYear, runTimeMinutes),
  VALUES
    (tt001, "tvEpisode", "The Queen's Gambit", "The Queen's Gambit", 1, 2020, NULL, 52),
    (tt002, "tvEpisode", "Glee", "Glee", 0, 2012, NULL, 45),
    (tt003, "movie", "Black Panther", "Black Panther", 0, 2018, NULL, 134),
  INSERT INTO title_name(titleNameId, tconst, nconst),
  VALUES 
    (5, tt001, nm001),
    (6, tt002, nm002),
    (7, tt003, nm003),
  INSERT INTO title_akas(),
  VALUES 
    (),
  INSERT INTO principal(),
  VALUES 
    (),
END //

DELIMITER ;
