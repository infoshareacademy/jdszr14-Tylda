UPDATE happinessallyears h
SET region = CASE
		WHEN country IN ('Finland', 'Norway', 'Denmark', 'Iceland', 'Sweden') THEN 'Northern Europe'
		WHEN country IN ('Gambia', 'Ghana', 'Sierra Leone', 'Somalia', 'Somaliland Region', 'South Africa', 'South Sudan', 'Swaziland', 'Togo', 'Uganda', 'Zambia', 'Zimbabwe') THEN 'Sub-Saharan Africa'
		WHEN country IN ('Georgia', 'Slovakia', 'Slovenia', 'Turkey', 'Turkmenistan', 'Ukraine', 'Kazakhstan', 'Kosovo', 'Kyrgyzstan', 'Tajikistan') THEN 'Central and Eastern Europe'
		WHEN country IN ('Germany', 'Greece', 'Spain', 'Sweden', 'Switzerland') THEN 'Western Europe'
		WHEN country = 'Singapore' THEN 'Southeastern Asia'
		WHEN country = 'Finland' THEN 'Northern Europe'
		WHEN country = 'Norway' THEN 'Northern Europe'
		WHEN country = 'Denmark' THEN 'Northern Europe'
		WHEN country = 'Iceland' THEN 'Northern Europe'
		WHEN country = 'Gambia' THEN 'Sub-Saharan Africa'
		WHEN country = 'Georgia' THEN 'Central and Eastern Europe'
		WHEN country = 'Germany' THEN 'Western Europe'
		WHEN country = 'Ghana' THEN 'Sub-Saharan Africa'
		WHEN country = 'Greece' THEN 'Western Europe'
		WHEN country = 'Sierra Leone' THEN 'Sub-Saharan Africa'
		WHEN country = 'Slovakia' THEN 'Central and Eastern Europe'
		WHEN country = 'Slovenia' THEN 'Central and Eastern Europe'
		WHEN country = 'Somalia' THEN 'Sub-Saharan Africa'
		WHEN country = 'Somaliland Region' THEN 'Sub-Saharan Africa'
		WHEN country = 'South Africa' THEN 'Sub-Saharan Africa'
		WHEN country = 'South Korea' THEN 'Eastern Asia'
		WHEN country = 'South Sudan' THEN 'Sub-Saharan Africa'
		WHEN country = 'Spain' THEN 'Western Europe'
		WHEN country = 'Sri Lanka' THEN 'Southern Asia'
		WHEN country = 'Sudan' THEN 'Sub-Saharan Africa'
		WHEN country = 'Suriname' THEN 'Latin America and Caribbean'
		WHEN country = 'Swaziland' THEN 'Sub-Saharan Africa'
		WHEN country = 'Switzerland' THEN 'Western Europe'
		WHEN country = 'Syria' THEN 'Middle East and Northern Africa'
		WHEN country = 'Taiwan' THEN 'Eastern Asia'
		WHEN country = 'Tajikistan' THEN 'Central and Eastern Europe'
		WHEN country = 'Tanzania' THEN 'Sub-Saharan Africa'
		WHEN country = 'Thailand' THEN 'Southeastern Asia'
		WHEN country = 'Togo' THEN 'Sub-Saharan Africa'
		WHEN country = 'Trinidad & Tobago' THEN 'Latin America and Caribbean'
		WHEN country = 'Tunisia' THEN 'Middle East and Northern Africa'
		WHEN country = 'Turkey' THEN 'Middle East and Northern Africa'
		WHEN country = 'Turkmenistan' THEN 'Central and Eastern Europe'
		WHEN country = 'Uganda' THEN 'Sub-Saharan Africa'
		WHEN country = 'Ukraine' THEN 'Central and Eastern Europe'
		WHEN country = 'United Arab Emirates' THEN 'Middle East and Northern Africa'
		WHEN country = 'United Kingdom' THEN 'Western Europe'
		WHEN country = 'United States' THEN 'North America'
		WHEN country = 'Uruguay' THEN 'Latin America and Caribbean'
		WHEN country = 'Uzbekistan' THEN 'Central and Eastern Europe'
		WHEN country = 'Venezuela' THEN 'Latin America and Caribbean'
		WHEN country = 'Vietnam' THEN 'Southeastern Asia'
		WHEN country = 'Yemen' THEN 'Middle East and Northern Africa'
		WHEN country = 'Zambia' THEN 'Sub-Saharan Africa'
		WHEN country = 'Zimbabwe' THEN 'Sub-Saharan Africa'
		WHEN country = 'Afghanistan' THEN 'Southern Asia'
		WHEN country = 'Albania' THEN 'Central and Eastern Europe'
		WHEN country = 'Algeria' THEN 'Middle East and Northern Africa'
		WHEN country = 'Angola' THEN 'Sub-Saharan Africa'
		WHEN country = 'Argentina' THEN 'Latin America and Caribbean'
		WHEN country = 'Armenia' THEN 'Central and Eastern Europe'
		WHEN country = 'Australia' THEN 'Australia and New Zealand'
		WHEN country = 'Austria' THEN 'Western Europe'
		WHEN country = 'Azerbaijan' THEN 'Central and Eastern Europe'
		WHEN country = 'Bahrain' THEN 'Middle East and Northern Africa'
		WHEN country = 'Bangladesh' THEN 'Southern Asia'
		WHEN country = 'Belarus' THEN 'Central and Eastern Europe'
		WHEN country = 'Belgium' THEN 'Western Europe'
		WHEN country = 'Belize' THEN 'Latin America and Caribbean'
		WHEN country = 'Benin' THEN 'Sub-Saharan Africa'
		WHEN country = 'Bhutan' THEN 'Southern Asia'
		WHEN country = 'Bolivia' THEN 'Latin America and Caribbean'
		WHEN country = 'Bosnia and Herzegovina' THEN 'Central and Eastern Europe'
		WHEN country = 'Botswana' THEN 'Sub-Saharan Africa'
		WHEN country = 'Brazil' THEN 'Latin America and Caribbean'
		WHEN country = 'Bulgaria' THEN 'Central and Eastern Europe'
		WHEN country = 'Burkina Faso' THEN 'Sub-Saharan Africa'
		WHEN country = 'Burundi' THEN 'Sub-Saharan Africa'
		WHEN country = 'Cambodia' THEN 'Southeastern Asia'
		WHEN country = 'Cameroon' THEN 'Sub-Saharan Africa'
		WHEN country = 'Canada' THEN 'North America'
		WHEN country = 'Central African Republic' THEN 'Sub-Saharan Africa'
		WHEN country = 'Chad' THEN 'Sub-Saharan Africa'
		WHEN country = 'Chile' THEN 'Latin America and Caribbean'
		WHEN country = 'China' THEN 'Eastern Asia'
		WHEN country = 'Colombia' THEN 'Latin America and Caribbean'
		WHEN country = 'Comoros' THEN 'Sub-Saharan Africa'
		WHEN country = 'Congo (Brazzaville)' THEN 'Sub-Saharan Africa'
		WHEN country = 'Congo (Kinshasa)' THEN 'Sub-Saharan Africa'
		WHEN country = 'Costa Rica' THEN 'Latin America and Caribbean'
		WHEN country = 'Croatia' THEN 'Central and Eastern Europe'
		WHEN country = 'Cyprus' THEN 'Western Europe'
		WHEN country = 'Czech Republic' THEN 'Central and Eastern Europe'
		WHEN country = 'Denmark' THEN 'Western Europe'
		WHEN country = 'Djibouti' THEN 'Sub-Saharan Africa'
		WHEN country = 'Dominican Republic' THEN 'Latin America and Caribbean'
		WHEN country = 'Ecuador' THEN 'Latin America and Caribbean'
		WHEN country = 'Egypt' THEN 'Middle East and Northern Africa'
		WHEN country = 'El Salvador' THEN 'Latin America and Caribbean'
		WHEN country = 'Estonia' THEN 'Central and Eastern Europe'
		WHEN country = 'Ethiopia' THEN 'Sub-Saharan Africa'
		WHEN country = 'France' THEN 'Western Europe'
		WHEN country = 'Gabon' THEN 'Sub-Saharan Africa'
		WHEN country = 'Guatemala' THEN 'Latin America and Caribbean'
		WHEN country = 'Guinea' THEN 'Sub-Saharan Africa'
		WHEN country = 'Haiti' THEN 'Latin America and Caribbean'
		WHEN country = 'Honduras' THEN 'Latin America and Caribbean'
		WHEN country = 'Hong Kong' THEN 'Eastern Asia'
		WHEN country = 'Hungary' THEN 'Central and Eastern Europe'
		WHEN country = 'Iceland' THEN 'Western Europe'
		WHEN country = 'India' THEN 'Southern Asia'
		WHEN country = 'Indonesia' THEN 'Southeastern Asia'
		WHEN country = 'Iran' THEN 'Middle East and Northern Africa'
		WHEN country = 'Iraq' THEN 'Middle East and Northern Africa'
		WHEN country = 'Ireland' THEN 'Western Europe'
		WHEN country = 'Israel' THEN 'Middle East and Northern Africa'
		WHEN country = 'Italy' THEN 'Western Europe'
		WHEN country = 'Ivory Coast' THEN 'Sub-Saharan Africa'
		WHEN country = 'Jamaica' THEN 'Latin America and Caribbean'
		WHEN country = 'Japan' THEN 'Eastern Asia'
		WHEN country = 'Jordan' THEN 'Middle East and Northern Africa'
		WHEN country = 'Kazakhstan' THEN 'Central and Eastern Europe'
		WHEN country = 'Kenya' THEN 'Sub-Saharan Africa'
		WHEN country = 'Kosovo' THEN 'Central and Eastern Europe'
		WHEN country = 'Kuwait' THEN 'Middle East and Northern Africa'
		WHEN country = 'Kyrgyzstan' THEN 'Central and Eastern Europe'
		WHEN country = 'Laos' THEN 'Southeastern Asia'
		WHEN country = 'Latvia' THEN 'Central and Eastern Europe'
		WHEN country = 'Lebanon' THEN 'Middle East and Northern Africa'
		WHEN country = 'Lesotho' THEN 'Sub-Saharan Africa'
		WHEN country = 'Liberia' THEN 'Sub-Saharan Africa'
		WHEN country = 'Libya' THEN 'Middle East and Northern Africa'
		WHEN country = 'Lithuania' THEN 'Central and Eastern Europe'
		WHEN country = 'Luxembourg' THEN 'Western Europe'
		WHEN country = 'Macedonia' THEN 'Central and Eastern Europe'
		WHEN country = 'Madagascar' THEN 'Sub-Saharan Africa'
		WHEN country = 'Malawi' THEN 'Sub-Saharan Africa'
		WHEN country = 'Malaysia' THEN 'Southeastern Asia'
		WHEN country = 'Mali' THEN 'Sub-Saharan Africa'
		WHEN country = 'Malta' THEN 'Western Europe'
		WHEN country = 'Mauritania' THEN 'Sub-Saharan Africa'
		WHEN country = 'Mauritius' THEN 'Sub-Saharan Africa'
		WHEN country = 'Mexico' THEN 'Latin America and Caribbean'
		WHEN country = 'Moldova' THEN 'Central and Eastern Europe'
		WHEN country = 'Mongolia' THEN 'Eastern Asia'
		WHEN country = 'Montenegro' THEN 'Central and Eastern Europe'
		WHEN country = 'Morocco' THEN 'Middle East and Northern Africa'
		WHEN country = 'Mozambique' THEN 'Sub-Saharan Africa'
		WHEN country = 'Myanmar' THEN 'Southeastern Asia'
		WHEN country = 'Namibia' THEN 'Sub-Saharan Africa'
		WHEN country = 'Nepal' THEN 'Southern Asia'
		WHEN country = 'Netherlands' THEN 'Western Europe'
		WHEN country = 'New Zealand' THEN 'Australia and New Zealand'
		WHEN country = 'Nicaragua' THEN 'Latin America and Caribbean'
		WHEN country = 'Niger' THEN 'Sub-Saharan Africa'
		WHEN country = 'Nigeria' THEN 'Sub-Saharan Africa'
		WHEN country = 'North Cyprus' THEN 'Western Europe'
		WHEN country = 'Norway' THEN 'Western Europe'
		WHEN country = 'Oman' THEN 'Middle East and Northern Africa'
		WHEN country = 'Pakistan' THEN 'Southern Asia'
		WHEN country = 'Palestinian Territories' THEN 'Middle East and Northern Africa'
		WHEN country = 'Panama' THEN 'Latin America and Caribbean'
		WHEN country = 'Paraguay' THEN 'Latin America and Caribbean'
		WHEN country = 'Peru' THEN 'Latin America and Caribbean'
		WHEN country = 'Philippines' THEN 'Southeastern Asia'
		WHEN country = 'Poland' THEN 'Central and Eastern Europe'
		WHEN country = 'Portugal' THEN 'Western Europe'
		WHEN country = 'Puerto Rico' THEN 'Latin America and Caribbean'
		WHEN country = 'Qatar' THEN 'Middle East and Northern Africa'
		WHEN country = 'Romania' THEN 'Central and Eastern Europe'
		WHEN country = 'Russia' THEN 'Central and Eastern Europe'
		WHEN country = 'Rwanda' THEN 'Sub-Saharan Africa'
		WHEN country = 'Saudi Arabia' THEN 'Middle East and Northern Africa'
		WHEN country = 'Senegal' THEN 'Sub-Saharan Africa'
		WHEN country = 'Serbia' THEN 'Central and Eastern Europe'
		WHEN country = 'Finland' THEN 'Western Europe'
		WHEN country = 'North Macedonia' then 'Central and Eastern Europe'
		when country = 'Hong Kong S.A.R., China' then 'Eastern Asia'
		when country = 'Northern Cyprus' then 'Central and Eastern Europe'
		when country = 'Somaliland region' then 'Sub-Saharan Africa'
		when country = 'Trinidad and Tobago' then 'Latin America and Caribbean'
		WHEN REPLACE(country, 'Trinidad and Tobago', 'Trinidad & Tobago') = 'Trinidad & Tobago' THEN 'Latin America and Caribbean'
	ELSE region
