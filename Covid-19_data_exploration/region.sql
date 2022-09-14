-- Creating dimension table Region
SELECT distinct(iso_code), continent, location, population FROM covidproject.coviddeaths;