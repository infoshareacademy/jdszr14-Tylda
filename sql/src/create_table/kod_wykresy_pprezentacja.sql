
SELECT column_name 
FROM information_schema.columns 
WHERE table_schema = 'public' 
AND table_name   = '2015';

SELECT
    year,
    country AS Country,
    "Happiness Rank" AS Rank,
    "Happiness Score" AS Score,
    "Economy (GDP per Capita)" AS "GDP per Capita",
    "Family" AS "Social/Family Support",
    "Health (Life Expectancy)" AS "Health/Life Expectancy",
    freedom AS Freedom,
    generosity AS Generosity,
    "Trust (Government Corruption)" AS "Trust/Corruption"
FROM public."2015"

SELECT column_name 
FROM information_schema.columns 
WHERE table_schema = 'public' 
AND table_name   = '2016';

SELECT
    year,
    country AS Country,
    "Happiness Rank" AS Rank,
    "Happiness Score" AS Score,
    "Economy (GDP per Capita)" AS "GDP per Capita",
    "Family" AS "Social/Family Support",
    "Health (Life Expectancy)" AS "Health/Life Expectancy",
    freedom AS Freedom,
    generosity AS Generosity,
    "Trust (Government Corruption)" AS "Trust/Corruption"
FROM public."2016"

SELECT column_name 
FROM information_schema.columns 
WHERE table_schema = 'public' 
AND table_name   = '2017';

SELECT
    year,
    country AS Country,
    "Happiness.Rank" AS Rank,
    "Happiness.Score" AS Score,
    "Economy..GDP.per.Capita." AS "GDP per Capita",
    "Family" AS "Social/Family Support",
    "Health..Life.Expectancy." AS "Health/Life Expectancy",
    freedom AS Freedom,
    generosity AS Generosity,
    "Trust..Government.Corruption." AS "Trust/Corruption"
FROM public."2017"

SELECT column_name 
FROM information_schema.columns 
WHERE table_schema = 'public' 
AND table_name   = '2018';

SELECT
    year,
    "Country or region" AS Country,
    "Overall rank" AS Rank,
    score AS Score,
    "GDP per capita" AS "GDP per Capita",
    "Social support" AS "Social/Family Support",
    "Healthy life expectancy" AS "Health/Life Expectancy",
    "Freedom to make life choices" AS Freedom,
    generosity AS Generosity,
    "Perceptions of corruption" AS "Trust/Corruption"
FROM public."2018"

SELECT column_name 
FROM information_schema.columns 
WHERE table_schema = 'public' 
AND table_name   = '2019';

SELECT
    year,
    "Country or region" AS Country,
    "Overall rank" AS Rank,
    score AS Score,
    "GDP per capita" AS "GDP per Capita",
    "Social support" AS "Social/Family Support",
    "Healthy life expectancy" AS "Health/Life Expectancy",
    "Freedom to make life choices" AS Freedom,
    generosity AS Generosity,
    "Perceptions of corruption" AS "Trust/Corruption"
FROM public."2019"


-- Tworzymy jedną spójną tabelę 

create table all_years AS
SELECT 
    year,
    country AS Country,
    "Happiness Rank" AS Rank,
    "Happiness Score" AS Score,
    "Economy (GDP per Capita)" AS "GDP per Capita",
    "Family" AS "Social/Family Support",
    "Health (Life Expectancy)" AS "Health/Life Expectancy",
    freedom AS Freedom,
    generosity AS Generosity,
    "Trust (Government Corruption)" AS "Trust/Corruption"
FROM public."2015"

UNION ALL

-- Dla roku 2016
SELECT 
    year,
    country AS Country,
    "Happiness Rank" AS Rank,
    "Happiness Score" AS Score,
    "Economy (GDP per Capita)" AS "GDP per Capita",
    "Family" AS "Social/Family Support",
    "Health (Life Expectancy)" AS "Health/Life Expectancy",
    freedom AS Freedom,
    generosity AS Generosity,
    "Trust (Government Corruption)" AS "Trust/Corruption"
FROM public."2016"

UNION ALL

