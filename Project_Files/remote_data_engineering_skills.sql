/*
Question:
What skills are most commonly required for remote Data Engineering jobs?

Description:
Analyze the skills associated specifically with remote Data Engineering
job postings. Identify the skills that appear most frequently among these
opportunities to understand the technical requirements of remote Data
Engineering roles.
*/

select sd.skills as skill, count(*) as frequency 
from job_postings_fact jpf
inner join skills_job_dim sjd on jpf.job_id = sjd.job_id
inner join skills_dim sd on sjd.skill_id = sd.skill_id
where jpf.job_work_from_home = 'Yes' and jpf.job_title_short = 'Data Engineer'
group by sd.skills
order by frequency desc
limit 20;


┌────────────┬───────────┐
│   skill    │ frequency │
│  varchar   │   int64   │
├────────────┼───────────┤
│ sql        │     29221 │
│ python     │     28776 │
│ aws        │     17823 │
│ azure      │     14143 │
│ spark      │     12799 │
│ airflow    │      9996 │
│ snowflake  │      8639 │
│ databricks │      8183 │
│ java       │      7267 │
│ gcp        │      6446 │
│ kafka      │      6415 │
│ scala      │      6304 │
│ redshift   │      5737 │
│ hadoop     │      5447 │
│ pyspark    │      4898 │
│ git        │      4641 │
│ power bi   │      4600 │
│ nosql      │      4514 │
│ tableau    │      4402 │
│ docker     │      4316 │
└────────────┴───────────┘
  20 rows      2 columns

/*
Conclusion:
SQL and Python are the two most frequently required skills for remote Data
Engineering roles, followed by major cloud and data platforms such as AWS,
Azure, Spark, Airflow, Snowflake, and Databricks.

The results highlight that remote Data Engineering positions strongly favor
a combination of programming, SQL, cloud computing, data processing, and
workflow orchestration skills. Building a foundation in SQL and Python,
then developing expertise in cloud platforms and tools such as Spark and
Airflow, appears to align well with the technical requirements of remote
Data Engineering opportunities.
*/
  