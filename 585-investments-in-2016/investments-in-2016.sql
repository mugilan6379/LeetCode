# Write your MySQL query statement below
with tiv2015_check as (
    select tiv_2015
    from Insurance
    group by tiv_2015
    having count(tiv_2015)>1
),
location_check as (
    select lat,lon
    from Insurance 
    group by lat, lon
    having count(*) = 1
)
select Round(sum(tiv_2016),2) as tiv_2016
from Insurance 
where tiv_2015 in (select tiv_2015 from tiv2015_check) and 
        (lat,lon) in (select lat,lon from location_check)