-- Dla roku 2017
SELECT 
    year,
    country AS Country,
    "Happiness.Rank" AS Rank,
    "Happiness.Score" AS Score,
    "Economy..GDP.per.Capita." AS "GDP per Capita",
    "Family" AS "Social/Family Support",
    "Health..Life.Expectancy." AS "Health/Life Expectancy",
    freedom AS Freedom,
    generosity AS Generosity,
    "Trust..Government.Corruption." AS "Trust/Corruption"
FROM public."2017"

UNION ALL

-- Dla roku 2018
SELECT 
    year,
    "Country or region" AS Country,
    "Overall rank" AS Rank,
    score AS Score,
    "GDP per capita" AS "GDP per Capita",
    "Social support" AS "Social/Family Support",
    "Healthy life expectancy" AS "Health/Life Expectancy",
    "Freedom to make life choices" AS Freedom,
    generosity AS Generosity,
    "Perceptions of corruption" AS "Trust/Corruption"
FROM public."2018"

UNION ALL

-- Dla roku 2019
SELECT 
    year,
    "Country or region" AS Country,
    "Overall rank" AS Rank,
    score AS Score,
    "GDP per capita" AS "GDP per Capita",
    "Social support" AS "Social/Family Support",
    "Healthy life expectancy" AS "Health/Life Expectancy",
    "Freedom to make life choices" AS Freedom,
    generosity AS Generosity,
    "Perceptions of corruption" AS "Trust/Corruption"
FROM public."2019"


SELECT * FROM all_years;

---Trendy w poziomie szczęścia w poszczególnych krajach

SELECT Country, 
       MAX(Score) - MIN(Score) AS Score_Difference 
FROM all_years 
GROUP BY Country 
ORDER BY Score_Difference DESC;

---Największe zmiany w poziomie szczęścia od początku do końca okresu: 
SELECT Country, 
       MAX(CASE WHEN year = 2015 THEN Score END) - MAX(CASE WHEN year = 2019 THEN Score END) AS Score_Change_2015_to_2019 
FROM all_years 
GROUP BY Country 
HAVING MAX(CASE WHEN year = 2015 THEN Score END) IS NOT NULL AND MAX(CASE WHEN year = 2019 THEN Score END) IS NOT NULL
ORDER BY Score_Change_2015_to_2019 DESC;

---Top 5 krajów z największym wzrostem poziomu szczęścia:
SELECT Country, 
       MAX(CASE WHEN year = 2019 THEN Score END) - MAX(CASE WHEN year = 2015 THEN Score END) AS Score_Difference_2015_to_2019 
FROM all_years 
WHERE Score IS NOT NULL
GROUP BY Country 
HAVING MAX(CASE WHEN year = 2015 THEN Score END) IS NOT NULL AND MAX(CASE WHEN year = 2019 THEN Score END) IS NOT NULL
ORDER BY Score_Difference_2015_to_2019 DESC 
LIMIT 5;


---Top 5 krajów z największym spadkiem poziomu szczęścia:
SELECT Country, 
       MAX(CASE WHEN year = 2015 THEN Score END) - MAX(CASE WHEN year = 2019 THEN Score END) AS Score_Change_2015_to_2019 
FROM all_years 
GROUP BY Country 
HAVING MAX(CASE WHEN year = 2015 THEN Score END) IS NOT NULL AND MAX(CASE WHEN year = 2019 THEN Score END) IS NOT NULL AND (MAX(CASE WHEN year = 2015 THEN Score END) - MAX(CASE WHEN year = 2019 THEN Score END)) > 0
ORDER BY Score_Change_2015_to_2019 DESC 
LIMIT 5;

---Średni poziom szczęścia dla każdego kraju:
SELECT Country, 
       AVG(Score) AS Average_Score 
FROM all_years 
GROUP BY Country 
ORDER BY Average_Score DESC;

---Kraje, które były w top 5 co do poziomu szczęścia w każdym roku:
WITH Top5 AS (
    SELECT year, Country 
    FROM (
        SELECT year, Country, RANK() OVER (PARTITION BY year ORDER BY Score DESC) AS ranking 
        FROM all_years
    ) AS Ranked 
    WHERE ranking <= 5
)

SELECT Country 
FROM Top5 
GROUP BY Country 
HAVING COUNT(DISTINCT year) = 5;

