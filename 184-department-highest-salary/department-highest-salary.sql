# Write your MySQL query statement below
-- select d.name as Department, e.name as Employee, max(e.salary ) as Salary
-- from Employee e
-- join Department d 
-- on e.departmentId=d.id
-- group by e.departmentId
-- (select max(salary) as salary
-- from Employee)
with maxSalary as (select departmentId, max(salary) as salary
from employee
group by departmentId)
select d.name as Department, e.name as Employee,e.salary
from employee e
join maxSalary m 
    on m.departmentId=e.departmentId and e.salary=m.salary
join Department d
    on e.departmentId=d.id