  --- Skala zmian w czasie - modyfikacja 
   
WITH ChangeCalc AS (
    SELECT
        "country",
        year,
        "happiness_score",
        LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS previous_year_score,
        "happiness_score" - LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS score_change
    FROM
        happinessallyears
)

SELECT
    c."country",
    c.year,
    c."happiness_score",
    c.previous_year_score,
    c.score_change,
    CASE 
        WHEN c.previous_year_score != 0 THEN 
            ROUND(CAST((c.score_change / c.previous_year_score) * 100 AS numeric), 2) 
        ELSE 
            NULL 
    END AS percentage_change,
    AVG(c."happiness_score") OVER (PARTITION BY c."country" ORDER BY c.year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_average_3y,
    RANK() OVER (ORDER BY c.score_change DESC) AS rank_biggest_positive_change,
    RANK() OVER (ORDER BY c.score_change ASC) AS rank_biggest_negative_change
FROM
    ChangeCalc c
ORDER BY
    c."country", c.year;

--- Ten kod daje nam: Bezpośrednią zmianę w skali szczęścia od poprzedniego roku.
---Procentową zmianę w skali szczęścia od poprzedniego roku.
---Trzyletnią średnią ruchomą skali szczęścia.
---Ranking krajów według największej pozytywnej zmiany.
---Ranking krajów według największej negatywnej zmiany.
   
   --- Sortowanie według największych zmian w skali szczęścia:
WITH ChangeCalc AS (
    SELECT
        "country",
        year,
        "happiness_score",
        LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS previous_year_score,
        "happiness_score" - LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS score_change
    FROM
        happinessallyears
)

SELECT
    c."country",
    c.year,
    c."happiness_score",
    c.previous_year_score,
    c.score_change,
    CASE 
        WHEN c.previous_year_score != 0 THEN 
            ROUND(CAST((c.score_change / c.previous_year_score) * 100 AS numeric), 2) 
        ELSE 
            NULL 
    END AS percentage_change,
    AVG(c."happiness_score") OVER (PARTITION BY c."country" ORDER BY c.year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_average_3y,
    RANK() OVER (ORDER BY c.score_change DESC) AS rank_biggest_positive_change,
    RANK() OVER (ORDER BY c.score_change ASC) AS rank_biggest_negative_change
FROM
    ChangeCalc c
ORDER BY
    ABS(c.score_change) DESC, c."country", c.year;

--- Sortowanie według kierunku zmiany w skali szczęścia:
WITH ChangeCalc AS (
    SELECT
        "country",
        year,
        "happiness_score",
        LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS previous_year_score,
        "happiness_score" - LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS score_change
    FROM
        happinessallyears
)

SELECT
    c."country",
    c.year,
    c."happiness_score",
    c.previous_year_score,
    c.score_change,
    CASE 
        WHEN c.previous_year_score != 0 THEN 
            ROUND(CAST((c.score_change / c.previous_year_score) * 100 AS numeric), 2) 
        ELSE 
            NULL 
    END AS percentage_change,
    AVG(c."happiness_score") OVER (PARTITION BY c."country" ORDER BY c.year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_average_3y,
    RANK() OVER (ORDER BY c.score_change DESC) AS rank_biggest_positive_change,
    RANK() OVER (ORDER BY c.score_change ASC) AS rank_biggest_negative_change
FROM
    ChangeCalc c
ORDER BY
    SIGN(c.score_change) DESC, ABS(c.score_change) DESC, c."country", c.year;

--- Sortowanie według najwyższego wskaźnika szczęścia:
   
   WITH ChangeCalc AS (
    SELECT
        "country",
        year,
        "happiness_score",
        LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS previous_year_score,
        "happiness_score" - LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS score_change
    FROM
        happinessallyears
)

SELECT
    c."country",
    c.year,
    c."happiness_score",
    c.previous_year_score,
    c.score_change,
    CASE 
        WHEN c.previous_year_score != 0 THEN 
            ROUND(CAST((c.score_change / c.previous_year_score) * 100 AS numeric), 2) 
        ELSE 
            NULL 
    END AS percentage_change,
    AVG(c."happiness_score") OVER (PARTITION BY c."country" ORDER BY c.year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_average_3y,
    RANK() OVER (ORDER BY c.score_change DESC) AS rank_biggest_positive_change,
    RANK() OVER (ORDER BY c.score_change ASC) AS rank_biggest_negative_change
FROM
    ChangeCalc c
ORDER BY
    c."happiness_score" DESC, c."country", c.year;

----Te zapytania pokażą kraje z największym wzrostem i spadkiem wskaźnika szczęścia w ciągu wszystkich lat.
   
   WITH ChangeCalc AS (
    SELECT
        "country",
        year,
        "happiness_score",
        LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS previous_year_score,
        "happiness_score" - LAG("happiness_score") OVER (PARTITION BY "country" ORDER BY year) AS score_change
    FROM
        happinessallyears
)

, MaxIncreases AS (
    SELECT 
        "country", 
        MAX(score_change) AS max_increase
    FROM ChangeCalc
    GROUP BY "country"
    ORDER BY max_increase DESC
    LIMIT 5
)

, MaxDecreases AS (
    SELECT 
        "country", 
        MIN(score_change) AS max_decrease
    FROM ChangeCalc
    GROUP BY "country"
    ORDER BY max_decrease ASC
    LIMIT 5
)

SELECT 'Max Increase' AS AnalysisType, "country", max_increase AS Value FROM MaxIncreases
UNION ALL
SELECT 'Max Decrease' AS AnalysisType, "country", max_decrease AS Value FROM MaxDecreases;