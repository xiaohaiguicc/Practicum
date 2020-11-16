SET profiling = 1;

INSERT INTO title_basic()
VALUES
	('tt010203g', 'short', 'Wings', 'Wings', 0, 1987, NULL, 30);
    
CREATE INDEX BASIC_INDEX1 ON title_basic (tconst);

INSERT INTO title_basic()
VALUES
	('tt010255g', 'short', 'Holes', 'Holes', 0, 1999, NULL, 20);
    
CREATE INDEX BASIC_INDEX2 ON title_basic (titleType);

INSERT INTO title_basic()
VALUES
	('tt010259g', 'short', 'Yes', 'Yes', 0, 1998, NULL, 21);
    
CREATE INDEX BASIC_INDEX3 ON title_basic (isAdult);

INSERT INTO title_basic()
VALUES
	('tt010256g', 'movie', 'Tommorow Land', 'Tommorow Land', 0, 2016, NULL, 120);

CREATE INDEX BASIC_INDEX4 ON title_basic (startYear);

INSERT INTO title_basic()
VALUES
	('tt030276s', 'movie', 'Short Term 12', 'Short Term 12', 0, 2013, NULL, 110);
    
CREATE INDEX BASIC_INDEX5 ON title_basic (endYear);

INSERT INTO title_basic()
VALUES
	('tt010777u', 'short', 'Yours', 'The Short History of the Long Road', 0, 2020, NULL, 21);

SHOW PROFILES;
