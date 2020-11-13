LOAD DATA INFILE '/private/var/lib/mysql-files/title_basic_table.tsv' 
INTO TABLE title.title_basic
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/title_rating_table.tsv' 
INTO TABLE title.title_rating
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/title_episode_table.tsv' 
INTO TABLE title.title_episode
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/genres_table.tsv' 
INTO TABLE title.genre
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/title_genres_table.tsv' 
INTO TABLE title.title_genre
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/title_akas_table.tsv' 
INTO TABLE title.title_akas
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/name_basic_table.tsv' 
INTO TABLE title.name_basic
IGNORE 1 LINES;


LOAD DATA INFILE '/private/var/lib/mysql-files/title_name_table.tsv' 
INTO TABLE title.title_name
IGNORE 1 LINES;


LOAD DATA INFILE '/private/var/lib/mysql-files/principal_table.tsv' 
INTO TABLE title.principal
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/primaryprofession_table.tsv' 
INTO TABLE title.primaryProfession
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/name_primaryprofession_table.tsv' 
INTO TABLE title.name_basic_primaryProfession
IGNORE 1 LINES;


LOAD DATA INFILE '/private/var/lib/mysql-files/title_crew_table.tsv' 
INTO TABLE title.title_crew
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/director_table.tsv' 
INTO TABLE title.director
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/writer_table.tsv' 
INTO TABLE title.writer
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/title_director_table.tsv' 
INTO TABLE title.title_director
IGNORE 1 LINES;

LOAD DATA INFILE '/private/var/lib/mysql-files/title_writer_table.tsv' 
INTO TABLE title.title_writer
IGNORE 1 LINES;


-- SHOW VARIABLES LIKE "secure_file_priv";

-- select @@GLOBAL.secure_file_priv;





