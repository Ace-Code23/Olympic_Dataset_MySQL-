DROP TABLE IF EXISTS olympics_history_noc_regions;
CREATE TABLE IF NOT EXISTS olympics_history_noc_regions(
	noc 			VARCHAR(250),
    region			VARCHAR(250),
    notes			VARCHAR(550)
);

DROP TABLE IF EXISTS olympics_history;
CREATE TABLE IF NOT EXISTS olympics_history(
	id				VARCHAR(250),
    name			VARCHAR(250),
    sex				VARCHAR(250),
	age				VARCHAR(250),
    height			VARCHAR(250),
    weight			VARCHAR(250),
    team			VARCHAR(250),
    noc				VARCHAR(250),
    game			VARCHAR(250),
    year			VARCHAR(250),
    season			VARCHAR(250),
    city			VARCHAR(250),
    sport			VARCHAR(250),
	event			VARCHAR(250),
    medal			VARCHAR(250)
);