SET SQL_SAFE_UPDATES = 0;
-- update age attribute
UPDATE title.name_basic
SET age = IFNULL(deadYear, 2020) - birthYear;

-- update number of moviews the person appear in attributes, if movie doesn't exist, set value to 0
UPDATE title.name_basic as NB
LEFT JOIN (SELECT TP.nconst as nameId, COUNT(DISTINCT TP.tconst) as movieCount
		   FROM title.name_basic as NAB, title.principal as TP, title.title_basic as TB
		   WHERE TP.nconst = NAB.nconst AND TP.tconst = TB.tconst AND TB.titleType = 'movie'
		   GROUP BY TP.nconst) AS subTable
ON NB.nconst = subTable.nameId
SET NB.numMovies = IFNULL(subTable.movieCount, 0);

SET SQL_SAFE_UPDATES = 1;
