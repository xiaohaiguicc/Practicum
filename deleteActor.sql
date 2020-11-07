DELIMITER //

CREATE PROCEDURE deleteActor()
BEGIN
  DELETE FROM name_basic,
  WHERE primaryName = "Anya Taylor Joy" OR "Dianna Agron" OR "Letitia Wright";
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE deleteActor()
BEGIN
  DELETE FROM name_basic,
  WHERE age > 10,
  ORDER BY birthYear,
  LIMIT 5;
END //

DELIMITER ;
