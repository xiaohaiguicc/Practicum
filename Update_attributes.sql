SET SQL_SAFE_UPDATES = 0;
-- update age attribute
UPDATE title.name_basic
SET age = IFNULL(deadYear, 2020) - birthYear;

-- update number of moviews the person appear in attributes
UPDATE title.name_basic as NB
LEFT JOIN (SELECT TP.nconst as nameId, COUNT(DISTINCT TP.tconst, TP.ordering) as movieCount
					 FROM title.name_basic as NAB, title.principal as TP
					 WHERE TP.nconst = NAB.nconst
					GROUP BY TP.nconst) AS subTable
ON NB.nconst = subTable.nameId
SET NB.numMovies = subTable.movieCount;

SET SQL_SAFE_UPDATES = 1;