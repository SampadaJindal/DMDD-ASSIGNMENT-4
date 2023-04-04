set SERVEROUTPUT on;

DROP TABLE DEPARTMENT;
DROP SEQUENCE dept_id_seq;

CREATE TABLE DEPARTMENT(
  dept_id NUMBER(5) NOT NULL PRIMARY KEY,
  dept_name VARCHAR2(40) NOT NULL UNIQUE,
  dept_location VARCHAR2(40) NOT NULL
); 

CREATE SEQUENCE dept_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Insert initial data
INSERT INTO department(dept_id, dept_name, dept_location)
VALUES(dept_id_seq.nextval, 'HR', 'NY');

INSERT INTO department(dept_id, dept_name, dept_location)
VALUES(dept_id_seq.nextval, 'IT', 'CA');

INSERT INTO department(dept_id, dept_name, dept_location)
VALUES(dept_id_seq.nextval, 'SALES', 'TX');

INSERT INTO department(dept_id, dept_name, dept_location)
VALUES(dept_id_seq.nextval, 'MARKETING', 'NJ');

INSERT INTO department(dept_id, dept_name, dept_location)
VALUES(dept_id_seq.nextval, 'FINANCE', 'MA');

INSERT INTO department(dept_id, dept_name, dept_location)
VALUES(dept_id_seq.nextval, 'LEGAL', 'NH');

select * from department;

CREATE OR REPLACE PROCEDURE update_dept_location(
    p_dept_name IN VARCHAR2,
    p_dept_location IN VARCHAR2
)
AS
    v_dept_name VARCHAR2(20);
    v_dept_id NUMBER(5);
    v_dept_location VARCHAR2(2);
    EX_INVALID_DEPT_NAME EXCEPTION;
    EX_INVALID_LOCATION EXCEPTION;
    EX_DEPT_NAME_TOO_LONG EXCEPTION;
    CURSOR c_dept IS SELECT dept_name FROM department WHERE dept_name = p_dept_name;
BEGIN
    -- Check if department name is valid
    IF p_dept_name IS NULL OR LENGTH(p_dept_name) = 0 THEN
        RAISE EX_INVALID_DEPT_NAME;
    END IF;
    IF REGEXP_LIKE(p_dept_name, '\d') THEN
         RAISE EX_INVALID_DEPT_NAME;
    END IF;
    
    -- Check if department name is less than 20 characters
    IF LENGTH(p_dept_name) >= 20 THEN
        RAISE EX_DEPT_NAME_TOO_LONG;
    END IF;
    
    -- Convert department name to camel case
     SELECT REPLACE(REPLACE(INITCAP(p_dept_name), ' ', ''), '-', '') INTO v_dept_name FROM dual;
     
    -- Check if department location is valid
    IF p_dept_location NOT IN ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH') THEN
        RAISE EX_INVALID_LOCATION;
    END IF;
    v_dept_location := p_dept_location;
    
    -- Fetch department record using cursor
    OPEN c_dept;
    FETCH c_dept INTO v_dept_name;
    IF c_dept%FOUND THEN
        -- Update department location
        UPDATE department SET dept_location = v_dept_location WHERE dept_name = v_dept_name;
        DBMS_OUTPUT.PUT_LINE('location updated.');
    ELSE
        -- Generate department ID
        SELECT dept_id_seq.NEXTVAL INTO v_dept_id FROM dual;
        -- Insert new row into department table
        INSERT INTO department(dept_id, dept_name, dept_location) VALUES(v_dept_id, v_dept_name, v_dept_location);
        DBMS_OUTPUT.PUT_LINE('record inserted.');
    END IF;
    CLOSE c_dept;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Department ' || p_dept_name || ' successfully managed.');
EXCEPTION
    WHEN EX_INVALID_DEPT_NAME THEN
        DBMS_OUTPUT.PUT_LINE('Please provide a valid department name.');
    WHEN EX_INVALID_LOCATION THEN
        DBMS_OUTPUT.PUT_LINE('Please provide a valid department location.');
    WHEN EX_DEPT_NAME_TOO_LONG THEN
        DBMS_OUTPUT.PUT_LINE('Department name is too long.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
END;
/




