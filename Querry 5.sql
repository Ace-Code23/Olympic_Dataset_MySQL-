WITH tot_games AS
              (SELECT count(DISTINCT game) AS total_games
              FROM olympics_history),
          countries AS
              (SELECT game, olympics_history_noc_regions.region AS country
              FROM olympics_history
              JOIN olympics_history_noc_regions ON olympics_history_noc_regions.noc=olympics_history.noc
              GROUP BY game, olympics_history_noc_regions.region),
          countries_participated AS
              (SELECT country, COUNT(1) AS total_participated_games
              FROM countries
              GROUP BY country)
      SELECT countries_participated.* FROM countries_participated
      JOIN tot_games ON tot_games.total_games = countries_participated.total_participated_games;