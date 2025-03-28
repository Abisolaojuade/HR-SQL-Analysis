Select * from `HR data`;
Rename table `Hr data` to HR_data;

Select * from HR_Data;

-- Rename column ï»¿id to ID
Alter table Hr_data
Rename column `ï»¿id` to ID;

Alter table HR_data
rename column customer_id to ID;

Set SQL_SAFE_UPDATES = 0;
Update Hr_data
set Birthdate = replace (birthdate, "-", "/");


Update Hr_data
set birthdate = str_to_date(birthdate, "%m/%d/%Y");

Update hr_data
Set Birthdate = date_sub(birthdate, interval 100 year)
where year(birthdate) >2002;


Set SQL_SAFE_UPDATES = 0;
Update Hr_data
set Hire_date = replace (Hire_date, "-", "/");

Update Hr_data
set Hire_date = str_to_date(Hire_date, "%m/%d/%Y");

-- 1. What is the gender breakdown in the Company? 
Select gender, count(gender) as Count_of_gender from Hr_data
group by gender;

-- 2. How many employees work remotely for each department? 
Select department, Count(location)as No_of_employee from HR_data
where Location = "Remote"
Group by Department
order by No_of_employee desc;

-- 3. What is the distribution of employees who work remotely and HQ 
Select location, Count(location) as Location_count from HR_data
group by Location;

-- 4. What is the race distribution in the Company? 
Select race, count(race) as Race_distribution from HR_data
Group by race;

-- 5. What is the distribution of employee across different states? 
Select location_state, count(ID) from HR_data
group by Location_state;

-- 6. What is the number of employees whose employment has been terminated 
Select count(date(termdate)) as Terminated_employees  from HR_data
where date (termdate) <= current_date ;

-- 7. Who is/are the longest serving employee in the organization. 
Select first_name, last_name, hire_date from hr_data
order by hire_date asc;
select concat_ws("-", first_name, last_name) as full_name, hire_date from hr_data
order by hire_date asc;
alter table hr_data
add column fullnamme text;

-- 8. Return the terminated employees by their race 
select race, count(termdate) as count from Hr_data
where date(Termdate) <= current_date()
group by race
order by count desc;

-- 9. What is the age distribution in the Company?
Alter table Hr_data
Add column Age int;

Update Hr_data
set age = ceiling(Datediff(Current_date(), Birthdate))/365;
Select min(age) as min, max(age) as max from Hr_data;

Select case 
when age <30 then "20-29"
when age < 40 then "30-39"
when age < 50 then "40-49"
else "50-59" end as age_group , count(*) as Age_distribution from hr_data
group by Age_group
order by age_Group;

-- 10. How have employee hire counts varied over time? 
Select year(hire_date) as year, Count(year(hire_date)) as count from HR_data
group by year
order by count;

-- Variation in employee hire count over time
select min(year(hire_date)) as min, max(year(hire_date)) as max from hr_data;

Select case 
when year (hire_date) <= 2005 then "2000-2005"
when year (hire_date) <= 2010 then "2006-2010"
when year (hire_date) <= 2015 then "2011-2015"
when year (hire_date) <= 2020 then "2016-2020"
end as Hire_year_group , count(*) as count_over_time from hr_data
group by Hire_year_group
order by count_over_time;


-- 11. What is the tenure distribution for each department? 

Alter table HR_Data
Add column tenure int;

Update HR_data
set tenure = datediff(Current_date(), Hire_date)/365
Where termdate = "";

Select department, Round(avg(datediff(current_date(), hire_date)/365),1) as avg_Tenure_year from HR_data
 Group by department
 order by Avg_tenure_year desc;

Select * from hr_data; 
-- 12. What is the average length of employment in the company? 
Select Ceiling(Avg(datediff(Current_date(), Hire_date)/365)) as Avg_Length_Employment from HR_data; 

-- 13. Which department has the highest turnover rate? 
