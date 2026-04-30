-- -----------------------------
-- Transaction 
-- -----------------------------
-- Transaction 시작 
START TRANSACTION;

INSERT INTO employees(
	`name`
 	,birth
	,gender
	,hire_at
) 
VALUES (
	'미어캣'
 	,'1997-09-01'
	,'M'
	,NOW()
);

SELECT *
FROM employees 
WHERE `name`= '미어캣'
;
COMMIT;
-- ROLLBACK;