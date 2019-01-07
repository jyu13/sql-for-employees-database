use employees_mod;

drop procedure if exists filter_salary;

delimiter $$
create procedure filter_salary ( in p_min_salary float, in p_max_salary float)
begin
select
	e.gender, d.dept_name, avg(s.salary) as avg_salary
from
	t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    where s.salary between p_min_salary and p_max_salary
GROUP BY d.dept_no , e.gender;
end $$
delimiter ;

call filter_salary(50000, 90000); 