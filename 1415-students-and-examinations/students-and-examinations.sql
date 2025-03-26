-- # Write your MySQL query statement below
-- select s.student_id,s.student_name, exam.subject_name
-- from Students as s
-- left join Examinations as exam
-- on s.student_id = exam.student_id
-- group by s.student_id, exam.subject_name
-- order by s.student_id, exam.subject_name asc

select s.student_id ,s.student_name,sub.subject_name,COALESCE(exam.attended_exams, 0) AS attended_exams
from Students as s
cross join Subjects as sub
left join 
(select student_id,subject_name, count(*) as attended_exams
from Examinations
group by student_id,subject_name) as exam
on s.student_id = exam.student_id and sub.subject_name = exam.subject_name
order by s.student_id ,sub.subject_name asc