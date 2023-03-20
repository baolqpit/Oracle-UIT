--1.Display the user id for employee 23.
SELECT USERID
FROM S_EMP
WHERE ID=23;
--rpatel

--2. Display the first name, last name, and department number of the
--employees in departments 10 and 50 in alphabetical order of last name.
--Merge the first name and last name together, and title the column
--Employees. (Use ‘||’ to merge columns).
SELECT FIRST_NAME || ' ' || LAST_NAME Employees, DEPT_ID
FROM S_EMP
WHERE DEPT_ID IN(10,50)
ORDER BY LAST_NAME;
/* 
Mark Quick-To-See	10
Audry Ropeburn	50
Carmen Velasquez	50
*/

--3.Display all employees whose last names contain an “s”
SELECT *
FROM S_EMP
WHERE LOWER(LAST_NAME) LIKE '%s%';
/* 
1	Velasquez	Carmen	cvelasqu	03-MAR-90			President	50	2500	
4	Quick-To-See	Mark	mquickto	07-APR-90		1	VP, Finance	10	1450	
13	Sedeghi	Yasmin	ysedeghi	18-FEB-91		3	Sales Representative	33	1515	10
15	Dumas	Andre	adumas	09-OCT-91		3	Sales Representative	35	1450	17.5
17	Smith	George	gsmith	08-MAR-90		6	Stock Clerk	41	940	
24	Dancs	Bela	bdancs	17-MAR-91		10	Stock Clerk	45	860	
25	Schwartz	Sylvie	sschwart	09-MAY-91		10	Stock Clerk	45	1100	
*/

--4.Display the user ids and start date of employees hired between May
--5,1990 and May 26, 1991. Order the query results by start date
--ascending order.
SELECT USERID, START_DATE
FROM S_EMP
WHERE START_DATE BETWEEN '05-MAY-1990' AND '26-MAY-1991'
ORDER BY START_DATE ASC;
/*
rmenchu	14-MAY-90
cmagee	14-MAY-90
rpatel	17-OCT-90
echang	30-NOV-90
murguhar	18-JAN-91
anozaki	09-FEB-91
ysedeghi	18-FEB-91
mhavel	27-FEB-91
bdancs	17-MAR-91
sschwart	09-MAY-91
amarkari	26-MAY-91
*/

--5.Write a query to show the last name and salary of all employees who
--are not making between 1000 and 2500 per month.
SELECT LAST_NAME, SALARY
FROM S_EMP
WHERE SALARY NOT BETWEEN 1000 AND 2500;
/*
Smith	940
Patel	795
Newman	750
Markarian	850
Chang	800
Patel	795
Dancs	860
*/

--6.List the last name and salary of employees who earn more than 1350
--who are in department 31, 42, or 50. Label the last name column
--Employee Name, and label the salary column Monthly Salary.
SELECT LAST_NAME AS "Employee Name", SALARY "Monthly Salary"
FROM S_EMP
WHERE (SALARY >= 1350) AND (DEPT_ID = '31' OR DEPT_ID = '42' OR DEPT_ID = '50');
/*
Velasquez	2500
Nagayama	1400
Ropeburn	1550
Magee	1400
*/

--7.Display the last name and start date of every employee who was hired
--in 1991.
SELECT LAST_NAME, START_DATE 
FROM S_EMP
WHERE EXTRACT(YEAR FROM START_DATE) = '1991';

/*
Nagayama	17-JUN-91
Urguhart	18-JAN-91
Havel	27-FEB-91
Sedeghi	18-FEB-91
Dumas	09-OCT-91
Nozaki	09-FEB-91
Patel	06-AUG-91
Newman	21-JUL-91
Markarian	26-MAY-91
Dancs	17-MAR-91
Schwartz	09-MAY-91
*/

