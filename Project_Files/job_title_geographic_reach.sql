/*
Question:
Which job titles are available across the largest number of different locations?

Description:
Analyze the geographic reach of different job titles by measuring how many
distinct locations each job title appears in. Identify the job titles that
have the broadest presence across the job market.
*/

describe job_postings_fact;
┌──────────────────────────────────────────┐
│            job_postings_fact             │
│                                          │
│ job_id                integer   not null │
│ company_id            integer            │
│ job_title_short       varchar            │
│ job_title             varchar            │
│ job_location          varchar            │
│ job_via               varchar            │
│ job_schedule_type     varchar            │
│ job_work_from_home    boolean            │
│ search_location       varchar            │
│ job_posted_date       timestamp          │
│ job_no_degree_mention boolean            │
│ job_health_insurance  boolean            │
│ job_country           varchar            │
│ salary_rate           varchar            │
│ salary_year_avg       double             │
│ salary_hour_avg       double             │
└──────────────────────────────────────────┘


select job_title_short, count(distinct job_location) as location_count
from job_postings_fact GROUP BY job_title_short
ORDER BY location_count DESC
limit 10;


┌───────────────────────────┬────────────────┐
│      job_title_short      │ location_count │
│          varchar          │     int64      │
├───────────────────────────┼────────────────┤
│ Data Analyst              │          14791 │
│ Data Engineer             │          13019 │
│ Data Scientist            │          12280 │
│ Business Analyst          │           6133 │
│ Senior Data Engineer      │           5877 │
│ Software Engineer         │           5229 │
│ Senior Data Scientist     │           4986 │
│ Senior Data Analyst       │           4253 │
│ Machine Learning Engineer │           3216 │
│ Cloud Engineer            │           3015 │
└───────────────────────────┴────────────────┘
  10 rows                          2 columns


/*
Conclusion:

Data Analyst roles have the broadest geographic reach in the dataset,
appearing across 14,791 distinct job locations. Data Engineer and Data
Scientist roles follow with 13,019 and 12,280 distinct locations,
respectively.

This suggests that Data Analyst roles have the widest geographic presence
among the job roles analyzed, while Data Engineering also shows a strong
and widespread presence across the job market.
*/