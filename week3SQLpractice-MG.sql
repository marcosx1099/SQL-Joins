-- task1 List the IDs, first names, and last names of the employees working in the IT department.
select employees.employee_id as ID, employees.first_name as first_name,
employees.last_name, departments.department_name
from employees
inner join departments on employees.department_id = departments.department_id
where departments.department_name = 'IT';

-- task 2 Extract the minimum and maximum salaries for each department.
select departments.department_name, min(employees.salary), max(employees.salary)
from employees
inner join departments on employees.department_id = departments.department_id
group by 1
order by 2;


-- task 3 Identify the top 10 cities that have the highest number of employees
select locations.city, count(*) as count_of_employees
from locations
join departments on locations.location_id = departments.location_id
join employees on departments.department_id = employees.department_id
group by locations.city
order by 2;


-- task 4 List the employee IDs, first names, and last names of all those employees whose last working day in the organization was 1999-12-31.
select employees.employee_id as emp_id, employees.first_name, employees.last_name
from employees
join job_history on employees.employee_id = job_history.employee_id
where end_date = '1999-12-31';

-- task 5 Extract the employee IDs, first names, department names, and total experience of all those employees who have completed at least 25 years in the organization.
select employees.employee_id as emp_id,
employees.first_name,
departments.department_name,
YEAR(curdate())- year(job_history.start_date) as total_experience
from employees
join departments on employees.department_id = departments.department_id
join job_history on employees.employee_id = job_history.employee_id
where YEAR(curdate())- year(job_history.start_date) > 25;



select datediff(curdate(),start_date) as total_experience
from job_history;