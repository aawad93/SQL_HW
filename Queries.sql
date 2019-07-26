--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from "Employees" as e, "Salaries" as s
where e.emp_no = s.emp_no
order by s.salary DESC;


--List employees who were hired in 1986.
select first_name, last_name, hire_date
from "Employees"  
where hire_date between '19860101' and '19861231'
order by hire_date;


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
select d.dept_no, d.dept_name, m.emp_no as "manager_no", e.last_name, e.first_name, m.from_date, m.to_date
from "Departments" as d, "Department_Manager" as m, "Employees" as e
where d.dept_no = m.dept_no and e.emp_no = m.emp_no
order by dept_name, last_name;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" as e, "Departments" as d
where e.emp_no in(
	select emp_no
	from "Department_Emp"
	where dept_no in(
		select dept_no
		from "Departments"));

--List all employees whose first name is "Hercules" and last names begin with "B."
select * 
from "Employees"
where first_name = 'Hercules' 
and last_name like 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" as e, "Departments" as d
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" as e, "Departments" as d
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--In descending order, list the frequency count of 
--employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Last Name Frequency"
from "Employees"
group by last_name 
order by "Last Name Frequency" DESC;