--- kraje z największą różnicą w poziomie szczęścia między 2015 a 2019 rokiem:
SELECT Country, 
       MAX(CASE WHEN year = 2019 THEN Score END) - MAX(CASE WHEN year = 2015 THEN Score END) AS Score_Difference_2015_to_2019 
FROM all_years 
WHERE Score IS NOT NULL
GROUP BY Country 
HAVING MAX(CASE WHEN year = 2015 THEN Score END) IS NOT NULL AND MAX(CASE WHEN year = 2019 THEN Score END) IS NOT NULL
ORDER BY Score_Difference_2015_to_2019 DESC;

---Kraje z największymi zmianami w rankingu (W tym zapytaniu najpierw obliczamy roczne różnice w rankingu dla każdego kraju, 
---a następnie obliczamy maksymalne wzrosty i spadki dla każdego kraju. Dodatkowo dodajemy kolumny, 
---które wskazują, w których latach miały miejsce te maksymalne zmiany.)
WITH RankedDifferences AS (
    SELECT
        Country,
        year,
        LAG(Rank) OVER (PARTITION BY Country ORDER BY year) AS Previous_Rank,
        Rank
    FROM all_years
)

, CalculatedDifferences AS (
    SELECT 
        Country, 
        year,
        Rank - COALESCE(Previous_Rank, Rank) AS Yearly_Rank_Difference
    FROM RankedDifferences
)

, MaxMinDifferences AS (
    SELECT 
        Country,
        MAX(CASE WHEN Yearly_Rank_Difference > 0 THEN Yearly_Rank_Difference ELSE 0 END) AS Max_Rank_Increase,
        MIN(CASE WHEN Yearly_Rank_Difference < 0 THEN Yearly_Rank_Difference ELSE 0 END) AS Max_Rank_Decrease
    FROM CalculatedDifferences
    GROUP BY Country
)

SELECT 
    mmd.Country,
    mmd.Max_Rank_Increase,
    mmd.Max_Rank_Decrease,
    STRING_AGG(DISTINCT CASE WHEN cd.Yearly_Rank_Difference = mmd.Max_Rank_Increase THEN CAST(cd.year AS TEXT) END, ', ') AS Years_Of_Max_Increase,
    STRING_AGG(DISTINCT CASE WHEN cd.Yearly_Rank_Difference = mmd.Max_Rank_Decrease THEN CAST(cd.year AS TEXT) END, ', ') AS Years_Of_Max_Decrease
FROM MaxMinDifferences mmd
JOIN CalculatedDifferences cd ON mmd.Country = cd.Country
GROUP BY mmd.Country, mmd.Max_Rank_Increase, mmd.Max_Rank_Decrease
ORDER BY ABS(mmd.Max_Rank_Increase - mmd.Max_Rank_Decrease) DESC;


---Analiza wskaźnika Trust/Corruption w odniesieniu do rankingu szczęścia
SELECT Country, 
       AVG(Score) AS Avg_Happiness, 
       AVG("Trust/Corruption") AS Avg_Trust 
FROM all_years 
GROUP BY Country 
ORDER BY Avg_Trust DESC;

---Correlation Between Trust and Happiness:
---Analiza trendów w wskaźniku "Trust/Corruption" w stosunku do innych wskaźników: a) W stosunku do "GDP per Capita":

---Wartość korelacji wynosząca 
---0.3045
---0.3045 jest dodatnia, co oznacza, że między wskaźnikami "Trust/Corruption" a "GDP per Capita" istnieje dodatni związek, ale nie jest on silny.

---W praktyce oznacza to, że w krajach o wyższym PKB na osobę istnieje pewna tendencja do większego zaufania społecznego i/lub mniejszej korupcji, ale związek ten nie jest wyraźny. Istnieje wiele innych czynników, które mogą wpłynąć na poziom zaufania społecznego i korupcji w danym kraju, a PKB na osobę jest tylko jednym z nich.