--8.Display the employee number, last name, and salary increased by 15%
--and expressed as a whole number
SELECT ID, LAST_NAME, CAST(SALARY * 0.15 AS INTEGER)
FROM S_EMP
/* 
1	Velasquez	375
2	Ngao	218
3	Nagayama	210
4	Quick-To-See	218
5	Ropeburn	233
6	Urguhart	180
7	Menchu	188
8	Biri	165
9	Catchpole	195
10	Havel	196
11	Magee	210
12	Giljum	224
13	Sedeghi	227
14	Nguyen	229
15	Dumas	218
16	Maduro	210
17	Smith	141
18	Nozaki	180
19	Patel	119
20	Newman	113
21	Markarian	128
22	Chang	120
23	Patel	119
24	Dancs	129
25	Schwartz	165
*/

--9.Display the employee last name and title in parentheses for all
--employees. The report should look like the output below
SELECT (LAST_NAME || ' (' || TITLE || ')') AS "Employee"
FROM S_EMP;
/*Velasquez (President)
Ngao (VP, Operations)
Nagayama (VP, Sales)
Quick-To-See (VP, Finance)
Ropeburn (VP, Administration)
Urguhart (Warehouse Manager)
Menchu (Warehouse Manager)
Biri (Warehouse Manager)
Catchpole (Warehouse Manager)
Havel (Warehouse Manager)
Magee (Sales Representative)
Giljum (Sales Representative)
Sedeghi (Sales Representative)
Nguyen (Sales Representative)
Dumas (Sales Representative)
Maduro (Stock Clerk)
Smith (Stock Clerk)
Nozaki (Stock Clerk)
Patel (Stock Clerk)
Newman (Stock Clerk)
Markarian (Stock Clerk)
Chang (Stock Clerk)
Patel (Stock Clerk)
Dancs (Stock Clerk)
Schwartz (Stock Clerk)
*/

--10.Display the product name for products that have “ski” in the name
SELECT NAME
FROM S_PRODUCT
WHERE LOWER(NAME) LIKE '%ski%';
/*
Ace Ski Boot
Ace Ski Pole
Bunny Ski Pole
Pro Ski Boot
Pro Ski Pole
*/

--11.For each employee, calculate the number of months between today and
--the date the employee was hired. Order your result by the number of
--months employed. Round the number of months up to the closest whole
--number. (use the MONTHS_BETWEEN and ROUND function).

SELECT ID, LAST_NAME, ROUND(MONTHS_BETWEEN(SYSDATE, START_DATE),1) AS "Numbers of days"
FROM S_EMP
/*
1	Velasquez	396.6
2	Ngao	396.4
3	Nagayama	381.1
4	Quick-To-See	395.4
5	Ropeburn	396.5
6	Urguhart	386.1
7	Menchu	394.2
8	Biri	395.4
9	Catchpole	373.4
10	Havel	384.8
11	Magee	394.2
12	Giljum	374.1
13	Sedeghi	385.1
14	Nguyen	374
15	Dumas	377.4
16	Maduro	373.4
17	Smith	396.4
18	Nozaki	385.4
19	Patel	379.5
20	Newman	380
21	Markarian	381.8
22	Chang	387.7
23	Patel	389.1
24	Dancs	384.1
25	Schwartz	382.4
*/

--12..Display the highest and lowest order totals in the S_ORD. Label the
--columns Highest and Lowest, respectively.
SELECT MAX(TOTAL) HIGHEST, MIN(TOTAL) LOWEST
FROM S_ORD;
/*
1020935	377
*/

--13.Display the product name, product number, and quantity ordered of all
--items in order number 101. Label the quantity column ORDERED.
SELECT NAME, p.id, i.quantity
FROM S_ITEM i JOIN S_PRODUCT p ON i.product_id =  p.id
WHERE ORD_ID = 101;
/*
Cabrera Bat	50530	50
Grand Prix Bicycle Tires	30421	15
Griffey Glove	50417	27
Major League Baseball	50169	40
Pro Curling Bar	40422	30
Prostar 10 Pound Weight	41010	20
Prostar 100 Pound Weight	41100	35
*/

--14.Display the customer number and the last name of their sales
--representative. Order the list by last name.

SELECT c.id, e.last_name
FROM S_CUSTOMER c JOIN S_EMP e ON c.sales_rep_id=e.id
ORDER BY LAST_NAME
/*
208	Dumas
205	Dumas
206	Dumas
211	Dumas
215	Dumas
210	Giljum
201	Giljum
213	Magee
204	Magee
214	Magee
209	Magee
202	Nguyen
203	Nguyen
212	Sedeghi
*/

