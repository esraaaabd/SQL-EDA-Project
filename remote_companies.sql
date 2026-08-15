/*
Question:
Which companies offer the most remote job opportunities?

Description:
Identify the companies with the highest number of job postings that allow
employees to work from home. This analysis will help determine which
companies have the strongest presence in the remote job market.
*/

select cd.name as company_name, count(*) as remote_work
from company_dim cd LEFT JOIN job_postings_fact jpf ON jpf.company_id = cd.company_id
where jpf.job_work_from_home = true
group by cd.name
ORDER BY remote_work DESC
limit 10;

┌─────────────────────────────────────────┬─────────────┐
│              company_name               │ remote_work │
│                 varchar                 │    int64    │
├─────────────────────────────────────────┼─────────────┤
│ Listopro                                │        4445 │
│ Dice                                    │        3470 │
│ Upwork                                  │        2577 │
│ Get It Recruit - Information Technology │        1516 │
│ EPAM Systems                            │        1081 │
│ Crossover                               │         669 │
│ Harnham                                 │         582 │
│ Insight Global                          │         527 │
│ TELUS International AI Data Solutions   │         470 │
│ Turing                                  │         408 │
└─────────────────────────────────────────┴─────────────┘
  10 rows                                     2 columns


/*
Conclusion:

Listopro has the highest number of remote job postings in the dataset,
with 4,445 remote opportunities, followed by Dice with 3,470 and Upwork
with 2,577.

These companies have the largest volume of remote job postings among the
companies analyzed. However, this measures the total number of remote
postings, not the proportion of each company's jobs that are remote.
*/