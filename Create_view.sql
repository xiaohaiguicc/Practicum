-- Task 7 create view
DROP VIEW IF EXISTS title.actor;
CREATE VIEW title.actor
AS
SELECT
	NBT.primaryName,
    NBT.age,
    IF(NBT.deadYear = NULL, 'NO', 'YES') AS IsDead,
    IFNULL(subTable.numKnowMovies, 0) AS numKnowMovies
FROM title.name_basic AS NBT
LEFT JOIN
	(SELECT NB.nconst, count(TB.tconst) AS numKnowMovies
	FROM title.name_basic AS NB
	INNER JOIN title.name_basic_primaryProfession AS NBP
		ON NB.nconst = NBP.nconst
	INNER JOIN title.primaryProfession AS TP
		ON TP.primaryProfessionId = NBP.primaryProfessionId
	LEFT JOIN title.title_name AS TN
		ON NB.nconst = TN.nconst
	LEFT JOIN title.title_basic AS TB
		ON TB.tconst = TN.tconst
	WHERE TP.primaryProfession = 'actor' AND TB.titleType = 'movie'
	GROUP BY NB.nconst) AS subTable
ON subTable.nconst = NBT.nconst;

SELECT * FROM title.actor;

INSERT INTO `title`.`title_basic`
(`tconst`,
`titleType`,
`primaryTitle`,
`originalTitle`,
`isAdult`,
`startYear`,
`endYear`,
`runTimeMinutes`)
VALUES
('tt0000011', 'movie', 'test', 'test1', 0, 1990, NULL, 3);
INSERT INTO title.title_name (`titleNameId`,`tconst`, `nconst`) VALUES(5, 'tt0000011', 'nm0183823');