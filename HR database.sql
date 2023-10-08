select * from hrdata

--KPIs
--Sum of Employees

select sum(employee_count) as employee_count from hrdata
--where education = 'High School'
--where department = 'Sales'
where education_field  = 'Medical'

--Attrition Count

select count(attrition) as Attrition_count from hrdata
where attrition = 1 and  education = 'Doctoral Degree'

--Attrition rate

select round((select count(attrition) from hrdata where attrition = 1 and  department = 'Sales')/
sum(employee_count))*100, 2) from hrdata
where department = 'Sales'

--==Active Employee

select sum(employee_count) - (select count(attrition) from hrdata where attrition = 1 and gender = 'Male')
from hrdata where gender = 'Male'

--Average Age

select round(avg(age),0) as Average_age from hrdata

-- attrition by gender
select gender, count(attrition) from hrdata
where attrition = 1  and education = 'High School'
group by gender
order by count(attrition) desc


--attrition by department
select department, count(attrition) ,
round((cast(count(attrition) as numeric)/(select count(attrition) from hrdata where attrition = 1))*100, 0)
from hrdata
where attrition = 1
group by department
order by count(attrition) desc 

--emploeyee count by age
select age, sum(employee_count) from hrdata
group by age
order by age

--attrition by education
select education_field, count(attrition) from hrdata
where attrition = 1
group by education_field
order by count(attrition) desc

--attrition by age
select age_band,gender, count(attrition),round((cast(count(attrition) as numeric)/(select count(attrition) from hrdata where attrition = 1))*100,2) as pct
from hrdata
where attrition = 1
group by age_band, gender
order by age_band,gender  

--Employee number by age band
select age_band, gender, sum(employee_count) from  hrdata
group by age_band, gender
order by age_band, gender desc







