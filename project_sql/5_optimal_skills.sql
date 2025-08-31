/*
What are the top skills by demand and salary for data analysts seeking remote work?
We want skills for remote data analysis positions
*/

SELECT
    skills_dim.skills,
    job_postings_fact.job_title_short,
    COUNT(skills_dim.skills) AS total_skill_count,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary
FROM skills_dim
LEFT JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
LEFT JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    AND
    job_postings_fact.job_location = 'Anywhere'
GROUP BY skills_dim.skills, job_postings_fact.job_title_short
ORDER BY
    total_skill_count DESC,
    avg_salary DESC

/*
SELECT *
FROM skills_dim
LIMIT 10
*/