--- Tworzenie tabel

CREATE TABLE Happiness2015 (
    Country VARCHAR(50),
    Region VARCHAR(50),
    Happiness_Rank INT,
    Happiness_Score FLOAT,
    Standard_Error FLOAT,
    Economy_GDP_per_Capita FLOAT,
    Family FLOAT,
    Health_Life_Expectancy FLOAT,
    Freedom FLOAT,
    Trust_Government_Corruption FLOAT,
    Generosity FLOAT,
    Dystopia_Residual FLOAT,
    Year INT DEFAULT 2015
);

CREATE TABLE Happiness2016 (
    Country VARCHAR(50),
    Region VARCHAR(50),
    Happiness_Rank INT,
    Happiness_Score FLOAT,
    Lower_Confidence_Interval FLOAT,
    Upper_Confidence_Interval FLOAT,
    Economy_GDP_per_Capita FLOAT,
    Family FLOAT,
    Health_Life_Expectancy FLOAT,
    Freedom FLOAT,
    Trust_Government_Corruption FLOAT,
    Generosity FLOAT,
    Dystopia_Residual FLOAT,
    Year INT DEFAULT 2016
);

CREATE TABLE Happiness2017 (
    Country VARCHAR(50),
    Happiness_Rank INT,
    Happiness_Score FLOAT,
    Whisker_High FLOAT,
    Whisker_Low FLOAT,
    Economy_GDP_per_Capita FLOAT,
    Family FLOAT,
    Health_Life_Expectancy FLOAT,
    Freedom FLOAT,
    Generosity FLOAT,
    Trust_Government_Corruption FLOAT,
    Dystopia_Residual FLOAT,
    Year INT DEFAULT 2017
);

CREATE TABLE Happiness2018 (
    Overall_Rank INT,
    Country_or_Region VARCHAR(50),
    Score FLOAT,
    GDP_per_Capita FLOAT,
    Social_Support FLOAT,
    Healthy_Life_Expectancy FLOAT,
    Freedom_to_Make_Life_Choices FLOAT,
    Generosity FLOAT,
    Perceptions_of_Corruption FLOAT,
    Year INT DEFAULT 2018
);

CREATE TABLE Happiness2019 (
    Overall_Rank INT,
    Country_or_Region VARCHAR(50),
    Score FLOAT,
    GDP_per_Capita FLOAT,
    Social_Support FLOAT,
    Healthy_Life_Expectancy FLOAT,
    Freedom_to_Make_Life_Choices FLOAT,
    Generosity FLOAT,
    Perceptions_of_Corruption FLOAT,
    Year INT DEFAULT 2019
);

---Polecenie dodania indeksów na kolumny, które będą używane do łączenia tabel, takie jak „Country” lub „Country_or_Region”, co  znacząco przyspieszy operacje łączenia.
-- Dla roku 2015
CREATE INDEX idx_happiness2015_country ON Happiness2015 (Country);

-- Dla roku 2016
CREATE INDEX idx_happiness2016_country ON Happiness2016 (Country);

-- Dla roku 2017
CREATE INDEX idx_happiness2017_country ON Happiness2017 (Country);

-- Dla roku 2018
CREATE INDEX idx_happiness2018_country ON Happiness2018 (Country_or_Region);

-- Dla roku 2019
CREATE INDEX idx_happiness2019_country ON Happiness2019 (Country_or_Region);

---Jedna wielka tabela, która zawiera wszystkie dane z każdego roku. Będzie miał kolumny dla wszystkich unikalnych kolumn we wszystkich tabelach i będzie używał wartości NULL dla brakujących danych w poszczególnych latach.

CREATE TABLE HappinessAllYears (
    Year INT,
    Country VARCHAR(50),
    Region VARCHAR(50) NULL,
    Happiness_Rank INT,
    Happiness_Score FLOAT,
    Standard_Error FLOAT NULL,
    Lower_Confidence_Interval FLOAT NULL,
    Upper_Confidence_Interval FLOAT NULL,
    Whisker_High FLOAT NULL,
    Whisker_Low FLOAT NULL,
    Economy_GDP_per_Capita FLOAT,
    Family FLOAT,
    Health_Life_Expectancy FLOAT,
    Freedom FLOAT,
    Trust_Government_Corruption FLOAT,
    Generosity FLOAT,
    Dystopia_Residual FLOAT NULL,
    Social_Support FLOAT NULL,
    Freedom_to_Make_Life_Choices FLOAT NULL,
    Perceptions_of_Corruption FLOAT NULL
);

