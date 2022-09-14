-- fetching data for fact table

SELECT 
	coviddeaths.iso_code, coviddeaths.date, coviddeaths.population, vaccination.life_expectancy
from coviddeaths
right join vaccination on coviddeaths.iso_code = vaccination.iso_code;
    