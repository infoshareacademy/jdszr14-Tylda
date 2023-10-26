-- 2018 UPDATE


INSERT INTO happinessallyears (
    year, 
    country, 
    happiness_rank, 
    happiness_score, 
    economy_gdp_per_capita, 
    family, 
    health_life_expectancy, 
    freedom, 
    trust_government_corruption, 
    generosity
)
SELECT 
    2018 as year,     
    "Country or region" as Country, 
    "Overall rank" as Happiness_Rank, 
    Score as Happiness_Score, 
    "GDP per capita" as Economy_GDP_per_Capita, 
    "Social support" as Family, 
    "Healthy life expectancy" as Health_Life_Expectancy, 
    "Freedom to make life choices" as Freedom, 
    CASE 
        WHEN "Perceptions of corruption" = 'N/A' THEN 0.0 -- lub inna domyślna wartość
        ELSE CAST("Perceptions of corruption" AS DOUBLE PRECISION)
    END as Trust_Government_Corruption, 
    Generosity
FROM happiness2018;