---Import danych z tabel do jednej, wieloletniej tabeli happinessallyears,

--- rok 2015

INSERT INTO HappinessAllYears (
    Year, 
    Country, 
    Region, 
    Happiness_Rank, 
    Happiness_Score, 
    Economy_GDP_per_Capita, 
    Family, 
    Health_Life_Expectancy, 
    Freedom, 
    Trust_Government_Corruption, 
    Generosity, 
    Dystopia_Residual
)
SELECT 
    2015 as Year, 
    Country, 
    Region, 
    "Happiness Rank" as Happiness_Rank, 
    "Happiness Score" as Happiness_Score, 
    "Economy (GDP per Capita)" as Economy_GDP_per_Capita, 
    Family, 
    "Health (Life Expectancy)" as Health_Life_Expectancy, 
    Freedom, 
    "Trust (Government Corruption)" as Trust_Government_Corruption, 
    Generosity, 
    "Dystopia Residual" as Dystopia_Residual
FROM happiness2015;

--- rok 2016

INSERT INTO HappinessAllYears (
    Year, 
    Country, 
    Region, 
    Happiness_Rank, 
    Happiness_Score, 
    Economy_GDP_per_Capita, 
    Family, 
    Health_Life_Expectancy, 
    Freedom, 
    Trust_Government_Corruption, 
    Generosity, 
    Dystopia_Residual
)
SELECT 
    2016 as Year, 
    Country, 
    Region, 
    "Happiness Rank" as Happiness_Rank, 
    "Happiness Score" as Happiness_Score, 
    "Economy (GDP per Capita)" as Economy_GDP_per_Capita, 
    Family, 
    "Health (Life Expectancy)" as Health_Life_Expectancy, 
    Freedom, 
    "Trust (Government Corruption)" as Trust_Government_Corruption, 
    Generosity, 
    "Dystopia Residual" as Dystopia_Residual
FROM happiness2016;

--- rok 2017 

INSERT INTO HappinessAllYears (
    Year, 
    Country, 
    Happiness_Rank, 
    Happiness_Score, 
    Economy_GDP_per_Capita, 
    Family, 
    Health_Life_Expectancy, 
    Freedom, 
    Trust_Government_Corruption, 
    Generosity, 
    Dystopia_Residual
)
SELECT 
    2017 as Year, 
    Country, 
    "Happiness.Rank" as Happiness_Rank, 
    "Happiness.Score" as Happiness_Score, 
    "Economy..GDP.per.Capita." as Economy_GDP_per_Capita, 
    Family, 
    "Health..Life.Expectancy." as Health_Life_Expectancy, 
    Freedom, 
    "Trust..Government.Corruption." as Trust_Government_Corruption, 
    Generosity, 
    "Dystopia.Residual" as Dystopia_Residual
FROM happiness2017;

---rok 2018
--- większość kolumn ma numeryczne typy danych, z wyjątkiem country_or_region i Country or region, które są typu VARCHAR. Kolumna Perceptions of corruption jest VARCHAR, jest to  miejsce, gdzie występuje "N/A".
--- Musimy amienić wartości "N/A" na NULL w kolumnie Perceptions of corruption

UPDATE happiness2018
SET "Perceptions of corruption" = NULL
WHERE "Perceptions of corruption" = 'N/A';

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
    happiness2018."country_or_region" as country, 
    happiness2018."overall_rank" as happiness_rank, 
    happiness2018."score" as happiness_score, 
    happiness2018."gdp_per_capita" as economy_gdp_per_capita, 
    happiness2018."social_support" as family, 
    happiness2018."healthy_life_expectancy" as health_life_expectancy, 
    happiness2018."freedom_to_make_life_choices" as freedom, 
    happiness2018."perceptions_of_corruption" as trust_government_corruption, 
    happiness2018."generosity" as generosity
FROM happiness2018;


--- rok 2019

