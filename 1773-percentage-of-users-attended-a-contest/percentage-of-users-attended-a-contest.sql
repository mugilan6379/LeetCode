select r.contest_id,Round(count(distinct r.user_id)*100/count(distinct u.user_id),2) as percentage
from Register r
cross join Users u
group by r.contest_id
order by percentage desc, contest_id asc