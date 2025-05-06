-- Union first example

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs



-- Practice Problem
/*
Find the jobs postings from the first quarter that have salary greater than $70k
- Combine job postings table from the first quarter of 2023 (jan-mar)
- Gets job postings with an average yearly salary > $70,000
*/

SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date :: DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
)
WHERE  
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC