USE employees;

COmmit;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
ROLLBACK;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

DELETE FROM departments_dup;

Rollback;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments
WHERE
    dept_no = 'd010';
    
# drop - lose everything and can not recover
# truncate = delete without where, auto-increment values with be reset
# delete removew records row by row
# truncate  faster than delete and auto-increment values will not be reset

