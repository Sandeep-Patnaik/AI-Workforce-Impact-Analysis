-- Which country has the highest AI adoption within each region?

WITH regional_adoption AS (

    SELECT
        c.region,
        c.country_name,
        ROUND(AVG(f.ai_adoption_rate)::numeric,2) AS average_ai_adoption

    FROM workforce.fact_workforce_ai_index f

    INNER JOIN workforce.dim_country c
    ON f.country_id = c.country_id

    GROUP BY c.region, c.country_name

)

SELECT *

FROM (

    SELECT *,
           RANK() OVER(
               PARTITION BY region
               ORDER BY average_ai_adoption DESC
           ) AS rank

    FROM regional_adoption

) ranked

WHERE rank = 1;





-- Which industries gained the highest net jobs? (Jobs Created - Jobs Displaced)

SELECT

    i.industry_name,

    SUM(f.jobs_created_count) AS jobs_created,

    SUM(f.jobs_displaced_count) AS jobs_displaced,

    SUM(f.jobs_created_count) -
    SUM(f.jobs_displaced_count) AS net_jobs

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_industry i
ON f.industry_id = i.industry_id

GROUP BY i.industry_name

ORDER BY net_jobs DESC;





-- Which countries invested the most in workforce reskilling?

SELECT

    c.country_name,

    ROUND(SUM(f.reskilling_investment_usd)::numeric,2)
        AS total_reskilling_investment

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_country c
ON f.country_id = c.country_id

GROUP BY c.country_name

ORDER BY total_reskilling_investment DESC;