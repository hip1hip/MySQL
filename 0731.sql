
DELIMITER //
CREATE PROCEDURE sp_test
(
	OUT v_now DATETIME,
    OUT v_version VARCHAR(30)
)
BEGIN 
    SELECT NOW(), VERSION() INTO v_now , v_version;
END
//
DELIMITER ;


CALL sp_test(@t_now, @t_version);

select @t_now , @t_version;



CREATE TABLE dept_clone
AS
SELECT * FROM dept;
DROP TABLE dept_clone;

DELIMITER // 
CREATE PROCEDURE sp_deleteDept()
BEGIN
	DELETE FROM dept_clone;
   
END
//
DELIMITER ;

CALL sp_deleteDept();



DELIMITER //
CREATE PROCEDURE sp_insertDept
(
	IN v_deptno TINYINT,
    IN v_dname VARCHAR(14),
    IN V_loc VARCHAR(13)

)
BEGIN 
	INSERT INTO dept_clone(deptno , dname , loc)
    VALUES(v_deptno , v_dname , v_loc);
    COMMIT;
END 
//
DELIMITER ;

CALL sp_insertDept(50, 'Desing' , 'Seoul');




-- 사원번호를 입력 받아서 부서 이름과 부서 위치를 출력하시오.
DELIMITER //
CREATE PROCEDURE sp_selectEmp 
(
    IN v_empno SMALLINT,
    OUT v_dname VARCHAR(14),
    OUT v_loc VARCHAR(13)
)
BEGIN
    SELECT dname, loc INTO v_dname, v_loc
    FROM emp JOIN dept ON (emp.deptno = dept.deptno)
    WHERE empno = v_empno;
END
//
DELIMITER ;

CALL sp_selectEmp(7369,@t_dname,@t_loc);
SELECT @t_dname,@t_loc;



DELIMITER //
CREATE PROCEDURE sp_selectDanme
(
	INOUT v_name VARCHAR(14)
)

BEGIN
	DECLARE v_str VARCHAR(14);
	SELECT loc INTO v_str
    FROM dept
    WHERE dname = v_name;
    SET v_name := v_str;
END
//
DELIMITER ;

SET @t_str := 'RESEARCH';
CALL sp_selectDanme(@t_str);
SELECT @t_str;


-- 반복하는
Delimiter //
CREATE PROCEDURE sp_select_emp_dept
(
	IN		v_deptno TINYINT
)
BEGIN
	SELECT empno, ename , dname , loc, dept.deptno
    FROM emp NATURAL JOIN dept
    WHERE deptno = v_deptno;

END
//
delimiter ; 

CALL sp_select_emp_dept(20);


-- "번호\t진찰부서\t진찰비\t입원비\t진료비"

delimiter //
CREATE PROCEDURE sp_select_all_patient()
BEGIN
	SELECT number, dept , operfee, hospitalfee , money
    FROM Patient 
	ORDER BY number DESC;
END 
//
delimiter ; 


Delimiter //
CREATE PROCEDURE sp_select_one_patient(IN v_number TINYINT)
BEGIN
	SELECT *
    FROM Patient 
    WHERE number = v_number;
END
//
Delimiter ;


CALL sp_select_one_patient(10);



Delimiter //
CREATE PROCEDURE  sp_update_patient
(
	IN v_number TINYINT,
    IN v_code CHAR(2),
    In v_days SMALLINT,
    IN v_age TINYINT,
    IN v_dept VARCHAR(20),
    IN v_operfee INT,
    IN v_hospitalfee INT,
    IN v_money INT
)
BEGIN 
	UPDATE Patient
    SET code = v_code , days = v_days, age= v_age, dept = v_dept , operfee = v_operfee , hospitalfee = v_hospitalfee , money = v_money
    WHERE number = v_number;
    COMMIT;
END
    // 
    Delimiter ;


select * from Patient;