---Mimo że wartość korelacji 
---0.3045
---0.3045 sugeruje pewien związek, ważne jest, aby interpretować ją ostrożnie. Jak wcześniej wspomniano, korelacja nie wskazuje na przyczynowość. Oznacza to, że choć istnieje związek między "GDP per Capita" a "Trust/Corruption", nie możemy stwierdzić, że wyższy PKB na osobę bezpośrednio prowadzi do większego zaufania społecznego lub mniejszej korupcji.
SELECT
    CORR(Score, "Trust/Corruption") AS Correlation_Between_Happiness_And_Trust
FROM all_years;

---b) W stosunku do "Health/Life Expectancy": Wartość korelacji wynosząca 
---0.2505
---0.2505 jest dodatnia, co wskazuje na dodatni związek między wskaźnikami "Trust/Corruption" a "Health/Life Expectancy", ale tak jak w przypadku poprzedniej analizy, związek ten nie jest silny.

---Praktycznie oznacza to, że w krajach o wyższej oczekiwanej długości życia istnieje pewna tendencja do wyższego poziomu zaufania społecznego i/lub mniejszej korupcji. Jednak podobnie jak wcześniej, związek ten nie jest wyraźny i istnieje wiele innych czynników wpływających na poziom zaufania i korupcji w danym kraju.
SELECT
    CORR("Trust/Corruption", "Health/Life Expectancy") AS Correlation_Between_Trust_And_Health
FROM all_years;


---Kraje z największymi różnicami w poszczególnych wskaźnikach
SELECT Country, 
       MAX("GDP per Capita") - MIN("GDP per Capita") AS GDP_Difference, 
       MAX("Health/Life Expectancy") - MIN("Health/Life Expectancy") AS Health_Difference
FROM all_years 
GROUP BY Country 
ORDER BY GDP_Difference DESC;

---Podział na największy wzrost i największy spadek w GDP:
-- Największy wzrost GDP
-- Największy wzrost GDP
SELECT Country, 
       MAX("GDP per Capita") - MIN("GDP per Capita") AS GDP_Difference
FROM all_years 
GROUP BY Country 
HAVING MAX("GDP per Capita") - MIN("GDP per Capita") > 0
ORDER BY GDP_Difference DESC 
LIMIT 5;

-- Największy spadek GDP
-- Największy spadek GDP
SELECT Country, 
       MIN("GDP per Capita") - MAX("GDP per Capita") AS GDP_Difference
FROM all_years 
GROUP BY Country 
HAVING MIN("GDP per Capita") - MAX("GDP per Capita") < 0
ORDER BY GDP_Difference ASC 
LIMIT 5;

---Największe różnice w "GDP per Capita" pomiędzy krajami:
SELECT 
    Country,
    MAX("GDP per Capita") AS Max_GDP,
    MIN("GDP per Capita") AS Min_GDP,
    MAX("GDP per Capita") - MIN("GDP per Capita") AS GDP_Difference
FROM all_years
GROUP BY Country
ORDER BY GDP_Difference DESC
LIMIT 10;

---Największe różnice w "Health/Life Expectancy" pomiędzy krajami:
SELECT 
    Country,
    MAX("Health/Life Expectancy") AS Max_Health,
    MIN("Health/Life Expectancy") AS Min_Health,
    MAX("Health/Life Expectancy") - MIN("Health/Life Expectancy") AS Health_Difference
FROM all_years
GROUP BY Country
ORDER BY Health_Difference DESC
LIMIT 10;

---Średnia "GDP per Capita" i "Health/Life Expectancy" dla każdego kraju:
SELECT 
    Country,
    AVG("GDP per Capita") AS Avg_GDP,
    AVG("Health/Life Expectancy") AS Avg_Health
FROM all_years
GROUP BY Country
ORDER BY Avg_GDP DESC, Avg_Health DESC;

---Kraje z największym wzrostem "GDP per Capita" w porównaniu z poprzednim rokiem:
WITH GDP_Differences AS (
    SELECT 
        Country, 
        year, 
        "GDP per Capita" - LAG("GDP per Capita", 1) OVER(PARTITION BY Country ORDER BY year) AS GDP_Difference
    FROM all_years
)
SELECT Country, year, GDP_Difference
FROM GDP_Differences
WHERE GDP_Difference IS NOT NULL
ORDER BY GDP_Difference DESC
LIMIT 10;










