-- 1번 답
SELECT e.emp_name, d.dept_name
  FROM emp e, dept d
 WHERE e.dept_id = d.dept_id;

-- 2번 답 
SELECT e.emp_name, e.salary
  FROM emp e, dept d
 WHERE e.dept_id = d.dept_id
   AND d.dept_id = 10;

-- 3번 답
SELECT d.dept_id, COUNT(e.emp_id) AS "emp_count"
  FROM emp e, dept d
 WHERE e.dept_id = d.dept_id
 GROUP BY d.dept_id; 

-- 4번 답
SELECT e.emp_name, e.salary
  FROM emp e
 WHERE salary > ANY(SELECT e.salary FROM emp e);

-- 5번 답
SELECT e.emp_name, p.proj_name 
  FROM emp e
 INNER JOIN emp_project ep ON e.emp_id = ep.emp_id
 JOIN project p ON ep.proj_id = p.proj_id;
