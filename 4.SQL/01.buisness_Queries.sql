SELECT 'Country' AS table_name, COUNT(*) AS total_records
FROM workforce.dim_country

UNION ALL

SELECT 'Industry', COUNT(*)
FROM workforce.dim_industry

UNION ALL

SELECT 'Skill Category', COUNT(*)
FROM workforce.dim_skill_category

UNION ALL

SELECT 'Date', COUNT(*)
FROM workforce.dim_date

UNION ALL

SELECT 'Fact Table', COUNT(*)
FROM workforce.fact_workforce_ai_index;






--Displaying all contries 

SELECT
    country_name,
    region,
    development_tier
FROM workforce.dim_country;



--developed countries only
SELECT
    country_name,
    region
FROM workforce.dim_country
WHERE development_tier = 'Developed';


--Top COuntries by GDP
SELECT
    country_name,
    gdp_per_capita_usd
FROM workforce.dim_country
ORDER BY gdp_per_capita_usd DESC;






--Top 10 richest countries 
select
    country_name,
    gdp_per_capita_usd
FROM workforce.dim_country
ORDER BY gdp_per_capita_usd DESC
LIMIT 10;





--AVG AI adoption 
SELECT
    ROUND(AVG(ai_adoption_rate)::numeric, 2) AS average_ai_adoption
FROM workforce.fact_workforce_ai_index;




--How many jobs have been created and displaced?


SELECT
    SUM(jobs_created_count) AS total_jobs_created,
    SUM(jobs_displaced_count) AS total_jobs_displaced
FROM workforce.fact_workforce_ai_index;






--DISPLACEMENT RISK BY SKILL

SELECT
    s.skill_category_name,
    ROUND(AVG(f.displacement_risk_index)::numeric,2) AS average_risk
FROM workforce.fact_workforce_ai_index f
JOIN workforce.dim_skill_category s
ON f.skill_category_id = s.skill_category_id
GROUP BY s.skill_category_name
ORDER BY average_risk DESC;




--RESKILLING INVESTMENT BY SKILL
SELECT
    s.skill_category_name,
    ROUND(AVG(f.reskilling_investment_usd)::numeric,2) AS average_investment
FROM workforce.fact_workforce_ai_index f
JOIN workforce.dim_skill_category s
ON f.skill_category_id = s.skill_category_id
GROUP BY s.skill_category_name
ORDER BY average_investment DESC;




--JOB DISPLACEMENT BY COUNTRY

SELECT
    c.country_name,
    SUM(f.jobs_displaced_count) AS total_jobs_displaced
FROM workforce.fact_workforce_ai_index f
JOIN workforce.dim_country c
ON f.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_jobs_displaced DESC;


--TOP AI ADOPTION COUNTRIES
SELECT
    c.country_name,
    ROUND(AVG(f.ai_adoption_rate)::numeric,2) AS average_ai_adoption
FROM workforce.fact_workforce_ai_index f
JOIN workforce.dim_country c
ON f.country_id = c.country_id
GROUP BY c.country_name
ORDER BY average_ai_adoption DESC;