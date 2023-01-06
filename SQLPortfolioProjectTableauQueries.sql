
-- New Queries for Tableau Visualizations

-- 1.
-- Global Total Cases, Deaths, Death Percentage as of December 2022

SELECT SUM(new_cases) AS TotalCases, SUM(cast(new_deaths as bigint)) AS TotalDeaths,
SUM(cast(new_deaths as bigint))/SUM(new_cases)*100 AS TotalDeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 1,2

-- 2. 
-- Showing Continents and Income Levels with Highest Death Count
-- Filterd out income and others to stay consistent 

SELECT location, MAX(cast(total_deaths as bigint)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is null
and location not in ('World', 'European Union', 'International'
, 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location
ORDER BY TotalDeathCount desc

-- 3. 
-- Highest Infection Rates per Country w/out Date

SELECT location, population, MAX(total_cases) AS HighestInfestionCount, MAX((total_cases/population))*100 AS PercentageGotCovid
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY location, population 
ORDER BY PercentageGotCovid desc

-- 4. 
-- Highest Infection Rates per Country w/ Date

SELECT location, population, date, MAX(total_cases) AS HighestInfestionCount, MAX((total_cases/population))*100 AS PercentageGotCovid
FROM PortfolioProject..CovidDeaths
GROUP BY location, population, date 
ORDER BY PercentageGotCovid desc