# procedures
USE employees;

drop procedure if exists select_employees;


delimiter $$
create procedure select_employees()
begin
	select 
		*
        from
        employees
        limit 1000;
end $$
delimiter ;

call employees.select_employees();

call select_employees;

delimiter $$
create procedure employees_avg_salary()
begin
	select
		round(avg(salary),2)
	from
		salaries;
end $$
delimiter ;

call employees.employees_avg_salary();

# call select_salaries;

drop procedure if exists select_employees;

drop procedure if exists employees_avg_salary;

drop procedure if exists emp_salary;

delimiter $$
use employees $$

create procedure emp_salary(in p_emp_no integer)
begin
	select
		e.first_name, e.last_name, s.salary, s.from_date, s.to_date
	from
		employees e
			join
		salaries s on e.emp_no = s.emp_no
	where
		e.emp_no = p_emp_no;
        
end $$

delimiter ;

drop procedure if exists emp_avg_salary_out;

delimiter $$
use employees $$

create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
begin
	select
		avg(s.salary)
	into p_avg_salary from
		employees e
			join
		salaries s on e.emp_no = s.emp_no
	where
		e.emp_no = p_emp_no;
        
end $$

delimiter ;

drop procedure if exists emp_info;

delimiter $$
use employees $$

create procedure emp_info( in p_emp_firstname varchar(255), in p_emp_lastname varchar(255), out p_emp_no varchar(255))
begin
	select
		e.emp_no
	into p_emp_no from
		employees e
	where
		e.first_name = p_emp_firstname and e.last_name = p_emp_lastname;
        
end $$

delimiter ;

select * from employees;

# variables

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
SELECT @v_avg_salary;

set @v_emp_no = 0;
call employees.emp_info('Aruna', 'Journel', @v_emp_no);
select @v_emp_no;

# user-defined functions
#SET GLOBAL log_bin_trust_function_creators = 1;

delimiter $$
use employees $$
create function f_emp_avg_salary( p_emp_no integer) returns decimal(10,2)
deterministic
begin

declare v_avg_salary decimal(10,2);

select
	avg(s.salary)
into v_avg_salary from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
    
return v_avg_salary;
end $$

delimiter ;

select employees.f_emp_avg_salary(11300);




DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2) DETERMINISTIC
BEGIN
	DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;		
RETURN v_salary;

END$$

DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');


select * from salaries where salary = 60117;