END;




-- Dodanie Trynidad & Tobago i Trynidad and Tobago jako Trynidad & Tobago


INSERT INTO HappinessAllYears (
    Year,
    Country,
    Region,
    Happiness_Rank,
    Happiness_Score,
    Standard_Error,
    Economy_GDP_per_Capita,
    Family,
    Health_Life_Expectancy,
    Freedom,
    Trust_Government_Corruption,
    Generosity,
    Dystopia_Residual
)
VALUES (
    2015,
    'Trinidad & Tobago',
    'Latin America and Caribbean',
    41,
    6.168,
    0.10895,
    1.21183,
    1.18354,
    0.61483,
    0.55884,
    0.0114,
    0.31844,
    2.26882
);


INSERT INTO HappinessAllYears (
    Year,
    Country,
    Region,
    Happiness_Rank,
    Happiness_Score,
    Standard_Error,
    Economy_GDP_per_Capita,
    Family,
    Health_Life_Expectancy,
    Freedom,
    Trust_Government_Corruption,
    Generosity,
    Dystopia_Residual
)
VALUES (
    2016,
    'Trinidad & Tobago',
    'Latin America and Caribbean',
    43,
    6.168,
    NULL, -- Brak danych o Standard_Error dla 2016 roku, więc wstawiamy wartość NULL
    1.32572,
    0.98569,
    0.52608,
    0.48453,
    0.01241,
    0.31935,
    2.51394
);


