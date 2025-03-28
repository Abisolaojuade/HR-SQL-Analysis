## HR SQL Analysis

![hr 111](https://github.com/user-attachments/assets/4f91b5a0-d6e5-4b2d-98b3-6783cbde29e3)


## Table of Contents

- [Introduction](#Introduction)
- [Dataset Overview](#Dataset-Overview)
- [Project Objective](#Project-Objective)
- [Data Cleaning and Transformation](#Data-Cleaning-and-Transformation)
- [Data Exploration and Insights](#Data-Exploration-and-Insights)
- [Recommendation](#Recommendation)
- [Conclusion](#Conclusion)

## INTRODUCTION
This HR Management Company relies on data to make an informed decisions and strategic workforce planning. 
In this dataset, SQL was used to query and analyze data as well as to uncover insights for the HR department.

## Dataset overview
The dataset includes the following columns:
- ID: Unique identifier for each employee.
- First name: Employee's first name.
- Last name: Employee's last name.
- Birthdate: Employee's date of birth.
- Gender: Employee's gender.
- Race: Employee's racial or ethnic identity.
- Department: Employee's department.
- Job title: Employee's job title or position.
- Location: Employee's work location (e.g., Remote, Headquarters).
- Hire date: Employee's hire date.
- Term date: Employee's termination date.
- Location city: City of employee's work location.
- Location  state: State of employee's work location.

## Project Objective
Analyze the HR dataset using SQL to answer key business questions and gain actionable insights.

- Business Questions
- Write SQL queries to address the following questions and uncover trends in the data:

1. What is the gender breakdown in the Company?
2. How many employees work remotely for each department? 
3. What is the distribution of employees who work remotely and HQ 
4. What is the race distribution in the Company?
5. What is the distribution of employee across different states?
6. What is the number of employees whose employment has been terminated?
7. Who is/are the longest serving employee in the organization?
8. Return the terminated employees by their race 
9. What is the age distribution in the Company?
10. How have employee hire counts varied over time? 
11. What is the tenure distribution for each department? 
12. What is the average length of employment in the company?

![Screenshot 2025-03-28 132427](https://github.com/user-attachments/assets/478ccee4-5331-498e-a943-d6f1b9b02243)


## Data Cleaning and Traansformation
- Step 1. Table Rename
-Renamed the original table HR data to HR_data for clarity and consistency
```sql
Rename table `Hr data` to HR_data;
```

- Step 2. Rename Columns
Rename column ï»¿id to ID
```sql
Alter table Hr_data
Rename column `ï»¿id` to ID;
```

- Rename column Customer id to ID
```sql
Alter table HR_data
rename column customer_id to ID;
```

- Step 3 Change Datatype 
Change Birthdate date format
```sql
Update Hr_data
set Birthdate = replace (birthdate, "-", "/");
Update Hr_data
set birthdate = str_to_date(birthdate, "%m/%d/%Y");
```
```sql
Update hr_data
Set Birthdate = date_sub(birthdate, interval 100 year)
where year(birthdate) >2002;
```
```sql
Update Hr_data
set Hire_date = replace (Hire_date, "-", "/");
```
```sql
Update Hr_data
set Hire_date = str_to_date(Hire_date, "%m/%d/%Y");
```

- Added new column Full Name
```sql
alter table hr_data
add column fullname text;
```
- Added new column Age 
```sql
Alter table Hr_data
Add column Age int;
```
```sql
Update Hr_data
set age = ceiling (Datediff(Current_date(), Birthdate))/365;
```

- Added New Column Tenure
```sql
Alter table HR_Data
Add column tenure int;
```
```sqql
Update HR_data
set tenure = datediff(Current_date(), Hire_date)/365
Where termdate = "";
```

## Data Exploration and Insights
- Business Questions
1. What is the gender breakdown in the Company?
INSIGHTS: Female 11288, Male 10321, Non_confirming 605.

2. How many employees work remotely for each department?
INSIGHTS: Engineering department 1616, Accounting department 854, Human resources dept 467, Sales dept 467, Training 420, 
Business development 410, Service 407, Research Development 282, Support 230, Product management 157, Marketing 111, Legal 63, Auditing 10.

3. What is the distribution of employees who work remotely and HQ?
INSIGHTS: Headquarters 16715, Remote 5499.

4. What is the race distribution in the Company?
INSIGHTS: Hispanic or Latino 2501, White 6328, Black or African American 3619, Two or More Races 3648, Asian 3562, American Indian or Alaska Native 1327, Native Hawaiian or Other Pacific Islander 1229.

5. What is the distribution of employee across different states?
INSIGHTS:  Ohio 18025, Michigan 673, Pennsylvania 1115, Wisconsin 382, Illinois 868, Indiana 700, Kentucky 451.

6. What is the number of employees whose employment has been terminated?
INSIGHTS: Number of employees whose employment was terminated is 2677.

7. Who is/are the longest serving employee in the organization.
INSIGHTS: Guendolen-Neles is the longest serving employee and was hired in 2000-10-17.

8. Return the terminated employees by their race
 INSIGHTS: White 763, Black or African American 440, Two or More Races 438, Asian 437, Hispanic or Latino 278, Native Hawaiian or Other Pacific Islander 166, American Indian or Alaska Native 155.

9. What is the age distribution in the Company?
INSIGHTS: Age_group 20-29 (4256), Age_group 30-39 (6160), Age_group 40-49 (5897, Age_group 50-59 (5901).

10. How have employee hire counts varied over time? 
INSIGHTS: Year 2000-2005 (5783 employees were hired), Year 2006-2010 (5555 employees were hired), Year 2011-2015 (5421 employees were hired), Year 2016-2020 (5455 employees were hired).  

11. What is the tenure distribution for each department? 
INSIGHTS: Auditing 15 years, Product Management 14 years, Training 14 years, Engineering 14 years, Business Development 14 years, Accounting 14 years, Human Resources 14 years, Research and Development 14 years, Sales 14 years, Support 14 years, Services 14 years, Legal 14 years, Marketing 13 years. 

12. What is the average length of employment in the company?
INSIGHTS: 15 years. 


## Recommendation
1. Gender Balance: While the gender distribution is fairly balanced, with a slight skew towards females, the company should continue fostering inclusivity across all genders, 
especially in senior leadership and technical roles. Additionally, there could be more targeted initiatives to support non-confirming employees, increasing their representation in the workforce.
2. Remote Work: The company has a significant portion of remote workers, particularly in the Engineering department. 
It is recommended to explore expanding remote work options across other departments like Auditing and Legal, which currently have fewer remote employees. 
Investing in enhanced remote collaboration tools will help strengthen communication and maintain productivity in a hybrid model, ensuring that remote employees are well-integrated with HQ teams.
3. Workforce Distribution: A large portion of the workforce is concentrated in Ohio. To avoid over-reliance on a single state and to foster geographical diversity, 
the company should consider encouraging talent acquisition and possible relocation to states with fewer employees, such as Michigan and Illinois. 
Expanding into other regions can also help tap into a broader talent pool and improve workforce distribution.
4. Diversity and Inclusion: While the company has good racial diversity overall, there’s room to enhance representation, particularly in leadership roles and specific departments. 
Continued diversity initiatives should focus on underrepresented racial groups and aim to improve their representation at all levels of the organization. 
Consider offering mentorship, leadership training, and career development programs for employees from diverse racial backgrounds to help them progress in their careers.
5. Employee Termination: With 2,677 employees terminated, the company should carefully analyze the reasons behind terminations, ensuring fairness and equity in the process.
It’s crucial to investigate if any particular racial or demographic group is disproportionately affected by terminations. If disparities are found, 
the company should address any underlying biases and work on improving fairness in performance reviews, promotions, and terminations.
6. Age Diversity: The company has a well-distributed age range among employees, which indicates a balanced workforce. 
However, efforts should be made to promote cross-generational mentorship programs, allowing employees from different age groups to collaborate and share knowledge.
Additionally, providing support for older employees, such as retirement planning and opportunities for continued professional growth, will help retain experienced talent.
7. Retention and Tenure: The company benefits from long-tenured employees, with an average tenure of 15 years. 
To maintain this, it’s important to ensure continuous career development and growth opportunities to prevent stagnation. 
Long-serving employees could also be leveraged as mentors to newer hires, transferring knowledge and fostering a strong organizational culture.
8. Hiring Strategy: The company’s hiring trend remains stable over time. However, it’s recommended to slightly increase hiring efforts, 
particularly in departments experiencing growth or where talent shortages are identified.
This will help support the company’s continued expansion and ensure that the workforce remains adaptable to future business needs.
9. Employee Engagement: The long tenure of employees suggests a high level of loyalty and satisfaction, but departments like Marketing, with slightly shorter tenures,
 might benefit from additional focus on employee engagement. Offering career development opportunities, leadership training, and ensuring that employees feel valued and supported will help improve retention and job satisfaction across all departments.
By implementing these recommendations, the company can strengthen its workforce, improve diversity and inclusion, foster a positive work culture, and maintain long-term growth and stability.

## Conclusion
The company has a strong and diverse workforce with a significant number of long-tenured employees, indicating high levels of loyalty and satisfaction.
However, to continue thriving, there are several key areas for improvement. Expanding remote work opportunities across more departments and balancing the geographical distribution of employees will help enhance flexibility and tap into a broader talent pool. 
Strengthening diversity and inclusion initiatives, particularly in leadership roles, is essential for fostering an equitable workplace. Additionally, a closer look at termination practices can ensure fairness, 
and creating mentorship programs can help facilitate knowledge sharing across generations.
By focusing on these areas—remote work, workforce distribution, diversity, employee retention, and engagement—the company can maintain a dynamic, inclusive, and loyal workforce that is well-equipped for continued growth and success.
