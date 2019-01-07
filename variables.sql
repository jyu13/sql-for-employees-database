drop function if exists f_emp_avg_salary;

delimiter $$
use empolyees $$

create function f_emp_avg_salary (p_emp_no integer) returns decimal(10,2)
begin

declare v_avg_salary decimal(10,2); # local variable

begin

declare v_avg_salary2 decimal(10,2); # local variable only visible to this set of begin and end

end;

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


# session variable
set @s_var1 = 3;

select @s_var1;

# global variable

set global max_connection = 1000;

set @@global.max_connection = 1;

# user-definied variable and system variables

set session sql_mode = 'strict_trans_tables, no_zero_date, no_auto_create_user, no_engine_substitution';

