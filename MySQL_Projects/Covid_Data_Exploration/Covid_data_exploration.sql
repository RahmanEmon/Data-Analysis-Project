-- Data visualization of total cases vs total deaths against the population of a country.

SELECT location, date, population, total_cases, total_deaths, (total_deaths/total_cases)*100 AS death_percentage
	FROM coviddeaths
	ORDER BY 1,2,6;

DELETE FROM coviddeaths WHERE continent = '';
DELETE FROM coviddeaths WHERE continent is null;

SELECT continent, location, date, population, total_cases, MAX(CAST(total_deaths AS UNSIGNED)) AS highest_death_count
	FROM coviddeaths
    WHERE continent IS NOT NULL
    GROUP BY location
    ORDER BY location,total_deaths DESC;