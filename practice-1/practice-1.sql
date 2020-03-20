#1
select title 
from course 
where credits=3;


select distinct takes.ID
from takes,teaches,instructor
where instructor.name='Einstein' and teaches.ID=instructor.ID and teaches.course_id=takes.course_id and teaches.sec_id=takes.sec_id and teaches.semester=takes.semester and teaches.year=takes.year;


select max(salary)
from instructor;


select ID,name
from instructor
where salary in(
select max(salary)
from instructor
);


select course_id,sec_id,count(id)
from section natural join takes
group by course_id,sec_id,semester,year
having semester='Fall' and year=2009;


select max(count)
from(select count(id)
from section natural join takes
group by course_id,sec_id,semester,year
having semester='Fall' and year=2009) as c;


with mesofe(course_id,sec_id,count) as
(select course_id,sec_id,count(id)
from section natural join takes
group by course_id,sec_id,semester,year
having semester='Fall' and year=2009)
select course_id,sec_id
from mesofe
where count in(
select max(count)
from mesofe);


