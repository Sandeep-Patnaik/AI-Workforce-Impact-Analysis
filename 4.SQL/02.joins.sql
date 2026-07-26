--What is the average AI adoption rate for each country?
SELECT
    c.country_name,
    ROUND(AVG(f.ai_adoption_rate)::numeric,2) AS average_ai_adoption

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_country c
ON f.country_id = c.country_id

GROUP BY c.country_name

ORDER BY average_ai_adoption DESC;





-- Which industries have the highest average AI adoption?

SELECT
    i.industry_name,
    ROUND(AVG(f.ai_adoption_rate)::numeric,2) AS average_ai_adoption

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_industry i
ON f.industry_id = i.industry_id

GROUP BY i.industry_name

ORDER BY average_ai_adoption DESC;


-- Which skill categories have the highest AI adoption?

SELECT
    s.skill_category_name,
    ROUND(AVG(f.ai_adoption_rate)::numeric,2) AS average_ai_adoption

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_skill_category s
ON f.skill_category_id = s.skill_category_id

GROUP BY s.skill_category_name

ORDER BY average_ai_adoption DESC;





-- Which industries created the most jobs?

SELECT
    i.industry_name,
    SUM(f.jobs_created_count) AS total_jobs_created

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_industry i
ON f.industry_id = i.industry_id

GROUP BY i.industry_name

ORDER BY total_jobs_created DESC;



-- Compare AI adoption before and after the Generative AI era.

SELECT
    CASE
        WHEN d.generative_ai_era = TRUE THEN 'After GenAI'
        ELSE 'Before GenAI'
    END AS period,

    ROUND(AVG(f.ai_adoption_rate)::numeric,2) AS average_ai_adoption

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_date d
ON f.date_id = d.date_id

GROUP BY d.generative_ai_era;


-- Show country, industry, skill category and AI metrics together.

SELECT
    c.country_name,
    i.industry_name,
    s.skill_category_name,
    f.ai_adoption_rate,
    f.jobs_created_count,
    f.jobs_displaced_count

FROM workforce.fact_workforce_ai_index f

INNER JOIN workforce.dim_country c
ON f.country_id = c.country_id

INNER JOIN workforce.dim_industry i
ON f.industry_id = i.industry_id

INNER JOIN workforce.dim_skill_category s
ON f.skill_category_id = s.skill_category_id

LIMIT 20;





