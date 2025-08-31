/*
What are the top skills by salary in data analysis?
We want the average salary for each skill required for a data analysis position
*/

SELECT *
FROM (
SELECT
    skills_dim.skills,
    job_postings_fact.job_title_short,
    COUNT(job_postings_fact.job_title_short) AS job_count,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM skills_dim
LEFT JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
LEFT JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills,
    job_postings_fact.job_title_short
ORDER BY avg_salary DESC
) AS subquery
WHERE
    job_count > 5

/*
SELECT *
FROM skills_dim
LIMIT 10
*/