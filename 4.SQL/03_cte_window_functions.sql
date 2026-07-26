-- Rank countries by average AI adoption.

WITH country_adoption AS (

    SELECT
        c.country_name,
        AVG(f.ai_adoption_rate) AS average_ai_adoption

    FROM workforce.fact_workforce_ai_index f

    INNER JOIN workforce.dim_country c
    ON f.country_id = c.country_id

    GROUP BY c.country_name
)

SELECT
    country_name,
    ROUND(average_ai_adoption::numeric,2) AS average_ai_adoption,
    RANK() OVER(ORDER BY average_ai_adoption DESC) AS country_rank

FROM country_adoption;





-- Top 5 countries with the highest AI adoption.

WITH country_adoption AS (

    SELECT
        c.country_name,
        AVG(f.ai_adoption_rate) AS average_ai_adoption

    FROM workforce.fact_workforce_ai_index f

    INNER JOIN workforce.dim_country c
    ON f.country_id = c.country_id

    GROUP BY c.country_name
)

SELECT *

FROM country_adoption

ORDER BY average_ai_adoption DESC

LIMIT 5;


-- Rank industries by total jobs displaced.

SELECT

    i.industry_name,

    SUM(f.jobs_displaced_count) AS total_jobs_displaced,

    RANK() OVER(
        ORDER BY SUM(f.jobs_displaced_count) DESC
    ) AS industry_rank

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_industry i
ON f.industry_id = i.industry_id

GROUP BY i.industry_name;