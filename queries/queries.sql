/*Ypallhloi kata epitheto*/
select *
from EMPLOYEE as e
order by e.surname

/*O ypallhlos me to megalytero score*/
select surname, name, specialization, sum(score) as max_score
from EMPLOYEE as e1, EVALUATION as ev1
where e1.SSN = ev1.SSN and ISNULL(e1.to_date)
group by e1.SSN
having sum(score) >= all (select sum(score)
			  from EVALUATION as ev2
			  group by ev2.SSN)


/*Ypallhloi me salary panw apo to meso mistho tou tmhmatos tous*/
select surname, name, from_date
from EMPLOYEE as e1, POSITION as p1, SALARY as s1
where e1.pid = p1.pid and p1.sal_id = s1.sal_id and ISNULL(e1.to_date) and s1.wage*s1.work_days > 
			(select avg(s.wage*s.work_days)
	 		 from EMPLOYEE as e2, POSITION as p, SALARY as s
	 		 where e2.pid = p.pid and p.sal_id = s.sal_id and p1.department = p.department
         		 group by p.department)


/*Miktes apodoxes olwn twn ypallhlwn ana etos*/
select year, sum(gross_year_earnings) as total_amount_spent
from AGGREGATED_FINANCIAL_DATA as afd
group by year

/*Adeies theseis ana tmhma*/
select department, count(is_empty) as empty_spots_no  
from POSITION as p
where p.is_empty > 0
group by p.department


/*Kathares apodoxes ana ypallhlo*/
select SSN, surname, name, (s.wage*s.work_days - s.tax - s.stamp - b.health_tax - b.pension_tax) as net_salary 
from EMPLOYEE as e, POSITION as p, SALARY as s, BENEFITS as b
where e.pid = p.pid and p.sal_id = s.sal_id and p.ben_id = b.ben_id and ISNULL(e.to_date)  

/*Arithmos meswn pou exoume aggelia gia mia thesi*/
select	pid, count(media_id)
from	RECRUITMENT_AD as r
group by pid

/*Ypallhloi me mistho katw apo 2000 kai score panw apo 300*/
select surname, name, specialization, education_level
from EMPLOYEE as e, EVALUATION as ev, POSITION as p, SALARY as s 
where e.pid = p.pid and e.SSN = ev.SSN and p.sal_id = s.sal_id and wage*work_days < 2500 and ISNULL(e.to_date)
group by e.SSN
having sum(score) >= 200


/*Polyteknoi*/
select surname, name, children_no , wage*work_days as salary
from EMPLOYEE as e, POSITION as p, SALARY as s
where e.pid = p.pid and s.sal_id = p.sal_id and e.children_no >= 3 and wage*work_days < 2000


/*Ypallhloi me grigori ekseliksh*/
select surname, name, from_date, sum(ev.score) as total_score
from EMPLOYEE as e, EVALUATION as ev
where e.SSN = ev.SSN 
group by e.SSN
having sum(ev.score) >= 200 
		and exists (select from_date
			from EMPLOYEE as e2
			where e.SSN = e2.SSN and from_date >= '2012-01-01')