--15.Display the customer number, customer name, and order number of all
--customers and their orders. Display the customer number and name,
--even if they have not placed an order.
SELECT c.id cusID, c.name cusNAME, o.id ordID
FROM S_CUSTOMER C LEFT JOIN S_ORD o ON c.id=o.CUSTOMER_ID
/*
201	Unisports	97
202	Simms Athletics	98
203	Delhi Sports	99
204	Womansport	100
204	Womansport	111
205	Kam's Sporting Goods	101
206	Sportique	102
207	Sweet Rock Sports	
208	Muench Sports	103
208	Muench Sports	104
209	Beisbol Si!	105
210	Futbol Sonora	112
210	Futbol Sonora	106
211	Kuhn's Sports	107
212	Hamada Sport	108
213	Big John's Sports Emporium	109
214	Ojibway Retail	110
215	Sporta Russia	
*/

--16.Display all employees by last name and employee number along with
--their manager’s last name and manager number
SELECT nv.id IDEmp, nv.last_name nameEmp, ql.id manId, ql.last_name manName
FROM S_EMP nv JOIN S_EMP ql ON nv.manager_id = ql.id;
/*
5	Ropeburn	1	Velasquez
4	Quick-To-See	1	Velasquez
3	Nagayama	1	Velasquez
2	Ngao	1	Velasquez
9	Catchpole	2	Ngao
8	Biri	2	Ngao
7	Menchu	2	Ngao
6	Urguhart	2	Ngao
10	Havel	2	Ngao
13	Sedeghi	3	Nagayama
15	Dumas	3	Nagayama
14	Nguyen	3	Nagayama
12	Giljum	3	Nagayama
11	Magee	3	Nagayama
16	Maduro	6	Urguhart
17	Smith	6	Urguhart
19	Patel	7	Menchu
18	Nozaki	7	Menchu
20	Newman	8	Biri
21	Markarian	8	Biri
23	Patel	9	Catchpole
22	Chang	9	Catchpole
25	Schwartz	10	Havel
24	Dancs	10	Havel
*/


--17.Display all customers and the product number and quantities they
--ordered for those customers whose order totaled more than 100000.
SELECT c.id, c.name, i.product_id, i.quantity
FROM S_CUSTOMER c, S_ORD o, S_ITEM i
WHERE c.id = o.CUSTOMER_ID AND o.id = i.ord_ID
AND total > 100000;
/*
204	Womansport	10011	500
204	Womansport	10013	400
204	Womansport	10021	500
204	Womansport	30326	600
204	Womansport	41010	250
204	Womansport	30433	450
204	Womansport	10023	400
211	Kuhn's Sports	20106	50
211	Kuhn's Sports	20201	130
211	Kuhn's Sports	30421	55
211	Kuhn's Sports	30321	75
211	Kuhn's Sports	20108	22
212	Hamada Sport	20510	9
212	Hamada Sport	41080	50
212	Hamada Sport	41100	42
212	Hamada Sport	32861	57
212	Hamada Sport	20512	18
212	Hamada Sport	32779	60
212	Hamada Sport	30321	85
213	Big John's Sports Emporium	10011	150
213	Big John's Sports Emporium	30426	500
213	Big John's Sports Emporium	50418	43
213	Big John's Sports Emporium	32861	50
213	Big John's Sports Emporium	30326	1500
213	Big John's Sports Emporium	10012	600
213	Big John's Sports Emporium	10022	300
*/

--18.Display the id, full name of all employees with no manager.
SELECT ID, FIRST_NAME || ' ' || LAST_NAME AS "FULL NAME"
FROM S_EMP 
WHERE MANAGER_ID IS NULL
--Carmen Velasquez

--19.Alphabetically display all products having a name beginning with Pro
SELECT *
FROM S_PRODUCT 
WHERE NAME LIKE 'Pro%'
ORDER BY NAME;
/*
40422	Pro Curling Bar	Curling bar	50	
10013	Pro Ski Boot	Advanced ski boot	410	
10023	Pro Ski Pole	Advanced ski pole	40.95	
41010	Prostar 10 Pound Weight	Ten pound weight	8	
41100	Prostar 100 Pound Weight	One hundred pound weight	45	
41020	Prostar 20 Pound Weight	Twenty pound weight	12	
41050	Prostar 50 Pound Weight	Fifty pound weight	25	
41080	Prostar 80 Pound Weight	Eighty pound weight	35	
*/

