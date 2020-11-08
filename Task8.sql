-- Task 8
SELECT TB.tconst, TB.titleType, IFNULL(TE.seasonNumber, 0) AS seasonNumer
FROM title.title_basic as TB
LEFT JOIN title.title_episode as TE
ON TB.tconst = TE.tconst
WHERE TB.titleType = 'tvEpisode';