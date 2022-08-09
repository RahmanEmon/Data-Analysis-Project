-- Query to fetch the data of cases vs deaths for a particular country

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS death_percentage
	FROM coviddeaths
    WHERE location LIKE '%states%'
    ORDER BY 1,5 DESC;
    
-- Fetching the data of countries that start with "C"
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS death_percentage
	FROM coviddeaths
	WHERE location LIKE 'c%'
	ORDER BY 1,5 DESC;

-- Countries with the highest death count

SELECT location, MAX(CAST(total_deaths AS UNSIGNED)) AS highest_death_count
	FROM coviddeaths
    GROUP BY location
    ORDER BY highest_death_count DESC;

-- Continents with the highest death count

SELECT continent, MAX(CAST(total_deaths AS UNSIGNED)) AS highest_death_count
	FROM coviddeaths
    GROUP BY continent
    ORDER BY highest_death_count DESC;