INSERT INTO HappinessAllYears (
    Year, 
    Country, 
    Happiness_Rank, 
    Happiness_Score, 
    Economy_GDP_per_Capita, 
    Family, 
    Health_Life_Expectancy, 
    Freedom, 
    Trust_Government_Corruption, 
    Generosity
)
SELECT 
    2019 as Year, 
    "Country or region" as Country, 
    "Overall rank" as Happiness_Rank, 
    Score as Happiness_Score, 
    "GDP per capita" as Economy_GDP_per_Capita, 
    "Social support" as Family, 
    "Healthy life expectancy" as Health_Life_Expectancy, 
    "Freedom to make life choices" as Freedom, 
    "Perceptions of corruption" as Trust_Government_Corruption, 
    Generosity
FROM happiness2019;


--- Zmiany w Szczęściu na przestrzeni lat: Analiza, czy poziom szczęścia ogólnie rośnie, maleje czy pozostaje stabilny na przestrzeni lat. Hipoteza: "Średni poziom szczęścia na świecie rośnie/maleje każdego roku."
--- W wyniku uzyska;lismy tabelę, w której dla każdego roku prezentowany jest średni poziom szczęścia.
SELECT 
    year,
    AVG(happiness_score) as average_happiness_score
FROM happinessallyears
GROUP BY year
ORDER BY year ASC;

--- Różnice Regionalne: Analiza różnic w poziomach szczęścia pomiędzy różnymi regionami lub krajami. Hipoteza: "Kraje w określonym regionie mają tendencję do wyższych poziomów szczęścia w porównaniu do innych regionów."
--- średni poziom szczęścia dla każdego regionu dla każdego roku:

SELECT year, region, AVG(happiness_score) as average_happiness_score
FROM happinessallyears
GROUP BY year, region
ORDER BY year ASC, average_happiness_score DESC;

---dla różnic regionalnych pomiędzy krajami lub regionami

SELECT year, country, region, happiness_score
FROM happinessallyears
ORDER BY year, region, happiness_score DESC;

--- Wpływ czynników ekonomicznych: Badanie, jak poziom gospodarczy kraju (GDP per Capita) koreluje ze szczęściem jego mieszkańców. Hipoteza: "Kraje o wyższym PKB na mieszkańca mają wyższe wskaźniki szczęścia."

SELECT '2015' as year,
       CORR("Economy (GDP per Capita)", "Happiness Score") as correlation_coefficient
FROM happiness2015

SELECT '2016' as year,
       CORR("Economy (GDP per Capita)", "Happiness Score") as correlation_coefficient
FROM happiness2016;

SELECT '2017' as year,
       CORR("Economy..GDP.per.Capita.", "Happiness.Score") as correlation_coefficient
FROM happiness2017

SELECT '2018' as year,
       CORR("gdp_per_capita", "score") as correlation_coefficient
FROM happiness2018;

SELECT '2019' as year,
       CORR("gdp_per_capita", "score") as correlation_coefficient
FROM happiness2019;

---w 2018 i 2019 mam wynik correlation_coefficient wartość NULL. Jedna lub obie kolumny, których używamy do obliczenia korelacji, zawierają wartości NULL, co zakłóca nasz wynik. Możemy użyć funkcji COALESCE aby zastąpić wartości NULL zerami, lub możemy po prostu usunąć wiersze, które mają wartości NULL.

SELECT '2018' as year,
       CORR("gdp_per_capita", "score") as correlation_coefficient
FROM happiness2018
WHERE "gdp_per_capita" IS NOT NULL AND "score" IS NOT NULL;

SELECT '2019' as year,
       CORR("gdp_per_capita", "score") as correlation_coefficient
FROM happiness2019
WHERE "gdp_per_capita" IS NOT NULL AND "score" IS NOT NULL;

--- ponieważ nic się nie zmieniło sprawdźmy, czy obie kolumny mają różne wartości

SELECT COUNT(DISTINCT "gdp_per_capita") as distinct_gdp, COUNT(DISTINCT "score") as distinct_score
FROM happiness2018;

SELECT COUNT(DISTINCT "gdp_per_capita") as distinct_gdp, COUNT(DISTINCT "score") as distinct_score
FROM happiness2019;

