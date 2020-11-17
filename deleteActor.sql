DELIMITER //

CREATE PROCEDURE deleteActor()
BEGIN
  DELETE FROM name_basic
  WHERE primaryName = "Letitia Wright" OR "Ingmar Bergman";
  
  DELETE FROM primaryProfession
  WHERE primaryProfessionId = 55;
  
  DELETE FROM title_basic
  WHERE tconst = 'tt001ss';
  
  DELETE FROM title_name
  WHERE titleNameId = 33;
  
END //

DELIMITER ;
