create view wage_stats as
	select department,avg(wage)
	from SALARY as s,POSITION as p 
	where s.sal_id = p.sal_id
	group by p.department



