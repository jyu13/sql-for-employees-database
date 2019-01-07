SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    COUNT(salary)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
    
SELECT 
    COUNT(*)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    

SELECT 
    SUM(salary)
FROM
    salaries;
    
# * go with count only

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date >= '1997-01-01';
    
SELECT 
    MAX(salary) as max_salary, MIN(salary) as min_salary
FROM
    salaries;

SELECT 
    MIN(emp_no) AS min_emp_no, MAX(emp_no) AS max_emp_no
FROM
    employees;
    
SELECT 
    AVG(salary)
FROM
    salaries;
    
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT 
    dept_no, 
    IFNULL(dept_name, 'name not provided') AS dept_name
FROM
    departments_dup;

alter table departments_dup
add column dept_manager varchar(255);

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup;
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name, 'N/A') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
