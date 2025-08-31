/*
What are the most in demand skills for data analysis?
We want the top 5 required skills by demand
*/

SELECT
    skills_dim.skills,
    job_postings_fact.job_title_short,
    COUNT(skills_dim.skills) AS total_skill_count
FROM skills_dim
LEFT JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
LEFT JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills_dim.skills, job_postings_fact.job_title_short
ORDER BY total_skill_count DESC
LIMIT 5