# Introduction
🚀 Unlock the Data-Driven Job Market! This project delves into the world of data analyst roles, uncovering 💼 top-paying jobs, 🌟 must-have skills, and 🌍 the sweet spot where high demand meets high salary in data analytics.

Check the SQL queries out here: [project_sql folder](/project_sql/)

# Background
This project emerged from a passion for making the data analyst job market easier to navigate. The goal? To uncover the highest-paying roles and pinpoint the most in-demand skills, saving others the effort of manually sifting through job listings.

The data, sourced from [Luke Barousse](https://github.com/lukebarousse)'s [SQL course](https://www.lukebarousse.com/sql), offers a wealth of insights into job titles, salaries, locations, and key skills.

### 🔍 Key Questions Explored:

1. Which data analyst jobs offer the highest salaries?

2. What skills are essential for these top-paying positions?

3. Which skills are most in demand in the field of data analytics?

4. What skills are linked to higher salaries?

5. Which skills should you focus on learning to maximize opportunities?

# Tools I Used
To explore the data analyst job market, I leveraged a range of powerful tools:

- **SQL:** The analytical backbone, enabling me to query the database and extract meaningful insights.

- **PostgreSQL:** A chosen database management system, perfect for handling and organizing job posting data.

- **Visual Studio Code:** A reliable workspace for managing the database and executing SQL queries efficiently.

- **Git & GitHub:** Crucial for version control and sharing my work, promoting collaboration and tracking project progress.

# Analysis
Every query in this project was crafted to explore a specific facet of the data analyst job market. Here’s how I tackled each question:

### 1. Top Paying Data Analyst Jobs💰
To pinpoint the most lucrative roles, I filtered data analyst positions based on average yearly salary and location, giving priority to remote jobs. This query shines a light on the top-paying opportunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE   
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
```
📊 Breakdown of Top Data Analyst Jobs in 2023:

- 💵 Wide Salary Range: The top 10 highest-paying data analyst roles offer salaries ranging from $184,000 to $650,000, highlighting the field’s impressive earning potential.

- 🌍 Diverse Employers: High-paying positions are offered by a variety of companies, including SmartAsset, Meta, and AT&T, indicating strong demand across industries.

- 📝 Job Title Variety: Roles range from Data Analyst to Director of Analytics, showcasing the wide spectrum of positions and specializations within data analytics.

![Top Paying Jobs](https://github.com/demonkiing/SQL_Jobs_Data_Analysis_Project/blob/main/assets/1_top_paying_jobs.png)

📊 Here’s a bar graph showcasing the top 10 highest-paying data analyst roles in 2023! 💼💰; Generated the graph using PowerBI and Photoshop.

 
### 2. Skills for Top Paying Jobs🛠️

To uncover the skills needed for high-paying roles, I merged job postings with skills data, offering valuable insights into the abilities employers prioritize for top-compensation positions.

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
🛠️ Most In-Demand Skills for Top Paying Data Analyst Jobs in 2023:

- **SQL** takes the lead with an impressive count of 8.

- **Python** follows closely with a solid count of 7.

- **Tableau** is also highly sought after, appearing in 6 job postings.

Other skills such as R, Snowflake, Pandas, and Excel show varying levels of demand across the top-paying roles.

![Top in-demand Roles](https://github.com/demonkiing/SQL_Jobs_Data_Analysis_Project/blob/main/assets/2_top_paying_job_skills.png)

📊 Here’s a bar graph visualizing the count of in-demand skills for the top 10 highest-paying data analyst jobs!; Generated the graph using PowerBI and Photoshop.

## 3. In-Demand Skills for Data Analysts🔍
This query highlighted the skills most commonly sought after in job postings, helping to pinpoint areas with the highest demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
| Skill    | Demand Count |
|:--------:|:------------:|
| SQL      |     7291     |
| Excel    |     4611     |
| Python   |     4330     |
| Tableau  |     3745     |
| Power BI |     2609     |

📊 Table of Demand for the Top 5 Skills in Data Analyst Job Postings


🔧 Breakdown of Most Demanded Skills for Data Analysts in 2023:

- **SQL** and **Excel** continue to be foundational, underscoring the importance of strong skills in data processing and spreadsheet management.

- **Programming** and **Visualization** Tools like **Python**, **Tableau**, and **Power BI** are essential, reflecting the growing need for technical expertise in data storytelling and decision-making support.


### 4. Skills Based on Salary💼
By analyzing the average salaries linked to various skills, I was able to identify which skills command the highest pay in data analyst roles.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

| Skill       | Average Salary ($) |
|:-----------:|:------------------:|
| PySpark     |      208,172      |
| Bitbucket   |      189,155      |
| Couchbase   |      160,515      |
| Watson      |      160,515      |
| DataRobot   |      155,486      |
| GitLab      |      154,500      |
| Swift       |      153,750      |
| Jupyter     |      152,777      |
| Pandas      |      151,821      |
| Elasticsearch |    145,000      |

💼 Table of Average Salaries for the Top 10 Paying Skills in Data Analytics


💡 Breakdown of Top Paying Skills for Data Analysts:

- **High Demand for Big Data & ML Skills:** Top salaries are driven by expertise in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), highlighting the industry’s strong demand for data processing and predictive modeling abilities.

- **Software Development & Deployment Proficiency:** Skills in development and deployment tools (GitLab, Kubernetes, Airflow) showcase the lucrative overlap between data analysis and engineering, with a premium placed on automation and efficient data pipeline management.

- **Cloud Computing Expertise:** Proficiency in cloud and data engineering tools (Elasticsearch, Databricks, GCP) reflects the growing importance of cloud-based analytics, suggesting that cloud expertise significantly enhances earning potential in data analytics.


### 5. Most Optimal Skills to Learn🎯
By combining insights from both demand and salary data, this query focused on identifying skills that are not only in high demand but also offer high earning potential, providing a strategic guide for skill development.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
| Skill ID | Skills     | Demand Count | Average Salary ($) |
|:--------:|:----------:|:------------:|:------------------:|
|    8     | Go         |     27       |      115,320      |
|   234    | Confluence |     11       |      114,210      |
|   97     | Hadoop     |     22       |      113,193      |
|   80     | Snowflake  |     37       |      112,948      |
|   74     | Azure      |     34       |      111,225      |
|   77     | BigQuery   |     13       |      109,654      |
|   76     | AWS        |     32       |      108,317      |
|    4     | Java       |     17       |      106,906      |
|   194    | SSIS       |     12       |      106,683      |
|   233    | Jira       |     20       |      104,918      |

📊 Table of Most Optimal Skills for Data Analysts Sorted by Salary.


💡 Here’s a breakdown of the most optimal skills for Data Analysts in 2023:

- **High-Demand Programming Languages:** Python and R lead in demand with 236 and 148 demand counts respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating their widespread availability and strong market value.

- **Cloud Tools and Technologies:** Skills in cloud technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand along with high average salaries, reflecting the increasing importance of cloud platforms and big data tools in data analysis.

- **Business Intelligence & Visualization Tools:** Tools like Tableau and Looker, with demand counts of 230 and 49 respectively, have average salaries of $99,288 and $103,795, emphasizing the growing role of data visualization and business intelligence in decision-making.

- **Database Technologies:** Demand for traditional and NoSQL database skills (Oracle, SQL Server, NoSQL) remains high, with average salaries ranging from $97,786 to $104,534, underscoring the ongoing need for expertise in data storage, retrieval, and management.

# Learnings

### 🚀 SQL Skillset Upgraded

Throughout this journey, I’ve supercharged my SQL toolkit with some powerful techniques:

- 🧩 **Advanced Query Mastery:** Mastered complex SQL queries, effortlessly merging tables and using WITH clauses for smooth temp table operations.
- 📊 **Data Aggregation Pro:** Got hands-on with GROUP BY, transforming aggregate functions like COUNT() and AVG() into my go-to data summarizers.
- 💡 **Analytical Expertise:** Enhanced my ability to solve real-world challenges by crafting actionable, insightful SQL queries from complex questions.

# Conclusion

### Insights

From the analysis, several key takeaways emerged:

- **Top-Paying Data Analyst Jobs:** The highest-paying remote data analyst roles offer a broad salary range, with the highest reaching an impressive $650,000! 💰

- **Skills for Top-Paying Jobs:** Advanced proficiency in SQL is essential for landing high-paying roles, making it a crucial skill for those aiming for top salaries. 📈

- **Most In-Demand Skills:** SQL stands out as the most requested skill in the data analyst job market, solidifying its importance for job seekers. 🔍

- **Skills Linked to Higher Salaries:** Specialized skills like SVN and Solidity are associated with the highest average salaries, highlighting the value of niche expertise. 🧠

- **Optimal Skills for Market Value:** SQL leads in both demand and salary, making it one of the most valuable skills for data analysts to learn in order to maximize their market potential. 🎯

### Closing Thoughts

This project not only sharpened my SQL skills but also provided invaluable insights into the data analyst job market. The analysis serves as a roadmap for prioritizing skill development and job search strategies. 🚀 Aspiring data analysts can improve their position in the competitive job market by focusing on high-demand, high-paying skills. 💡 This exploration underscores the importance of ongoing learning and staying ahead of emerging trends in data analytics. 🔄