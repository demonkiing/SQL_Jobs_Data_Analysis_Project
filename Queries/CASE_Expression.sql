/*
Lable new columns as follows:
-    'Anywhere' jobs as 'Remote'
-    'New York, NY' jobs as 'Local'
-    Otherwise 'Onsite'
*/

SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_catagory
FROM
    job_postings_fact;


-- Sorting number of jobs by location category where job_title_short is 'Data Analyst'

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_catagory
FROM
    job_postings_fact

WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    location_catagory
ORDER BY
    number_of_jobs DESC;