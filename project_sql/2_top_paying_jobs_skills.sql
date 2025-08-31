/*
What are the necessary skills for the top paying data analysis jobs?
We want the skills required for the top 10 remote data analysis jobs
*/

SELECT
    subquery.job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    skills_dim.skills,
    skills_dim.type
FROM (
    SELECT
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_location = 'Anywhere'
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
) AS subquery
LEFT JOIN skills_job_dim ON subquery.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_location = 'Anywhere'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    subquery.job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    skills_dim.skills,
    skills_dim.type
ORDER BY
    subquery.job_id ASC

/*
SELECT *
FROM skills_dim
LIMIT 10
*/