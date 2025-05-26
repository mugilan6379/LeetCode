# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from 
    (select 
    num, 
    Lag(num,2) over (order by id) as prev2,
    Lag(num,1) over (order by id) as prev1
    from Logs) as new_Logs
where num=prev2 and num=prev1