-- update 문
-- DML 중 하나로 저장되어있는 기존 데이터를 수정하기위해 사용하는 쿼리
UPDATE 테이블명 
SET 
 컬럼1 = 값1
 ,컬럼2 = 값2
 [...]
 [WHERE 조건];
 
 UPDATE employees 
 SET 
  `name` = '둘리'
WHERE 
 emp_id = 100005
 ;  
 
 
 UPDATE employees 
 SET 
  `name` = '도우너'
  WHERE 
   emp_id = 100005
   ;

 
 -- 100005번 사원의 생일을 '2020-01-01', 이름을 '마이콜'로 변경해주세요 
 
 UPDATE employees  
 SET 
 `name` = '마이콜'
  , birth = '2020-01-01'
 WHERE 
 emp_id = 100005
;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 