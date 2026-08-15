/*
Question:
How does salary differ between remote and non-remote Data Engineering jobs?

Description:
Compare the salary distribution of remote and non-remote Data Engineering
positions using jobs with reported annual salaries. Analyze whether remote
positions tend to offer higher or lower compensation and identify any
meaningful differences between the two groups.
*/


select jpf.job_work_from_home as remote_status, 
round(median(jpf.salary_year_avg), 0) as median_salary, 
count(jpf.*) as job_count
from job_postings_fact jpf
where jpf.job_title_short = 'Data Engineer' and jpf.salary_year_avg is not null
group by jpf.job_work_from_home
order by median_salary desc;


┌───────────────┬───────────────┬───────────┐
│ remote_status │ median_salary │ job_count │
│    boolean    │    double     │   int64   │
├───────────────┼───────────────┼───────────┤
│ true          │      135000.0 │      1576 │
│ false         │      130000.0 │      8975 │
└───────────────┴───────────────┴───────────┘


/*
Conclusion:

Among Data Engineer job postings with reported annual salaries, remote
positions have a higher median salary than non-remote positions. The median
salary for remote positions is $135,000, compared with $130,000 for
non-remote positions, a difference of $5,000 (approximately 3.85%).

However, the non-remote group contains substantially more observations
(8,975 vs. 1,576), and the analysis shows an association rather than proving
that remote work causes higher salaries.
*/
