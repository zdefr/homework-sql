--1
select ssn,name,salary
from department as d,employee as e
where d.mgr_ssn=e.ssn;

--2
select distinct e.ssn,e.name
from hourlog as h,employee as e
where hours>100 and h.ssn=e.ssn;

--3
with procount(ssn,count) as
	(select ssn,count(pno)
	 from hourlog as h
	 group by ssn)
select e.ssn,e.name
from procount as p,employee as e
where p.count>1 and p.ssn=e.ssn;

--4
select ssn,name
from  (	(select ssn
	from employee) 
	except 
	(select ssn
	from hourlog
	group by ssn) ) as e natural join employee;

--5
select distinct e.ssn,e.name
from employee as e,hourlog as h
where e.ssn=h.ssn and h.pno in(	select pno
				from employee as e,hourlog as h
				where e.name='Singh' and e.ssn=h.ssn);

--6
select ssn,name
from employee as e
where not exists (
(select pno
from project as p
where p.dno=e.dno) 
except
(select pno
from hourlog as h
where h.ssn=e.ssn));