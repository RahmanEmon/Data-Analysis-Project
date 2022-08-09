SELECT * FROM covidvaccinations;

-- Get the data of total vaccinations against the population of a country
-- Using common table expression(CTE)

WITH vaccination_population(continent, location, date, population, new_vaccinations, rolling_people_vaccinated) AS
(
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
	SUM(CONVERT(new_vaccinations, unsigned)) OVER(PARTITION by cd.location ORDER by cd.location,cd.date) AS rolling_people_vaccinated
	FROM coviddeaths AS cd
    JOIN covidvaccinations AS cv
    ON cd.location = cv.location
    AND cd.date = cv.date
)
SELECT *,(rolling_people_vaccinated/population)*100 AS vaccination_percentage
FROM vaccination_population
ORDER BY 7 DESC;