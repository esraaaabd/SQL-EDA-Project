/*
Question:
Which job titles are most likely to have no degree requirement?

Description:
Analyze the degree requirements across different job titles using the
available job posting information. Determine which roles have the highest
proportion of postings that do not explicitly mention a degree requirement.
*/

select cd.name as company_name, count(*) as total_postings_no_degree_required
from job_postings_fact jpf
join company_dim cd on jpf.company_id = cd.company_id
where jpf.job_no_degree_mention=true
group by cd.name
order by total_postings_no_degree_required desc
limit 10;

┌───────────────────────────┬───────────────────────────────────┐
│       company_name        │ total_postings_no_degree_required │
│          varchar          │               int64               │
├───────────────────────────┼───────────────────────────────────┤
│ beBee Careers             │                             16245 │
│ Emprego                   │                              3039 │
│ Listopro                  │                              2675 │
│ Dice                      │                              2286 │
│ Amazon                    │                              2164 │
│ Insight Global            │                              2038 │
│ Tata Consultancy Services │                              1915 │
│ Robert Half               │                              1906 │
│ Harnham                   │                              1870 │
│ Jobs via Dice             │                              1496 │
└───────────────────────────┴───────────────────────────────────┘
  10 rows                                             2 columns

/*
Conclusion:

beBee Careers has the highest number of job postings that do not mention
a degree requirement, with 16,245 postings. Emprego and Listopro follow
with 3,039 and 2,675 postings, respectively.

This indicates that these companies have the largest volume of job postings
in the dataset where a degree requirement is not mentioned. However, the
absence of a degree requirement mention does not necessarily mean that a
degree is not required, as the dataset only captures whether the posting
explicitly mentions a degree requirement.
*/