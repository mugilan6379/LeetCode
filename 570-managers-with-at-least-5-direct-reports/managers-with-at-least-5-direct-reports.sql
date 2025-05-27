with managerIDS as (
    select managerId
    from Employee
    group by managerID
    having  count(managerID)>4
)
select e.name
from Employee as e
join managerIDS as m
where m.managerId=e.id