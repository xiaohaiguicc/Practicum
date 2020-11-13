SELECT NBA.primaryName, NBA.age
FROM title.name_basic as NBA,
	(SELECT NB.nconst, COUNT(DISTINCT TR.tconst) as numMoviesAboveAvg
	 FROM title.name_basic as NB, title.title_rating as TR, title.title_basic as TB, title.principal as TP, title.name_basic_primaryProfession as NBP, title.primaryProfession AS TPP,
		(SELECT NB.nconst, AVG(TR.averageRating) as average
		 FROM title.name_basic as NB, title.title_rating as TR, title.title_basic as TB, title.principal as TP, title.name_basic_primaryProfession as NBP, title.primaryProfession AS TPP
		 WHERE NB.nconst = TP.nconst AND TP.tconst = TB.tconst AND TB.tconst = TR.tconst AND NB.nconst = NBP.nconst AND TPP.primaryProfessionId = NBP.primaryProfessionId AND TPP.primaryProfession = 'actor'
		 GROUP BY NB.nconst) as subTable
	 WHERE NB.nconst = TP.nconst AND TP.tconst = TB.tconst AND TB.tconst = TR.tconst AND subTable.nconst = NB.nconst AND NB.nconst = NBP.nconst AND TPP.primaryProfessionId = NBP.primaryProfessionId 
      AND TPP.primaryProfession = 'actor' AND TB.titleType = 'movie' AND TR.averageRating > subTable.average
	 GROUP BY NB.nconst) as secondTable
WHERE NBA.nconst = secondTable.nconst and secondTable.numMoviesAboveAvg > 2;

INSERT INTO `title`.`principal`
(`tconst`,
`ordering`,
`nconst`,
`category`,
`job`,
`characters`)
VALUES
('tt0000335', 1, 'nm0183947', 'actor', NULL, NULL), ('tt0000502', 1, 'nm0183947', 'actor', NULL, NULL), 
('tt0000574', 1, 'nm0183947', 'actor', NULL, NULL), ('tt0000009', 3, 'nm0183947', 'actor', NULL, NULL), 
('tt0000335', 2, 'nm0183823', 'actor', NULL, NULL), ('tt0000502', 2, 'nm0183823', 'actor', NULL, NULL), 
('tt0000574', 2, 'nm0183823', 'actor', NULL, NULL);

-- DELETE FROM title.principal WHERE (tconst = 'tt0000335' AND ordering = 1)
-- 	OR (tconst = 'tt0000335' AND ordering = 2)
--     OR (tconst = 'tt0000009' AND ordering = 3)
--     OR (tconst = 'tt0000502' AND ordering = 1)
--     OR (tconst = 'tt0000502' AND ordering = 2)
--     OR (tconst = 'tt0000574' AND ordering = 1)
--     OR (tconst = 'tt0000574' AND ordering = 2);

