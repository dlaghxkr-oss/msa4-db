-- 부서별 현재 연봉 평균 구해주세용.
-- 부서명(한글), 평균연봉 출력

CREATE VIEW  view_avg_salary_by_dept 
AS
	SELECT 
		dpm.dept_name
		,avg(salary) avg_sal
	FROM employees emp
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id 
			AND sal.end_at IS null
		JOIN department_emps dpe
			ON sal.emp_id = dpe.emp_id
			AND dpe.end_at IS NULL 
		JOIN departments dpm 
			ON dpe.dept_code = dpm.dept_code
	
	GROUP BY dpm.dept_name;

-- 뷰 조회하기 
SELECT 
	*
	FROM view_avg_salary_by_dept
	WHERE avg_sal >= 44000000
;


-- VIEW 삭제 
DROP VIEW view_avg_salary_by_dept; 