select date from covidvaccinations;

-- converting string to date format
select str_to_date(date, "%m/%d/%Y") as mydate from covidvaccinations; -- use capital Y to extract year else it will read 2 digits of year and return incorrect values of year


-- converting string to date format
-- using CTE to use the new temporary column 

with dateTable (date) as
(
select str_to_date(date, "%m/%d/%Y") as date
from coviddeaths
)
select date, year(date) as year, monthname(date) as month
from dateTable;