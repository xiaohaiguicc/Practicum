SELECT primaryName FROM name_basic
WHERE primaryName = "John Belushi";

CREATE INDEX ACTOR_INDEX ON name_basic (primaryName);
SHOW INDEX FROM name_basic;

SELECT * FROM name_basic
WHERE primaryName = "John Belushi";
