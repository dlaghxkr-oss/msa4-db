-- 1. 사원의 사원번호, 이름, 직급코드를 출력해 주세요.
	SELECT 
		emp.emp_id
		,emp.`name`
		,tit.title_code 
	FROM employees emp
		INNER JOIN title_emps tit
			ON emp.emp_id =tit.emp_id 
				AND tit.end_at IS NULL
ORDER BY emp.emp_id				
				;
			
		
-- 2. 사원의 사원번호, 성별, 현재 연봉을 출력해 주세요.
	SELECT 
		emp.emp_id
		,emp.gender
		,sal.salary
	FROM employees emp 
		INNER JOIN salaries sal
			ON emp.emp_id = sal.emp_id 
				AND sal.end_at IS NULL 
				
ORDER BY salary;				
		

-- 3. 10010 사원의 이름과 과거부터 현재까지 연봉 이력을 출력해 주세요.
	SELECT 
		emp.emp_id
		,emp.`name`
		,sal.salary
		,sal.start_at
		,sal.end_at 
	FROM employees emp 
		INNER JOIN salaries sal 
			ON emp.emp_id = sal.emp_id 
	WHERE emp.emp_id = 10010
ORDER BY sal.start_at;				


-- 4. 사원의 사원번호, 이름, 소속부서명을 출력해 주세요.
	SELECT 
		emp.emp_id
		,emp.`name`
		,dem.dept_name
	FROM employees emp
		JOIN department_emps dep
			ON emp.emp_id = dep.emp_id 
		JOIN departments dem 
			ON dep.dept_code = dem.dept_code
			AND dep.end_at IS NULL 
	;
					 
					 
-- 5. 현재 연봉의 상위 10위까지 사원의 사번, 이름, 연봉을 출력해 주세요.
	SELECT 
		emp.emp_id 
		,emp.`name`
		,sal.salary
	FROM employees emp 
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id 
	ORDER BY sal.salary DESC 
	LIMIT 10 ;
			
	

-- 6. 현재 각 부서의 부서장의 부서명, 이름, 입사일을 출력해 주세요.
	SELECT 
		emp.`name`
		,emp.hire_at
		,dpt.dept_name
	FROM employees emp
		JOIN department_managers dpm
			ON emp.emp_id = dpm.emp_id
			AND dpm.end_at IS NULL
		JOIN departments dpt 
			ON dpm.dept_code = dpt.dept_code 
;	

-- 7. 현재 직급이 "부장"인 사원들의 연봉 평균을 출력해 주세요.
-- 7-1. (보너스)현재 각 부장별 이름, 연봉평균
	SELECT 
		AVG(sal.salary) AS avg_sal 
	FROM employees emp
		JOIN salaries sal
			ON emp.emp_id = sal.emp_id 
			AND sal.end_at IS NULL 
		JOIN title_emps tit
			ON emp.emp_id = tit.emp_id 
			AND tit.end_at IS NULL
		JOIN titles tie
			ON tit.title_code = tie.title_code
	WHERE tie.title = "부장"
		; 
		
-- 8. 부서장직을 역임했던 모든 사원의 이름과 입사일, 사번, 부서번호를 출력해 주세요.
	SELECT 
		emp.`name`
		,emp.hire_at
		,emp.emp_id
		,dpm.dept_code
		,dpm.start_at
		,dpm.end_at 
	FROM employees emp 
		JOIN department_managers dpm
			ON emp.emp_id = dpm.emp_id 
			;
		
-- 9. 현재 각 직급별 평균연봉 중 60,000,000이상인 직급의 직급명, 평균연봉(정수)를을 평균연봉 내림차순으로 출력해 주세요.
	SELECT 
		AVG(salary) AS avg_sal
		,tit.title 
	FROM employees emp
		JOIN salaries sal 
			ON emp.emp_id = sal.emp_id 
			 AND sal.end_at IS NULL 
		JOIN title_emps tie
			ON emp.emp_id = tie.emp_id 
			 AND tie.end_at IS NULL 
		JOIN titles tit
			ON tie.title_code = tit.title_code 
		GROUP BY tit.title
		HAVING AVG(sal.salary) >= 60000000
    	ORDER BY avg_sal DESC 
	;

-- 10. 성별이 여자인 사원들의 직급별 사원수를 출력해 주세요.
	SELECT 
		tit.title_code
		,count(tit.title_code)
		
		
	FROM employees emp
		JOIN title_emps tit
			ON emp.emp_id = tit.emp_id 
			 AND tit.end_at IS NULL 
	WHERE emp.gender = 'F'
	GROUP BY tit.title_code 
	;  	
		
