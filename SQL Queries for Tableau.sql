/*

Queries used for Tableau Project

*/



-- 1. 

Select SUM(cast(new_cases as float)) as total_cases, SUM(cast(new_deaths as float)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(new_cases as float))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location


--Select SUM(cast(new_cases as float)) as total_cases, SUM(cast(new_deaths as float)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(new_cases as float))*100 as DeathPercentage
--From PortfolioProject..CovidDeaths
--Where location like '%states%'
--where location = 'World'
----Group By date
--order by 1,2


-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select continent, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths 
--Where location like '%states%'
Where continent is not null 
and location not in ('World', 'European Union', 'International')
Group by continent
order by TotalDeathCount desc


-- 3.

Select Location, population, MAX(total_cases) as HighestInfectionCount,  MAX((CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0)))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where location like '%States%'
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.

Select Location, population, date, MAX(total_cases) as HighestInfectionCount,  MAX((CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0)))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where location like '%States%'
Group by Location, Population, date
order by PercentPopulationInfected desc