-- ponieważ kolumny mają tylko jedną wartość nie możemy obliczyć korelacji
--- Aby zbadać korelację pomiędzy PKB a poziomem szczęścia, użyliśmy korelacji Pearsona, gdzie wartość +1 oznacza pełną dodatnią korelację, 0 brak korelacji, a -1 pełną negatywną korelację.
---Wpływ wsparcia społecznego na szczęście:
SELECT 
    year,
    CORR("family", "happiness_score") AS social_support_correlation
FROM happinessallyears
GROUP BY year;
--- Wpływ wolności i korupcji na szczęście:
SELECT 
    year,
    CORR("freedom_to_make_life_choices", "happiness_score") AS freedom_correlation,
    CORR("perceptions_of_corruption", "happiness_score") AS corruption_correlation
FROM happinessallyears
GROUP BY year;
--- w/w zapytaniem otrzymalismy wyniki korelacji jako NULL dla kolumn "freedom_to_make_life_choices" i "perceptions_of_corruption", może to oznaczać, że w tych kolumnach istnieją brakujące lub nieprawidłowe dane. Korelacja może być obliczana tylko na podstawie danych liczbowych, a brakujące lub nieprawidłowe dane mogą wpłynąć na wyniki.
--- Sprawdzamy, czy w kolumnach "freedom_to_make_life_choices" i "perceptions_of_corruption" nie ma brakujących danych lub wartości niebędących liczbami. 

SELECT year, COUNT(*) AS missing_values
FROM happinessallyears
WHERE "freedom_to_make_life_choices" IS NULL OR "perceptions_of_corruption" IS NULL
GROUP BY year;

--- Zmiany w Rankingach Kraju:
---Badanie, które kraje poprawiły swoją pozycję w rankingu, a które spadły, i zastanowienie się nad możliwymi przyczynami.
---Hipoteza: "Kraje, które wprowadziły reformy społeczne, ekonomiczne lub polityczne, widzą znaczącą poprawę w swoich rankingach szczęścia."

SELECT 
    year,
    "happinessallyears"."country",
    "happinessallyears"."happiness_rank",
    LAG("happinessallyears"."happiness_rank") OVER (PARTITION BY "happinessallyears"."country" ORDER BY year) AS previous_rank,
    "happinessallyears"."happiness_rank" - LAG("happinessallyears"."happiness_rank") OVER (PARTITION BY "happinessallyears"."country" ORDER BY year) AS rank_change
FROM "happinessallyears"
ORDER BY "happinessallyears"."country", year;

-- Trend globalnego poziomu szczęścia na przestrzeni lat
SELECT 
    year,
    AVG("happiness_score") AS avg_happiness
FROM happinessallyears
GROUP BY year
ORDER BY year;

-- Średni poziom szczęścia w poszczególnych regionach w danym roku
SELECT 
    year,
    "region",
    AVG("happiness_score") AS avg_happiness_by_region
FROM happinessallyears
GROUP BY year, "region"
ORDER BY year, avg_happiness_by_region DESC;

-- Korelacja między poziomem szczęścia a GDP per Capita
SELECT 
    year,
    CORR("happiness_score", "economy_gdp_per_capita") AS gdp_correlation
FROM happinessallyears
GROUP BY year;

-- Korelacja między poziomem szczęścia a wsparciem społecznym (family)
SELECT 
    year,
    CORR("happiness_score", "family") AS family_correlation
FROM happinessallyears
GROUP BY year;

-- Korelacja między poziomem szczęścia a wolnością wyboru (freedom) i postrzeganą korupcją (trust_government_corruption)
SELECT 
    year,
    CORR("happiness_score", "freedom") AS freedom_correlation,
    CORR("happiness_score", "trust_government_corruption") AS corruption_correlation
FROM happinessallyears
GROUP BY year;

---Porównanie regionów:
SELECT
    "region",
    AVG("happiness_score") AS average_happiness
FROM
    happinessallyears
GROUP BY
    "region"
ORDER BY
    average_happiness DESC;

   --- Skala zmian w czasie
SELECT
    "country",
    year,
    "happiness_score",
    LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS previous_year_score,
    "happiness_score" - LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS score_change
FROM
    happinessallyears
ORDER BY
    "country", year;







  
  












