# Write your MySQL query statement below
select Users.name, COALESCE(rid.travelled_distance,0) as travelled_distance
from Users
left join (select user_id, sum(distance) as travelled_distance
from Rides
group by user_id
) as rid
on Users.id = rid.user_id
order by travelled_distance desc,name asc
