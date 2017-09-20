SELECT name, continent, population FROM world;


SELECT name
FROM world
WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million

SELECT name, gdp/population
FROM world
WHERE population >= 200000000

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'


SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')


SELECT name
FROM world
WHERE name LIKE ('%United%')

--Show the countries that are big by area or big by population. Show name, population and area

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

--Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000

--For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

--how per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000

--Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)


--Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital


SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND
yr > 1979 AND
yr < 1990

-- The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.Modify it to show the player, teamid, stadium and mdate and for every German goal.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'


--Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game JOIN goal ON (id = matchid)
WHERE player LIKE '%Mario%'


-- FROM the goal and eteam tables, Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid = id)
 WHERE gtime<=10

 --List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
 SELECT mdate, teamname
FROM game JOIN eteam ON (team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos'
