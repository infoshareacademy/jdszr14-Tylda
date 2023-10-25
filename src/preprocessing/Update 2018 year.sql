-- Aktualizacja danych - 2018 rok


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


-- Przypisanie kraju do regionu


UPDATE happinessallyears h
SET region = case
	-- ... (dla każdego kraju z 2018 roku)
    WHEN country = 'Finland' THEN 'Northern Europe'
    WHEN country = 'Norway' THEN 'Northern Europe'
    WHEN country = 'Denmark' THEN 'Northern Europe'
    WHEN country = 'Iceland' THEN 'Northern Europe'
    WHEN country = 'Switzerland' THEN 'Western Europe'
    WHEN country = 'Netherlands' THEN 'Western Europe'
    WHEN country = 'Canada' THEN 'North America'
    WHEN country = 'New Zealand' THEN 'Oceania'
    WHEN country = 'Sweden' THEN 'Northern Europe'
    WHEN country = 'Australia' THEN 'Oceania'
    WHEN country = 'United Kingdom' THEN 'Northern Europe'
    WHEN country = 'Austria' THEN 'Western Europe'
    WHEN country = 'Costa Rica' THEN 'Central America'
    WHEN country = 'Ireland' THEN 'Northern Europe'
    WHEN country = 'Germany' THEN 'Western Europe'
    WHEN country = 'Belgium' THEN 'Western Europe'
    WHEN country = 'Luxembourg' THEN 'Western Europe'
    WHEN country = 'United States' THEN 'North America'
    WHEN country = 'Israel' THEN 'Middle East'
    WHEN country = 'United Arab Emirates' THEN 'Middle East'
    WHEN country = 'Czech Republic' THEN 'Central Europe'
    WHEN country = 'Malta' THEN 'Southern Europe'
    WHEN country = 'France' THEN 'Western Europe'
    WHEN country = 'Mexico' THEN 'North America'
    WHEN country = 'Chile' THEN 'South America'
    WHEN country = 'Taiwan' THEN 'East Asia'
    WHEN country = 'Panama' THEN 'Central America'
    WHEN country = 'Brazil' THEN 'South America'
    WHEN country = 'Argentina' THEN 'South America'
    WHEN country = 'Guatemala' THEN 'Central America'
    WHEN country = 'Uruguay' THEN 'South America'
    WHEN country = 'Qatar' THEN 'Middle East'
	WHEN country = 'Saudi Arabia' THEN 'Middle East'
	WHEN country = 'Singapore' THEN 'Southeast Asia'
	WHEN country = 'Malaysia' THEN 'Southeast Asia'
	WHEN country = 'Spain' THEN 'Southern Europe'
	WHEN country = 'Colombia' THEN 'South America'
	WHEN country = 'Trinidad & Tobago' THEN 'Caribbean'
	WHEN country = 'Slovakia' THEN 'Central Europe'
	WHEN country = 'El Salvador' THEN 'Central America'
	WHEN country = 'Nicaragua' THEN 'Central America'
	WHEN country = 'Poland' THEN 'Central Europe'
	WHEN country = 'Bahrain' THEN 'Middle East'
	WHEN country = 'Uzbekistan' THEN 'Central Asia'
	WHEN country = 'Kuwait' THEN 'Middle East'
	WHEN country = 'Thailand' THEN 'Southeast Asia'
	WHEN country = 'Italy' THEN 'Southern Europe'
	WHEN country = 'Ecuador' THEN 'South America'
	WHEN country = 'Belize' THEN 'Central America'
	WHEN country = 'Lithuania' THEN 'Northern Europe'
	WHEN country = 'Slovenia' THEN 'Central Europe'
	WHEN country = 'Romania' THEN 'Eastern Europe'
	WHEN country = 'Latvia' THEN 'Northern Europe'
	WHEN country = 'Japan' THEN 'East Asia'
	WHEN country = 'Mauritius' THEN 'Sub-Saharan Africa'
	WHEN country = 'Jamaica' THEN 'Caribbean'
	WHEN country = 'South Korea' THEN 'East Asia'
	WHEN country = 'Northern Cyprus' THEN 'Eastern Europe'
	WHEN country = 'Russia' THEN 'Europe/Asia'
	WHEN country = 'Kazakhstan' THEN 'Central Asia'
	WHEN country = 'Cyprus' THEN 'Southern Europe'
	WHEN country = 'Bolivia' THEN 'South America'
	WHEN country = 'Estonia' THEN 'Northern Europe'
	WHEN country = 'Paraguay' THEN 'South America'
	WHEN country = 'Peru' THEN 'South America'
	WHEN country = 'Kosovo' THEN 'Eastern Europe'
	WHEN country = 'Moldova' THEN 'Eastern Europe'
	WHEN country = 'Turkmenistan' THEN 'Central Asia'
	WHEN country = 'Hungary' THEN 'Central Europe'
	WHEN country = 'Libya' THEN 'Sub-Saharan Africa'
	WHEN country = 'Philippines' THEN 'Southeast Asia'
	WHEN country = 'Honduras' THEN 'Central America'
	WHEN country = 'Belarus' THEN 'Eastern Europe'
	WHEN country = 'Turkey' THEN 'Europe/Asia'
	WHEN country = 'Pakistan' THEN 'South Asia'
	WHEN country = 'Hong Kong' THEN 'East Asia'
	WHEN country = 'Portugal' THEN 'Southern Europe'
	WHEN country = 'Serbia' THEN 'Eastern Europe'
	WHEN country = 'Greece' THEN 'Southern Europe'
	WHEN country = 'Lebanon' THEN 'Middle East'
	WHEN country = 'Montenegro' THEN 'Eastern Europe'
	WHEN country = 'Croatia' THEN 'Southern Europe'
	WHEN country = 'Dominican Republic' THEN 'Caribbean'
	WHEN country = 'Algeria' THEN 'Sub-Saharan Africa'
	WHEN country = 'Morocco' THEN 'Sub-Saharan Africa'
	WHEN country = 'China' THEN 'East Asia'
	WHEN country = 'Azerbaijan' THEN 'Caucasus/Europe'
	WHEN country = 'Tajikistan' THEN 'Central Asia'
	WHEN country = 'Macedonia' THEN 'Eastern Europe'
	WHEN country = 'Jordan' THEN 'Middle East'
	WHEN country = 'Nigeria' THEN 'Sub-Saharan Africa'
	WHEN country = 'Kyrgyzstan' THEN 'Central Asia'
	WHEN country = 'Bosnia and Herzegovina' THEN 'Eastern Europe'
	WHEN country = 'Mongolia' THEN 'East Asia'
	WHEN country = 'Vietnam' THEN 'Southeast Asia'
	WHEN country = 'Indonesia' THEN 'Southeast Asia'
	WHEN country = 'Bhutan' THEN 'South Asia'
	WHEN country = 'Somalia' THEN 'Sub-Saharan Africa'
	WHEN country = 'Cameroon' THEN 'Sub-Saharan Africa'
	WHEN country = 'Bulgaria' THEN 'Eastern Europe'
	WHEN country = 'Nepal' THEN 'South Asia'
	WHEN country = 'Venezuela' THEN 'South America'
	WHEN country = 'Gabon' THEN 'Sub-Saharan Africa'
	WHEN country = 'Palestinian Territories' THEN 'Middle East'
	WHEN country = 'South Africa' THEN 'Sub-Saharan Africa'
	WHEN country = 'Iran' THEN 'Middle East'
	WHEN country = 'Ivory Coast' THEN 'Sub-Saharan Africa'
	WHEN country = 'Ghana' THEN 'Sub-Saharan Africa'
	WHEN country = 'Senegal' THEN 'Sub-Saharan Africa'
	WHEN country = 'Laos' THEN 'Southeast Asia'
	WHEN country = 'Tunisia' THEN 'Sub-Saharan Africa'
	WHEN country = 'Albania' THEN 'Eastern Europe'
	WHEN country = 'Sierra Leone' THEN 'Sub-Saharan Africa'
	WHEN country = 'Congo (Brazzaville)' THEN 'Sub-Saharan Africa'
	WHEN country = 'Bangladesh' THEN 'South Asia'
	WHEN country = 'Sri Lanka' THEN 'South Asia'
	WHEN country = 'Iraq' THEN 'Middle East'
	WHEN country = 'Mali' THEN 'Sub-Saharan Africa'
	WHEN country = 'Namibia' THEN 'Sub-Saharan Africa'
	WHEN country = 'Cambodia' THEN 'Southeast Asia'
	WHEN country = 'Burkina Faso' THEN 'Sub-Saharan Africa'
	WHEN country = 'Egypt' THEN 'North Africa'
	WHEN country = 'Mozambique' THEN 'Sub-Saharan Africa'
	WHEN country = 'Kenya' THEN 'Sub-Saharan Africa'
	WHEN country = 'Zambia' THEN 'Sub-Saharan Africa'
	WHEN country = 'Mauritania' THEN 'Sub-Saharan Africa'
	WHEN country = 'Ethiopia' THEN 'Sub-Saharan Africa'
	WHEN country = 'Georgia' THEN 'Caucasus/Europe'
	WHEN country = 'Armenia' THEN 'Caucasus/Europe'
	WHEN country = 'Myanmar' THEN 'Southeast Asia'
	WHEN country = 'Chad' THEN 'Sub-Saharan Africa'
	WHEN country = 'Congo (Kinshasa)' THEN 'Sub-Saharan Africa'
	WHEN country = 'India' THEN 'South Asia'
	WHEN country = 'Niger' THEN 'Sub-Saharan Africa'
	WHEN country = 'Uganda' THEN 'Sub-Saharan Africa'
	WHEN country = 'Benin' THEN 'Sub-Saharan Africa'
	WHEN country = 'Sudan' THEN 'Sub-Saharan Africa'
	WHEN country = 'Ukraine' THEN 'Eastern Europe'
	WHEN country = 'Togo' THEN 'Sub-Saharan Africa'
	WHEN country = 'Guinea' THEN 'Sub-Saharan Africa'
	WHEN country = 'Lesotho' THEN 'Sub-Saharan Africa'
	WHEN country = 'Angola' THEN 'Sub-Saharan Africa'
	WHEN country = 'Madagascar' THEN 'Sub-Saharan Africa'
	WHEN country = 'Zimbabwe' THEN 'Sub-Saharan Africa'
	WHEN country = 'Afghanistan' THEN 'South Asia'
	WHEN country = 'Botswana' THEN 'Sub-Saharan Africa'
	WHEN country = 'Malawi' THEN 'Sub-Saharan Africa'
    WHEN country = 'Haiti' THEN 'Caribbean'
	WHEN country = 'Liberia' THEN 'Sub-Saharan Africa'
	WHEN country = 'Syria' THEN 'Middle East'
	WHEN country = 'Rwanda' THEN 'Sub-Saharan Africa'
	WHEN country = 'Yemen' THEN 'Middle East'
	WHEN country = 'Tanzania' THEN 'Sub-Saharan Africa'
    WHEN country = 'South Sudan' THEN 'Sub-Saharan Africa'
    WHEN country = 'Central African Republic' THEN 'Sub-Saharan Africa'
    WHEN country = 'Burundi' THEN 'Sub-Saharan Africa'
    ELSE region -- zostawiamy wartość regionu bez zmiany jeśli kraj nie znajduje się na liście
END;




--- Zestawienie  różnic  regionalnych pomiędzy krajami lub regionami
-- Sortowanie od najwyższego wskaźnika zadowolenia



SELECT year, country, region, happiness_score
FROM happinessallyears
WHERE year IS NOT NULL AND region IS NOT NULL
UNION
SELECT year, country, region, MAX(happiness_score) AS max_happiness_score
FROM happinessallyears
WHERE year IS NOT NULL AND region IS NOT NULL
GROUP BY year, country, region
ORDER BY year, happiness_score DESC;


