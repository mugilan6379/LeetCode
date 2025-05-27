# Write your MySQL query statement below
-- with manager_table as (
--     select id 
--     from Employee
--     where managerId is null
-- ),
-- select distinct managerId as uniqueMID
-- from Employee
-- where managerId is not null;
with managerIDS as (select managerId
from Employee
group by managerID
having  count(managerID)>4)
select e.name
from Employee as e
join managerIDS as m
where m.managerId=e.id