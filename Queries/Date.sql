SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_timezone,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
LIMIT 5;


-- EXTRACT function example

SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_count DESC;




-- PROBLEM 1:
/*
Create Tables from Other Tables 
Question: 
Create three tables: 
            Jan 2023 jobs 
            Feb 2023 jobs 
            Mar 2023 jobs 
Foreshadowing: This will be used in another practice problem below. 
Hints: 
Use CREATE TABLE table_name AS syntax to create your table 
Look at a way to filter out only specific months (EXTRACT)
*/

-- Create table for jobs posted in January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- Create table for jobs posted in February
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- Create table for jobs posted in March
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT job_posted_date
FROM march_jobs;