--select * from [Portfolio Projects]..CovidDeaths

--select location, date, total_cases, new_cases, total_deaths, population
--FROM [Portfolio Projects]..CovidDeaths
--WHERE continent is null
--ORDER BY 1,2

--select location, date, (total_cases/ total_deaths) as death_per_cases, population
--FROM [Portfolio Projects]..CovidDeaths
--WHERE continent is null
----ORDER BY 1,2

--SELECT location, date, total_deaths, total_cases,
--(total_deaths/total_cases)*100 as deathpercentage
--FROM [Portfolio Projects]..CovidDeaths
----where location = 'Philippines' 
--WHERE continent is null
--ORDER BY 1,2 

--SELECT location, date,  population, total_cases,
--(total_cases/population)*100 as percent_population_infected
--FROM [Portfolio Projects]..CovidDeaths
----where location = 'Philippines'
--where continent is null
----ORDER BY 1,2 

--SELECT location, population, max(total_cases) as highest_infection_count,
--max((total_cases/population))*100 as percent_population_infected
--FROM [Portfolio Projects]..CovidDeaths
----WHERE location = 'Philippines'
--WHERE continent is not  null
--group by location, population
--ORDER BY percent_population_infected desc

--select location, max(cast(total_deaths as int)) as total_death_count
--from [Portfolio Projects]..CovidDeaths
--WHERE continent is null
--group by  location
--order by total_death_count desc

--select continent, max(cast(total_deaths as int)) as total_death_count
--from [Portfolio Projects]..CovidDeaths
--WHERE continent is not null
--group by continent
--order by total_death_count desc

--create view continent_death_count
--as select continent, max(cast(total_deaths as int)) as total_death_count
--from [Portfolio Projects]..CovidDeaths
--WHERE continent is not null
--group by continent
----order by total_death_count desc

--SELECT * FROM  continent_death_count


--select date, sum(new_cases) as total_cases, sum (cast(new_deaths as int)) as total_deaths,
--sum(cast(new_deaths as int)) / sum(new_cases)*100 as death_percentage
--FROM [Portfolio Projects]..CovidDeaths
--where continent is not null
--group by date	
--order by 1,2

-- select sum(new_cases) as total_cases, sum (cast(new_deaths as int)) as total_deaths,
--sum(cast(new_deaths as int)) / sum(new_cases)*100 as death_percentage
--FROM [Portfolio Projects]..CovidDeaths
--where continent is not null
----group by date	
--order by 1,2

--SELECT * FROM 
--[Portfolio Projects]..CovidDeaths dea
--Join [Portfolio Projects]..CovidVaccinations vac
--ON dea.location = vac.location AND dea.date = vac.date

--SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--, Sum(Convert( int, vac.new_vaccinations)) OVER 
--(PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolling_vaccine_per_people
--FROM [Portfolio Projects]..CovidDeaths dea
--Join [Portfolio Projects]..CovidVaccinations vac
--ON dea.location = vac.location AND dea.date = vac.date
--WHERE dea.continent is not null
--ORDER BY 1,2,3

--With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, Rolling_Vaccine_Per_People)
--as
--(
--SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--, Sum(Convert( int, vac.new_vaccinations)) OVER 
--(PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolling_vaccine_per_people
--FROM [Portfolio Projects]..CovidDeaths dea
--Join [Portfolio Projects]..CovidVaccinations vac
--ON dea.location = vac.location AND dea.date = vac.date
--WHERE dea.continent is not null
----order by 1,2,3
--)
--SELECT *, (rolling_vaccine_per_people/Population)*100 as percent_population_vaccinated 
--FROM PopvsVac

--Drop table if exists percent_population_vaccinated
--Create Table percent_population_vaccinated
--(Continent nvarchar(255),
--Location nvarchar (255),
--Date datetime,
--Population numeric,
--New_vaccinations numeric,
--rolling_vaccine_per_people numeric)

--INSERT INTO percent_population_vaccinated
--SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--, Sum(Convert( int, vac.new_vaccinations)) OVER 
--(PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolling_vaccine_per_people
--FROM [Portfolio Projects]..CovidDeaths dea
--Join [Portfolio Projects]..CovidVaccinations vac
--ON dea.location = vac.location AND dea.date = vac.date
----WHERE dea.continent is not null
----order by 1,2,3

--SELECT *, (rolling_vaccine_per_people/population)*100
--FROM percent_population_vaccinated

--CREATE VIEW percent_population_vaccinated AS
--SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--, Sum(Convert( int, vac.new_vaccinations)) OVER 
--(PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolling_vaccine_per_people
--FROM [Portfolio Projects]..CovidDeaths dea
--Join [Portfolio Projects]..CovidVaccinations vac
--ON dea.location = vac.location AND dea.date = vac.date
--WHERE dea.continent is not null
----order by 1,2,3

--SELECT * FROM percent_population_vaccinated

