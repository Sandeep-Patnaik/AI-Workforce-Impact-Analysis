# AI Workforce Impact Analysis

An end-to-end analytics project using Python, PostgreSQL, SQL, and Power BI to explore relationships between AI adoption and workforce indicators across countries, industries, skills, and years.

## Project objective
Explore the dataset's recorded values for:
- AI adoption rate and productivity impact
- Jobs created and displaced
- Displacement-risk index by skill category and industry
- Reskilling investment
- Country-level and time-based differences

This is an exploratory analytics project. The measures describe the dataset and should not be interpreted as proof that AI caused a particular employment outcome.

## Workflow
1. Business understanding
2. Data quality checks and cleaning
3. Exploratory analysis in Python
4. Relational modeling and business queries in PostgreSQL
5. Interactive dashboarding in Power BI

## Tools
- Python, Pandas, NumPy, Matplotlib, Seaborn
- PostgreSQL and SQL (joins, aggregations, CTEs, window functions)
- DBeaver
- Power BI

## Repository structure
- `2. Data/Raw/`: source CSV files used by the workflow
- `2. Data/Cleaned/`: cleaned CSV outputs
- `3.Python/`: data-quality, cleaning, and EDA notebooks
- `4.SQL/`: business queries and advanced analysis
- `5.Power Bi/`: dashboard files
- `6.Images/`: dashboard screenshots

## Questions explored
- How does recorded AI adoption vary by country and industry?
- Which skill categories have higher average displacement-risk scores in this dataset?
- How do recorded job-creation and job-displacement counts compare?
- How does reskilling investment vary by skill category?
- How do the indicators change across the dataset's time dimension?

## Data provenance and interpretation
The repository contains raw and cleaned CSVs, but the files and current project documentation do not establish a verifiable external source, collection method, or calculation methodology for the workforce measures. Until those details are documented, treat the dataset and resulting findings as **illustrative/exploratory**, not verified real-world employment statistics.

Before making substantive claims, document the original dataset URL or generation process, the meaning and units of each index, the observation period, and how country/industry records were sampled. In particular:
- A correlation or before/after comparison does not establish causation.
- Summed job counts are only meaningful if the records represent non-overlapping populations and periods.
- An average of an index is only interpretable when its scale and weighting are defined.
- The dashboard's “jobs created” and “jobs displaced” figures should not be presented as verified global totals without source validation.

## Reproducibility
Run the notebooks in `3.Python/` in sequence, load the cleaned dimension and fact tables into PostgreSQL using the schema expected by the SQL files, and connect Power BI to the resulting tables. Check the SQL table/column names against your database setup before running queries.

## Author
Sandeep Patnaik
