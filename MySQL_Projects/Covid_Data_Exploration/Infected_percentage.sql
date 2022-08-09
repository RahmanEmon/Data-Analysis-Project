-- Total cases of infected people against the population

SELECT location, date, population, total_cases, (total_cases/population)*100 AS infected_percentage
	FROM coviddeaths
    ORDER BY infected_percentage DESC;


-- Fetching the data of the countries with the highest infected percentage

SELECT location, date, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS infected_percentage
	FROM coviddeaths
	GROUP BY location,population
	ORDER BY infected_percentage DESC;
