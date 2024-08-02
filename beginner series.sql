SELECT first_name,age
 from employee_demographics
group by first_name,age;

SELECT * 
 FROM employee_salary;
 
 
 
 SELECT gender, avg(AGE)
 from employee_demographics
 group by GENDER
having avg(AGE) > 40;

SELECT occupation, AVG(salary)
FROM employee_salary
 WHERE occupation LIKE '%manager%';
 
 SELECT *
 from employee_demographics;

 SELECT dem.employee_id,age, occupation 
 from employee_demographics AS dem
  INNER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id;
  
  SELECT * 
 from employee_demographics AS dem
  RIGHT JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id;
 


 


