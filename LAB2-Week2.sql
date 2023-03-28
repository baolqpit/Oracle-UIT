--1.Write a pl/sql block to assign value to a variable and print
--out the value.
SET SERVEROUTPUT ON
DECLARE 
    x INT;
    y VARCHAR2(50) := 'HELLO WORLD!';
BEGIN
    x := 50;
    DBMS_OUTPUT.PUT_LINE('GIA TRI CUA Y LA: ' || y);
    DBMS_OUTPUT.PUT_LINE('GIA TRI CUA X LA: ' || x);
END;

--2.Write a pl/sql block to check number is Odd or Even.
DECLARE
    x Int;
BEGIN
    x := 47;
    IF (MOD(X,2)=0) THEN
        DBMS_OUTPUT.PUT_LINE( x|| ' LA SO CHAN.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE( x|| ' LA SO LE.');
    END IF;
END;

--3.Write a pl/sql block to check a number is greater or lower
--than 0.
DECLARE
    x INT;
BEGIN
    x := -100;
    IF (x<0) THEN
        DBMS_OUTPUT.PUT_LINE( x|| ' IS LOWER THAN 0.');
    ELSIF(x>0) THEN
        DBMS_OUTPUT.PUT_LINE( x|| ' IS GREATER THAN 0.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE( x|| ' IS EQUAL 0.');
    END IF;
END;

--4.Using database Student Management, write a PL/SQL block to
--check how many students are enrolled in section id 85. If 15
--or more students are enrolled, section 85 is full. Otherwise,
--section 85 is not full. In both cases, a message should be
--displayed to the user, indicating whether section 85 is full.
DECLARE
    x INT;
BEGIN
    SELECT COUNT(STUDENT_ID) INTO x
    FROM ENROLLMENT
    WHERE SECTION_ID=85;
    IF (x>=15) THEN
        DBMS_OUTPUT.PUT_LINE('SECTION 85 IS FULL');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('SECTION 85 IS  NOT FULL');
    END IF;
END;
--SECTION 85 IS  NOT FULL

--5.Do question 4 again using a procedure with 1 parameter:
--section number. Write a PL/SQL block to call the procedure
--with parameters section 85.
CREATE OR REPLACE PROCEDURE checkSection(secid SECTION.SECTION_ID%TYPE)
AS
    x INT;
BEGIN
    SELECT COUNT(STUDENT_ID) INTO x
    FROM ENROLLMENT
    WHERE section_id = secid;
    IF (x>=15) THEN
        DBMS_OUTPUT.PUT_LINE('SECTION 85 IS FULL');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('SECTION 85 IS  NOT FULL');
    END IF;
END;
--CALL PROCEDURE CHECKSECTION
BEGIN
    checkSection(85);
END;

--6.Use a numeric FOR loop to calculate a factorial of 10 (10! =
--1*2*3...*10). Write a PL/SQL block.
DECLARE
    x INT := 10;
    ans INT := 1;
BEGIN
    FOR i IN 1..x LOOP
        ans := ans*i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(x || '! = ' || ans);
END;

--7.Write a procedure to calculate the factorial of a number.
--Write a PL/SQL block to call this procedure.
CREATE OR REPLACE PROCEDURE calculateFactorial(x INT)
AS
    ans INT := 1;
BEGIN 
    FOR i IN 1..x LOOP
        ans := ans*i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(x || '! = ' || ans);
END;
--CALL PROCEDURE
BEGIN
    calculateFactorial(10);
END;

--8.Write a function to calculate the factorial of a
--number. Write a PL/SQL block to call this function.
CREATE OR REPLACE FUNCTION  computeFac(x INT) RETURN NUMBER
AS
    ans INT := 1;
BEGIN 
    FOR i IN 1..x LOOP
        ans := ans*i;
    END LOOP;
    RETURN ans;
END;
--CALL FUNCTION
DECLARE
    ans NUMBER;
BEGIN
    ans := computeFac(8);
    DBMS_OUTPUT.PUT_LINE('THE ANSWER IS: ' || ans);
END;

--9.Write a procedure to calculate and print out the
--result of a division. If the denominator is 0 then
--adding exception. Write a PL/SQL block to call this
--procedure.
CREATE OR REPLACE PROCEDURE div(tuSo INT, mauSo INT)
AS 
    kq NUMBER;
BEGIN
    kq := tuSo/mauSo;
    DBMS_OUTPUT.PUT_LINE('THE ANSWER IS: ' || kq);
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('CANNOT DIVIDE BY 0.');
END;
--CALL PROCEDURE
BEGIN
    div(4,2);
    div(10,0);
END;
--THE ANSWER IS: 2
--CANNOT DIVIDE BY 0.

--10.Write a function to calculate the result of a
--division. Write a PL/SQL block to call this function.
CREATE OR REPLACE FUNCTION divFunction(tuSo INT, mauSo INT) RETURN NUMBER
AS ans NUMBER;
BEGIN
    ans := tuSo/mauSo;
    RETURN ans;
    EXCEPTION 
        WHEN ZERO_DIVIDE THEN
            RETURN NULL;
END;
--CALL FUNCTION
DECLARE
    ans NUMBER;
BEGIN
    ans := divFunction(12,0);
    IF (ans IS NULL) THEN
        DBMS_OUTPUT.PUT_LINE('CANNOT DIVIDE BY 0.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('THE ANSWER IS: ' || ans);
    END IF;
END;

/*11.Using database Student Management, write a procedure
to display the student’s name, street_address on the
screen. If no record in the STUDENT table
corresponds to the value of student_id provided by
the user, the exception NO_DATA_FOUND is raised.
Write a PL/SQL block to call this procedure with
parameter is 25, 105.*/
CREATE OR REPLACE PROCEDURE displayStu(stuID STUDENT.STUDENT_ID%TYPE)
AS 
    sname VARCHAR2(100);
    sadd STUDENT.STREET_ADDRESS%TYPE;
BEGIN
    SELECT FIRST_NAME ||' '||LAST_NAME, STREET_ADDRESS INTO sname, sadd
    FROM STUDENT
    WHERE STUDENT_ID = stuID;
    DBMS_OUTPUT.PUT_LINE('ADD: ' || sadd);
    DBMS_OUTPUT.PUT_LINE('NAME: ' || sname);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
             DBMS_OUTPUT.PUT_LINE('THIS STUDENT IS NOT EXISTED!');
END;
--CALL PROCEDURE
BEGIN
    displayStu(25);
    displayStu(105);
END;

/*12. Do the question 11 using function to return the
student’s record (declare a rowtype variable). Write
a PL/SQL block to call this function and print out
student’s name, address, phone.*/
CREATE OR REPLACE FUNCTION displayStudent(stuID STUDENT.STUDENT_ID%TYPE) RETURN STUDENT%ROWTYPE
AS
     stu STUDENT%ROWTYPE;
BEGIN
    SELECT * INTO stu
    FROM STUDENT
    WHERE STUDENT_ID = stuID;
    RETURN stu;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
             RETURN NULL;
END;
--CALL FUNCTION
DECLARE
    ANS STUDENT%ROWTYPE;
BEGIN
    ANS := displayStudent(25);
    DBMS_OUTPUT.PUT_LINE('STUDENT NAME: ' || ANS.FIRST_NAME || ' ' || ANS.LAST_NAME || ' ADD: ' || ANS.STREET_ADDRESS || ' PHONE: ' || ANS.PHONE);
END;

/*13.Write a procedure to check if the student is
enrolled. If no record in the ENROLLMENT table
corresponds to the value of v_student_id provided by
the user, the exception NO_DATA_FOUND is raised. And
if more than one record in the ENROLLMENT table then
exception TOO_MANY_ROWS is raised.
Write a pl/sql block to call procedure above with
different values of student ID: 102, 103, 319 */

/*16.Write a procedure to find name of a student and how
many courses this user enrolled. Print out the
result on the screen. Write a PL/SQL block to call
this function. */
CREATE OR REPLACE PROCEDURE findStu(stuID STUDENT.STUDENT_ID%TYPE)
AS 
    sname VARCHAR2(100);
    numCourse INT;
BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO sname
    FROM STUDENT
    WHERE STUDENT_ID = stuID;
    DBMS_OUTPUT.PUT_LINE('NAME OF STUDENT: ' || sname);
    SELECT  COUNT(COURSE_NO) INTO numCourse
    FROM ENROLLMENT  e JOIN SECTION s ON e.SECTION_ID = s.SECTION_ID
    WHERE STUDENT_ID = stuID;
    DBMS_OUTPUT.PUT_LINE('NAME OF COURSES: ' || numCourse);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND! TRY AGAIN');
END;
--CALL PROCEDURE
BEGIN
    findStu(25);
    findStu(105);
END;


/*17. Write a function to calculate how many courses that
student enrolled. Student_id provided by the user.
Write a procedure to find name of student and how
many courses this user enrolled.
Write a pl/sql block to call procedure above with
different values of student_id: 109, 530 */
CREATE OR REPLACE FUNCTION calCourse (sid STUDENT.STUDENT_ID%TYPE) RETURN INT
AS 
    numCourse INT;
BEGIN
    SELECT  COUNT(COURSE_NO) INTO numCourse
    FROM ENROLLMENT  e JOIN SECTION s ON e.SECTION_ID = s.SECTION_ID
    WHERE STUDENT_ID = sid;
    RETURN numCourse;
END;

CREATE OR REPLACE PROCEDURE fStudent(stuID STUDENT.STUDENT_ID%TYPE)
AS
    sname VARCHAR2(100);
    x INT;
BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO sname
    FROM STUDENT
    WHERE STUDENT_ID = stuID;
    DBMS_OUTPUT.PUT_LINE('NAME OF STUDENT: ' || sname);
    x := calCourse(stuID);
    DBMS_OUTPUT.PUT_LINE('NUMBER OF COURSE: ' || x);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND! TRY AGAIN');
END;
--CALL PROCEDURE
BEGIN
    fStudent(109);
    fStudent(530);
END;



