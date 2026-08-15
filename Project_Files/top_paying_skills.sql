/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/


select sd.skills as skill, round(median(jpf.salary_year_avg), 0) as median_salary, count(jpf.*) as skill_count
from job_postings_fact jpf
inner join skills_job_dim sjd on jpf.job_id = sjd.job_id
inner join skills_dim sd on sjd.skill_id = sd.skill_id
where jpf.job_work_from_home = 'Yes' and jpf.job_title_short = 'Data Engineer' and jpf.salary_year_avg is not null
group by sd.skills
having count(jpf.*) >= 10
order by median_salary desc
limit 25;


┌───────────────┬───────────────┬─────────────┐
│     skill     │ median_salary │ skill_count │
│    varchar    │    double     │    int64    │
├───────────────┼───────────────┼─────────────┤
│ rust          │      210000.0 │          23 │
│ terraform     │      184000.0 │         193 │
│ golang        │      184000.0 │          39 │
│ spring        │      175500.0 │          33 │
│ neo4j         │      170000.0 │          11 │
│ gdpr          │      169616.0 │          22 │
│ zoom          │      168438.0 │          12 │
│ graphql       │      167500.0 │          28 │
│ mongo         │      162250.0 │          14 │
│ c             │      151500.0 │          23 │
│ typescript    │      151000.0 │          39 │
│ kubernetes    │      150500.0 │         147 │
│ ruby          │      150000.0 │          48 │
│ node          │      150000.0 │          22 │
│ css           │      150000.0 │          13 │
│ airflow       │      150000.0 │         386 │
│ ruby on rails │      150000.0 │          10 │
│ redis         │      149000.0 │          17 │
│ ansible       │      148798.0 │          14 │
│ jupyter       │      147500.0 │          15 │
│ kafka         │      145000.0 │         292 │
│ spark         │      140000.0 │         503 │
│ git           │      140000.0 │         208 │
│ outlook       │      140000.0 │          11 │
│ go            │      140000.0 │         113 │
└───────────────┴───────────────┴─────────────┘
  25 rows                           3 columns

/*
Conclusion:
The results show that the highest-paying skills are not always the most
in-demand. Rust has the highest median salary at $210K, followed by
Terraform and Golang at $184K.

Among skills with stronger demand, Terraform, Airflow, Kafka, Spark, and
Kubernetes stand out for combining high median salaries with a meaningful
number of job postings.

Overall, specialized skills can offer higher compensation, but skills such
as Terraform, Airflow, Kafka, and Spark provide a stronger balance between
salary and market demand, making them more practical targets for skill
development.
*/  