--20.Display all product ids, names and short descriptions (short_desc) for
--all descriptions containing the word bicycle.
SELECT ID, NAME, SHORT_DESC
FROM S_PRODUCT
WHERE SHORT_DESC LIKE '%bicycle%';
/*
30321	Grand Prix Bicycle	Road bicycle
30326	Himalaya Bicycle	Mountain bicycle
30421	Grand Prix Bicycle Tires	Road bicycle tires
30426	Himalaya Tires	Mountain bicycle tires
*/

--21.Determine the number of managers without listing them
SELECT COUNT(DISTINCT(MANAGER_ID))
FROM S_EMP;
/* 8 */

--22..Display the customer name, phone, and the number of orders for each
--customer.
SELECT c.NAME, c.PHONE, COUNT(o.ID) 
FROM S_CUSTOMER c JOIN S_ORD o ON c.ID = o.CUSTOMER_ID
GROUP BY c.ID, c.NAME, c.PHONE;
/*
Unisports	55-2066101	1
Simms Athletics	81-20101	1
Delhi Sports	91-10351	1
Womansport	1-206-104-0103	2
Kam's Sporting Goods	852-3692888	1
Sportique	33-2257201	1
Muench Sports	49-527454	2
Beisbol Si!	809-352689	1
Futbol Sonora	52-404562	2
Kuhn's Sports	42-111292	1
Hamada Sport	20-1209211	1
Big John's Sports Emporium	1-415-555-6281	1
Ojibway Retail	1-716-555-7171	1
*/

--23.Display the employee number, first name, last name, and user name for
--all employees with salaries above the average salary.
SELECT  ID, FIRST_NAME, LAST_NAME, USERID
FROM S_EMP
WHERE SALARY>(SELECT AVG(SALARY)
                FROM S_EMP)
/*
1	Carmen	Velasquez	cvelasqu
2	LaDoris	Ngao	lngao
3	Midori	Nagayama	mnagayam
4	Mark	Quick-To-See	mquickto
5	Audry	Ropeburn	aropebur
9	Antoinette	Catchpole	acatchpo
10	Marta	Havel	mhavel
11	Colin	Magee	cmagee
12	Henry	Giljum	hgiljum
13	Yasmin	Sedeghi	ysedeghi
14	Mai	Nguyen	mnguyen
15	Andre	Dumas	adumas
16	Elena	Maduro	emaduro
*/

--24.Display the employee number, first name, and last name for all
--employees with a salary above the average salary and that work with
--any employee with a last name that contains a “t”.

SELECT  ID, FIRST_NAME, LAST_NAME, USERID
FROM S_EMP
WHERE SALARY>(SELECT AVG(SALARY)
                FROM S_EMP) 
            AND DEPT_ID IN (
                            SELECT DEPT_ID
                            FROM S_EMP
                            WHERE LOWER(LAST_NAME) LIKE '%t%'
                            );
/*
4	Mark	Quick-To-See	mquickto
2	LaDoris	Ngao	lngao
16	Elena	Maduro	emaduro
9	Antoinette	Catchpole	acatchpo
14	Mai	Nguyen	mnguyen
10	Marta	Havel	mhavel
*/

--25.Write a query to display the minimum, maximum, and average salary
--for each job type ordered alphabetically.
SELECT  TITLE,MAX(SALARY),MIN(SALARY), AVG(SALARY)
FROM S_EMP
GROUP BY TITLE
ORDER BY TITLE;
/*
President	2500	2500	2500
Sales Representative	1525	1400	1476
Stock Clerk	1400	750	949
VP, Administration	1550	1550	1550
VP, Finance	1450	1450	1450
VP, Operations	1450	1450	1450
VP, Sales	1400	1400	1400
Warehouse Manager	1307	1100	1231.4
*/
                    


