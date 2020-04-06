# SQLZoo - Skills Workshop <!-- omit in toc -->

[All Workshops](README.md) | [Source](https://sqlzoo.net/)

Learning Objectives

- [ ] Learn about SQL

Achievement Plan

- [ ] Work through the stages of the SQLZoo tutorial

Evidence

- I have made extensive notes during my work on SQLZoo, see below.

Contents:

- [Setting Up an SQL DB](#setting-up-an-sql-db)
- [SELECT Logic](#select-logic)
  - [WHERE](#where)
  - [IN](#in)
  - [BETWEEN](#between)
  - [LIKE](#like)
  - [OR](#or)
  - [XOR](#xor)
  - [NOT](#not)
- [Modifiers](#modifiers)
  - [Operations](#operations)
  - [ROUND](#round)
  - [LENGTH](#length)
  - [LEFT](#left)
  - [ORDER](#order)
  - [IN as a value](#in-as-a-value)
  - [CONCAT](#concat)
  - [ALL](#all)
  - [Correlated/Synchronised Sub Queries](#correlatedsynchronised-sub-queries)
- [Aggregates](#aggregates)
  - [SUM](#sum)
  - [COUNT](#count)
  - [MAX](#max)
  - [DISTINCT](#distinct)
  - [GROUP BY](#group-by)
  - [HAVING](#having)

## Setting Up an SQL DB

PostgreSQL installation:

[Linux](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/04_linux.md) | [Mac OS](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/04_mac.md)

## SELECT Logic

Here's a sample of a table of countries and info about them. Its name is world:

| name        | continent | area    | population | gdp          |
| ----------- | --------- | ------- | ---------- | ------------ |
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
| lots more   | ...       | ...     | ...        | ...          |

SELECT will return a mini table with data filtered out.

SQL uses semi-colons to indicate line ends, line breaks here are just to make the queries more readable.

### WHERE

To return the population of Germany, SELECT population column FROM the world table, using WHERE to return the value corresponding to "Germany" in the name column.

```sql
SELECT population
  FROM world
 WHERE name = 'Germany';
```

| population |
| ---------- |
| 80716000   |

### IN

To return the names and populations for Sweden Norway and Denmark, SELECT name and population FROM the world table, returning entries WHERE the name is IN the following list (Sweden Norway Denmark).

We need to return the name so we know which population is which, but it isn't strictly necessary.

```sql
SELECT name, population
  FROM world
 WHERE name IN ('Sweden', 'Norway', 'Denmark');
```

| name    | population |
| ------- | ---------- |
| Denmark | 5634437    |
| Norway  | 5124383    |
| Sweden  | 9675885    |

### BETWEEN

To return the names and areas of countries with areas between 200,000 and 250,000 sq km, SELECT name and area FROM the world table, using WHERE to look in the area column and return rows that have an area BETWEEN 200,000 AND 250,000.

```sql
SELECT name, area
  FROM world
 WHERE area BETWEEN 200000 AND 250000;
```

| name           | area   |
| -------------- | ------ |
| Belarus        | 207600 |
| Ghana          | 238533 |
| Guinea         | 245857 |
| Guyana         | 214969 |
| Laos           | 236800 |
| Romania        | 238391 |
| Uganda         | 241550 |
| United Kingdom | 242900 |

### LIKE

To return the names and populations of countries whose names start with 'Al', SELECT name and population FROM the world table, using WHERE to look in the name column for entries that are LIKE "AL%". The % is a wildcard.

```sql
SELECT name
  FROM world
 WHERE name LIKE "Al%";
```

| name    | population |
| ------- | ---------- |
| Albania | 3200000    |
| Algeria | 32900000   |

To return names and populations of countries whose name has a second letter of 'n', SELECT name and population FROM world, WHERE name is LIKE '\_n'. the U is a single character wildcard.

```sql
SELECT name
  FROM world
 WHERE name LIKE '_n%';
```

| name                 |
| -------------------- |
| Angola               |
| India                |
| Indonesia            |
| United Arab Emirates |
| Antigua and Barbuda  |
| Andorra              |
| United Kingdom       |
| United States        |

### OR

To return countries that either have an area of more than 3 million sq km or a population of more than 250 million, SELECT name, population and area FROM world WHERE area is greater than million OR population is greater than 250 million.

```sql
SELECT name, population, area
  FROM world
 WHERE area > 3000000
    OR population > 250000000;
```

| name          | population | area     |
| ------------- | ---------- | -------- |
| Australia     | 23545500   | 7692024  |
| Brazil        | 202794000  | 8515767  |
| Canada        | 35427524   | 9984670  |
| China         | 1365370000 | 9596961  |
| India         | 1246160000 | 3166414  |
| Indonesia     | 252164800  | 1904569  |
| Russia        | 146000000  | 17125242 |
| United States | 318320000  | 9826675  |

### XOR

To return countries that are big by area, or big by population (but not both!), SELECT name, population and area FROM world. WHERE area is greater than 3 million XOR (exclusive or) population is greater than 250 million.

```sql
SELECT name, population, area
  FROM world
 WHERE area > 3000000
   XOR population > 250000000;
```

| name      | population | area     |
| --------- | ---------- | -------- |
| Australia | 23545500   | 7692024  |
| Brazil    | 202794000  | 8515767  |
| Canada    | 35427524   | 9984670  |
| Indonesia | 252164800  | 1904569  |
| Russia    | 146000000  | 17125242 |

### NOT

To return countries with all the vowels and no spaces in its name, SELECT name FROM world, WHERE name is LIKE %a%, %e%, %i%, %o%, %u%, and NOT LIKE % %.

```sql
SELECT name
  FROM world
 WHERE name LIKE '%a%'
   AND name LIKE '%e%'
   AND name LIKE '%i%'
   AND name LIKE '%o%'
   AND name LIKE '%u%'
   AND name NOT LIKE '% %';
```

| name       |
| ---------- |
| Mozambique |

## Modifiers

### Operations

Operations can be performed on returned columns. To return the name and GDP per capita of countries with population over 200 million, SELECT name and gdp/population FROM world WHERE population is greater than 200 million.

```sql
SELECT name, gdp/population
  FROM world
 WHERE population > 200000000;
```

The returned column will have already had the division done to it:

| name          | gdp/population |
| ------------- | -------------- |
| Brazil        | 11115.2648     |
| China         | 6121.7106      |
| India         | 1504.7931      |
| Indonesia     | 3482.0205      |
| United States | 51032.2945     |

### ROUND

To return population in millions and gdp in billions to 2 decimal places for countries in South America, SELECT name, population/million and gdp/billion using ROUND to round to 2 decimal places, FROM world, WHERE the continent is South America.

```sql
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
  FROM world
WHERE continent = 'South America';
```

| name                             | ROUND(population/1000000, 2) | ROUND(gdp/1000000000, 2) |
| -------------------------------- | ---------------------------- | ------------------------ |
| Argentina                        | 42.67                        | 477.03                   |
| Bolivia                          | 10.03                        | 27.04                    |
| Brazil                           | 202.79                       | 2254.11                  |
| Chile                            | 17.77                        | 268.31                   |
| Colombia                         | 47.66                        | 369.81                   |
| Ecuador                          | 15.77                        | 87.5                     |
| Guyana                           | 0.78                         | 2.85                     |
| Paraguay                         | 6.78                         | 25.94                    |
| Peru                             | 30.48                        | 204.68                   |
| Saint Vincent and the Grenadines | 0.11                         | 0.69                     |
| Suriname                         | 0.53                         | 5.01                     |
| Uruguay                          | 3.29                         | 49.92                    |
| Venezuela                        | 28.95                        | 382.42                   |

To return gdp per capita rounded to 1000 for countries with a gdp over 1 trillion, SELECT name, gdp/population using ROUND to round to -3 decimal places (going left), FROM world, WHERE the gdp is greater than 1 trillion.

```sql
SELECT name, ROUND(gdp/population, -3)
  FROM world
 WHERE gdp > 1000000000000;
```

| name           | ROUND(gdp/population, -3) |
| -------------- | ------------------------- |
| Australia      | 66000                     |
| Brazil         | 11000                     |
| Canada         | 45000                     |
| China          | 6000                      |
| France         | 40000                     |
| Germany        | 42000                     |
| India          | 2000                      |
| Italy          | 33000                     |
| Japan          | 47000                     |
| Mexico         | 10000                     |
| Russia         | 14000                     |
| South Korea    | 22000                     |
| Spain          | 28000                     |
| United Kingdom | 39000                     |
| United States  | 51000                     |

### LENGTH

To return the name and capital of countries where the name and capital have the same number of characters, SELECT name and capital FROM world, WHERE the length of the name equals the length of the capital.

```sql
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);
```

| name      | capital  |
| --------- | -------- |
| Algeria   | Algiers  |
| Angola    | Luanda   |
| Armenia   | Yerevan  |
| Botswana  | Gaborone |
| Lots more | ...      |

### LEFT

To return the name and capital where the first letter of each matches, but they are not the same word, SELECT name and capital FROM world, WHERE using LEFT to get 1 character from the left of name and capital and comparing them, AND name does not equal capital

```sql
SELECT name, capital
  FROM world
 WHERE LEFT(name, 1) = LEFT(capital, 1)
   AND name <> capital;
```

| name      | capital          |
| --------- | ---------------- |
| Algeria   | Algiers          |
| Andorra   | Andorra la Vella |
| Barbados  | Bridgetown       |
| Belize    | Belmopan         |
| Lots more | ...              |

### ORDER

To return nobel prize winners name, year and subject where the nem start with "Sir." and order by descending year first, then by name, SELECT winner, year and subject FROM nobel, WHERE winner is LIKE 'Sir%', and ORDER BY -yr (for descending), then winner.

```sql
SELECT winner, yr, subject
  FROM nobel
 WHERE winner LIKE 'Sir%'
 ORDER BY -yr, winner;
```

| winner              | yr   | subject   |
| ------------------- | ---- | --------- |
| Sir Martin J. Evans | 2007 | Medicine  |
| Sir Peter Mansfield | 2003 | Medicine  |
| Sir Paul Nurse      | 2001 | Medicine  |
| Sir Harold Kroto    | 1996 | Chemistry |
| Sir James W. Black  | 1988 | Medicine  |

### IN as a value

To return the 1984 winners and subject ordered by subject and winner name, but listing chemistry and physics last, SELECT winner and subject FROM nobel, WHERE year is 1984, and order by subject IN physics or chemistry (which returns a 1 if it is or a 0 if not), then bny subject then by winner.

```sql
SELECT winner, subject
  FROM nobel
 WHERE yr = 1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;
```

| winner              | subject    |
| ------------------- | ---------- |
| Richard Stone       | Economics  |
| Jaroslav Seifert    | Literature |
| César Milstein      | Medicine   |
| Georges J.F. Köhler | Medicine   |
| Niels K. Jerne      | Medicine   |
| Desmond Tutu        | Peace      |
| Bruce Merrifield    | Chemistry  |
| Carlo Rubbia        | Physics    |
| Simon van der Meer  | Physics    |

### CONCAT

To return european countries name and population expressed as a percentage of the population of Germany rounded to no decimal places with a % sign, SELECT name and population divided by a nested SELECT population FROM world WHERE name is Germany, ROUND to 0 dp, CONCAT a % sign on, FROM world WHERE continent is Europe.

```sql
SELECT name, CONCAT(ROUND(100*population/(SELECT population
                                            FROM world
                                           WHERE name = 'Germany')),'%')
  FROM world
 WHERE continent = 'Europe';
```

| name      | (percentage) |
| --------- | ------------ |
| Albania   | 3%           |
| Andorra   | 0%           |
| Austria   | 11%          |
| Belarus   | 12%          |
| Lots more | ...          |

### ALL

To return the name of the largest country by population in the world. SELECT name FROM world WHERE population is greater than or equal to ALL, SELECT population FROM world WHERE population is greater than 0.

ALL allows comparison operators to act over a list.

```sql
SELECT name
FROM world
WHERE population >= ALL(SELECT population
                        FROM world
                        WHERE population>0);
```

| name  |
| ----- |
| China |

_Note: This could also be done by SELECT name FROM world WHERE population is greater than or equal to SELECT MAX(population) FROM world. [See MAX](#max)._

```sql
SELECT name
FROM world
WHERE population >= (SELECT MAX(population)
                       FROM world);
```

### Correlated/Synchronised Sub Queries

To return the continent, name and area of largest country by area in each continent, SELECT continent, name and area FROM world x, WHERE area is greater than or equal to ALL of SELECT area FROM world y WHERE y's continent is equal to x's continent AND the area is greater than 0.

For each of the continents in the outer loop, the inner loop will check that the continent is the same, otherwise it won't look at that value.

```sql
SELECT continent, name, area
  FROM world x
WHERE area >= ALL(SELECT area
                    FROM world y
                   WHERE y.continent=x.continent
                     AND area>0);
```

| continent     | name       | area     |
| ------------- | ---------- | -------- |
| Africa        | Algeria    | 2381741  |
| Oceania       | Australia  | 7692024  |
| South America | Brazil     | 8515767  |
| North America | Canada     | 9984670  |
| Asia          | China      | 9596961  |
| Caribbean     | Cuba       | 109884   |
| Europe        | Kazakhstan | 2724900  |
| Eurasia       | Russia     | 17125242 |

## Aggregates

Aggregates can be applied to a numeric attribute resulting in a single value being returned.

### SUM

To return the total gdp of the Africa, SELECT SUM(gdp) FROM world WHERE continent = 'Africa'.

```sql
SELECT SUM(gdp)
  FROM world
 WHERE continent = 'Africa'
```

| SUM(gdp)      |
| ------------- |
| 1811788000000 |

### COUNT

To return a count of how many chemistry awards given between 1950 and 1960, SELECT COUNT(subject) FROM nobel, WHERE subject is chemistry AND yr BETWEEN 1950 and 1960.

```sql
SELECT COUNT(subject)
  FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960;
```

| COUNT(subject) |
| -------------- |
| 15             |

### MAX

To return countries that have a gdp greater than any country in Africa, SELECT name FROM world WHERE gdp is greater than SELECT MAX gdp (the highest value) FROM world WHERE continent is Africa.

This gets past NULL values, as it will select the max from those that have values.

```sql
SELECT name
  FROM world
 WHERE gdp > (SELECT MAX(gdp)
                FROM world
               WHERE continent = 'Africa')
```

| name      |
| --------- |
| Argentina |
| Australia |
| Austria   |
| Belgium   |
| Lots more |

### DISTINCT

To return a count of years where no medicine awards were given, first SELECT DISTINCT years FROM nobel WHERE subject is medicine, then SELECT COUNT(DISTINCT yr) FROM nobel, WHERE yr is NOT IN the results of the first query.

This is done with nested queries (which can occur anywhere for any reason you like).

DISTINCT returns only unique values, removing duplicate rows.

```sql
SELECT COUNT(DISTINCT yr)
  FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr
                    FROM nobel
                   WHERE subject = 'Medicine');
```

| COUNT(DISTINCT yr) |
| ------------------ |
| 6                  |

To return the unique continents, SELECT DISTINCT continent FROM world.

```sql
SELECT DISTINCT continent
  FROM world
```

| continent     |
| ------------- |
| Africa        |
| Asia          |
| Caribbean     |
| Eurasia       |
| Europe        |
| North America |
| Oceania       |
| South America |

### GROUP BY

To return each continent and its number of countries, SELECT continent and COUNT(name) FROM world, GROUP BY continent

Not strictly an aggregate but uses the results of aggregates.

```sql
SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent
```

| continent     | COUNT(name) |
| ------------- | ----------- |
| Africa        | 53          |
| Asia          | 47          |
| Caribbean     | 11          |
| Eurasia       | 2           |
| Europe        | 44          |
| North America | 11          |
| Oceania       | 14          |
| South America | 13          |

### HAVING

To return the total population of continents with a population of at least half a billion, SELECT continent and SUM(population) FROM world, GROUP BY continent, HAVING SUM(population) of over half a billion.

HAVING tests the aggregated values of SUM(population) and filters off ones less than half a billion.

```sql
SELECT continent, SUM(population)
  FROM world
 GROUP BY continent
HAVING SUM(population) > 500000000
```

| continent     | SUM(population) |
| ------------- | --------------- |
| Africa        | 1016091005      |
| Asia          | 4342955676      |
| Europe        | 610261850       |
| North America | 518755156       |