INSERT INTO HappinessAllYears (
    Year,
    Country,
    Region,
    Happiness_Rank,
    Happiness_Score,
    Standard_Error,
    Economy_GDP_per_Capita,
    Family,
    Health_Life_Expectancy,
    Freedom,
    Trust_Government_Corruption,
    Generosity,
    Dystopia_Residual
)
VALUES (
    2017,
    'Trinidad & Tobago',
    'Latin America and Caribbean',
    38,
    6.16800022125244,
    NULL, -- Brak danych o Standard_Error dla 2017 roku, więc wstawiamy wartość NULL
    1.36135590076447,
    1.3802285194397,
    0.519983291625977,
    0.518630743026733,
    0.00896481610834599,
    0.325296461582184,
    2.05324745178223
);


INSERT INTO HappinessAllYears (
    Year,
    Country,
    Region,
    Happiness_Rank,
    Happiness_Score,
    Standard_Error,
    Economy_GDP_per_Capita,
    Family,
    Health_Life_Expectancy,
    Freedom,
    Trust_Government_Corruption,
    Generosity,
    Dystopia_Residual
)
VALUES (
    2018,
    'Trinidad & Tobago',
    'Latin America and Caribbean',
    38,
    6.192,
    NULL, -- Brak danych o Standard_Error dla 2018 roku, więc wstawiamy wartość NULL
    1.223,
    1.492,
    0.564,
    0.575,
    0.019,
    0.171,
    NULL -- Brak danych o Dystopia_Residual dla 2018 roku, więc wstawiamy wartość NULL
);


INSERT INTO HappinessAllYears (
    Year,
    Country,
    Region,
    Happiness_Rank,
    Happiness_Score,
    Standard_Error,
    Economy_GDP_per_Capita,
    Family,
    Health_Life_Expectancy,
    Freedom,
    Trust_Government_Corruption,
    Generosity,
    Dystopia_Residual
)
VALUES (
    2019,
    'Trinidad & Tobago',
    'Latin America and Caribbean',
    39,
    6.192,
    NULL, -- Brak danych o Standard_Error dla 2019 roku, więc wstawiamy wartość NULL
    1.231,
    1.477,
    0.713,
    0.489,
    0.016,
    0.185,
    NULL -- Brak danych o Dystopia_Residual dla 2019 roku, więc wstawiamy wartość NULL
);


-- Kasowanie regionów lub krajów bez danych



DELETE FROM happinessallyears 
WHERE country IS NULL OR region IS NULL;


