
CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
INSERT INTO studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000
SELECT*FROM studies


CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)
INSERT INTO software
SELECT 'MARY','README','CPP',300, 1200, 84 UNION ALL
SELECT 'ANAND','PARACHUTES','BASIC',399.95, 6000, 43 UNION ALL
SELECT 'ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 UNION ALL
SELECT 'JULIANA','INVENTORY','COBOL',3000, 3500, 0 UNION ALL
SELECT 'KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7 UNION ALL
SELECT 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4 UNION ALL
SELECT 'MARY','CODE GENERATOR','C',4500, 20000, 23 UNION ALL
SELECT 'PATTRICK','README','CPP',300, 1200, 84 UNION ALL
SELECT 'QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 UNION ALL
SELECT 'QADIR','VACCINES','C',1900, 3100, 21 UNION ALL
SELECT 'RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 UNION ALL
SELECT 'RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 UNION ALL
SELECT 'REMITHA','PC UTILITIES','C',725, 5000, 51 UNION ALL
SELECT 'REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 UNION ALL
SELECT 'REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 UNION ALL
SELECT 'VIJAYA','TSR EDITOR','C',900, 700, 6
SELECT *FROM software

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
INSERT INTO programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500
SELECT * FROM programmer

-- ASSIGNMENT SQL QURIES 

--1 Find out the selling cost AVG for packages developed in Pascal.
SELECT AVG(SCOST) FROM software WHERE DEVELOPIN = 'PASCAL'

--2 Display Names, Ages of all Programmers.
SELECT PNAME AS NAME , DATEDIFF(YY,DOB,GETDATE()) FROM [dbo].[programmer]

--3 Display the Names of those who have done the DAP Course.
SELECT PNAME AS NAME FROM studies WHERE COURSE= 'DAP'

--4 Display the Names and Date of Births of all Programmers Born in January.
SELECT PNAME AS NAMES ,DOB FROM programmer WHERE MONTH([DOB] ) = 1

--5 What is the Highest Number of copies sold by a Package?
SELECT MAX(SOLD) FROM software

--6 Display lowest course Fee.
SELECT MIN(COURSE_FEE) FROM studies

--7 How many programmers done the PGDCA Course?
SELECT COUNT(*) FROM studies WHERE COURSE ='PGDCA'

--8 How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST*SOLD) FROM software WHERE DEVELOPIN='C'

--9 Display the Details of the Software Developed by Ramesh.
SELECT [DEVELOPIN]FROM software WHERE PNAME='RAMESH'

--10 How many Programmers Studied at Sabhari?
SELECT PNAME,[COURSE_FEE] FROM studies WHERE INSTITUTE='SABHARI' GROUP BY PNAME,COURSE_FEE
--
SELECT PNAME,[COURSE_FEE] FROM studies WHERE INSTITUTE='SABHARI' GROUP BY PNAME,[COURSE_FEE] HAVING COURSE_FEE>4500

--11 Display details of Packages whose sales crossed the 2000 Mark.
SELECT * FROM software WHERE (SCOST*SOLD)>2000
--
SELECT TITLE,SUM(SCOST*SOLD) AS TOTAL_REVENUE FROM software GROUP BY TITLE HAVING SUM(SCOST*SOLD)>2000

--12 Display the Details of Packages for which Development Cost have been recovered.
SELECT TITLE,SUM(SCOST*SOLD) AS TOTAL_REVENUE, DCOST FROM software GROUP BY TITLE ,DCOST HAVING SUM(SCOST*SOLD)>DCOST

--13 What is the cost of the costliest software development in Basic?
SELECT DEVELOPIN,TITLE, MAX(SCOST) FROM software GROUP BY TITLE , DEVELOPIN HAVING DEVELOPIN='BASIC'
--
SELECT COUNT(DEVELOPIN) AS PACKAGES FROM software GROUP BY DEVELOPIN HAVING DEVELOPIN= 'DBASE'

--14 How many Packages Developed in DBASE?
SELECT COUNT(1) FROM SOFTWARE WHERE DEVELOPIN='DBASE'

--15 How many programmers studied in Pragathi?
SELECT COUNT(1)FROM studies WHERE INSTITUTE= 'PRAGATHI'

--16 How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(*) FROM studies WHERE COURSE_FEE>5000 AND COURSE_FEE<10000 

--17 What is AVG Course Fee
SELECT AVG(COURSE_FEE) AS AVG_CF, COURSE FROM studies GROUP BY COURSE
--OR
SELECT AVG(COURSE_FEE) FROM studies

--18 Display the details of the Programmers Knowing C.
SELECT*FROM programmer WHERE [PROF1]='C' OR [PROF2]='C' 

--19 How many Programmers know either COBOL or PASCAL
SELECT COUNT(*)FROM programmer WHERE [PROF1]='COBOL' OR [PROF2]='PASCAL'OR [PROF1]='PASCAL'OR [PROF2]='COBAL'

--20 How many Programmers don't know either PASCAL and C
SELECT COUNT(1) FROM programmer WHERE PROF1!='PASCAL'OR PROF2=!'C' OR PROF2=!'PASCAL'OR PROF1!='C'

--21 How old is the Oldest Male Programmer.
SELECT DATEDIFF(YY,DOB,GETDATE()),PNAME FROM programmer WHERE GENDER ='M' GROUP BY PNAME, DOB ORDER BY DATEDIFF(YY,DOB,GETDATE())DESC

--22 What is the AVG age of Female Programmers?
SELECT AVG(DATEDIFF(YY,DOB,GETDATE())), PNAME FROM [dbo].[programmer] WHERE GENDER='F' GROUP BY DOB,PNAME

--23 Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
SELECT DATEDIFF(YY,DOJ,GETDATE()) AS EXPERIENCE, PNAME FROM programmer ORDER BY DATEDIFF(YY,DOJ,GETDATE()) DESC

--24 Who are the Programmers who celebrate their Birthday?s During the Current Month?
SELECT * FROM programmer WHERE MONTH(DOB)=10

--25 How many Female Programmers are there?
SELECT COUNT(*)FROM programmer WHERE GENDER='F'

--26 What are the Languages studied by Male Programmers.
SELECT PROF1, PROF2  FROM programmer WHERE GENDER='M' 

--27 What is the AVG Salary?
SELECT AVG(SALARY) FROM programmer

--28 How many people draw salary 2000 to 4000?
SELECT COUNT(*) FROM programmer WHERE SALARY>2000 AND SALARY<4000

--29 Display the details of those who don?t know Clipper, COBOL or PASCAL.
SELECT * FROM programmer WHERE PROF1!='COBOL' AND  PROF1!='PASCAL' AND  PROF1!='CLIPPER' AND PROF2!='COBOL' AND PROF2!='CLIPPER' AND PROF2!='PASCAL'

--30 Display the Cost of Package Developed By each Programmer
SELECT SUM(DCOST) AS COST_PACKAGE,PNAME AS PROGRAMMER FROM [dbo].[software] group BY PNAME

--31 Display the sales values of the Packages Developed by the each Programmer.
SELECT SUM(SCOST*SOLD) AS SALES_VALUES ,PNAME AS PROGRAMMER FROM [dbo].[software]GROUP BY PNAME
SELECT PNAME, SUM(SCOST*SOLD) AS TotalSales FROM software GROUP BY PNAME

--32 Display the Number of Packages sold by Each Programmer.
SELECT SUM(SOLD) AS PACKAGESSOLD ,PNAME  AS PROGRAMMER FROM [dbo].[software] GROUP BY PNAME

--33 Display the sales cost of the packages Developed by each Programmer Language wise.
SELECT SUM(SCOST), PNAME ,DEVELOPIN AS LANGUAGE FROM software GROUP BY DEVELOPIN, PNAME, SCOST

--34 Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT DEVELOPIN, AVG(DCOST) AS AvgDevCost, AVG(SCOST) AS AvgSellCost 
,IIF(SUM(SOLD)<>0,sum(SCOST)/sum(SOLD),0) AS AvgPrCopy
FROM software GROUP BY DEVELOPIN

--OR
SELECT AVG(DCOST) AS AVG_d_C , AVG(SCOST) AS AVG_s_c, AVG(SCOST*SOLD) AS AVG_p_copy, DEVELOPIN AS _LANGUAGE FROM software 
GROUP BY DEVELOPIN

--35 Display each programmer?s name, costliest and cheapest Packages Developed by him or her.
SELECT PNAME AS PROGRAMMER_NAME , MAX(DCOST), MIN(DCOST) FROM software GROUP BY PNAME 

--36 Display each institute name with number of Courses, Average Cost per Course.
SELECT INSTITUTE , COUNT(COURSE), AVG(COURSE_FEE) FROM studies GROUP BY INSTITUTE

--37 Display each institute Name with Number of Students.
SELECT INSTITUTE , COUNT(PNAME) FROM studies GROUP BY INSTITUTE

--38 Display Names of Male and Female Programmers. Gender also.
SELECT PNAME,GENDER FROM programmer GROUP BY GENDER,PNAME

---
SELECT PNAME, SUM(DCOST) AS SumDCOST, SUM(SCOST*SOLD) AS SumSCOST, SUM(SCOST*SOLD)-SUM(DCOST) AS SumDiffCOST
FROM software GROUP BY PNAME HAVING SUM(SCOST*SOLD)<SUM(DCOST)

--39 Display the Name of Programmers and Their Packages.
SELECT PNAME , DEVELOPIN AS PACKAGES FROM software GROUP BY DEVELOPIN, PNAME

--40 Display the Number of Packages in Each Language Except C and C++.
SELECT DEVELOPIN,SOLD, PNAME FROM software WHERE DEVELOPIN!='C' AND DEVELOPIN!='C++'

---
SELECT PNAME,COUNT(DEVELOPIN) FROM software GROUP BY PNAME

--41 Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT (DEVELOPIN) AS LANGUAGES, DCOST FROM software WHERE DCOST<1000 GROUP BY DEVELOPIN,DCOST

--42 Display AVG Difference between SCOST, DCOST for Each Package.
SELECT AVG(DCOST-SCOST) AS AVG_diff, DEVELOPIN AS PACKAGE FROM software GROUP BY DEVELOPIN
SELECT TITLE, AVG(DCOST) AS AVGDCOST, AVG(SCOST) AS AVGSCOST, AVG(DCOST)-AVG(SCOST) AS AVGCOSTDIFF
FROM software GROUP BY TITLE

--43 Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
SELECT PNAME, SUM(DCOST) AS SumDCOST, SUM(SCOST*SOLD) AS SumSCOST, SUM(SCOST*SOLD)-SUM(DCOST) AS SumDiffCOST
FROM software GROUP BY PNAME HAVING SUM(SCOST*SOLD)<SUM(DCOST)

--44 Display Highest, Lowest and Average Salaries for those earning more than 2000.
SELECT MAX(SALARY) AS HIGHEST,MIN(SALARY) AS LOWEST,AVG(SALARY) AS AVERAGE FROM programmer WHERE SALARY>2000  

--45 Who is the Highest Paid C Programmers?
SELECT MAX(SALARY) AS HIGHEST_PAID_PROGRAMMER, PNAME FROM programmer WHERE PROF1='C' OR PROF2='C' GROUP BY PNAME, SALARY ORDER BY SALARY DESC

--46 Who is the Highest Paid Female COBOL Programmer?
SELECT MAX(SALARY) AS HIGHEST_PAID_PROGRAMMER_COBOL, PNAME,GENDER FROM programmer WHERE PROF1='COBOL' OR PROF2='COBOL' GROUP BY PNAME, SALARY,GENDER HAVING GENDER='F' ORDER BY SALARY DESC

--47 Display the names of the highest paid programmers for each Language.
SELECT MAX(SALARY) AS HIGHEST_PAID_PROGRAMMER , PROF1, PROF2,PNAME FROM programmer GROUP BY PROF1,PROF2,SALARY,PNAME ORDER BY MAX(SALARY) DESC


CREATE TABLE #PLangSal(PROF VARCHAR(20), SAL INT)

INSERT INTO #PLangSal 
SELECT PROF1, MAX(SALARY) AS HighestPay FROM programmer
GROUP BY PROF1

INSERT INTO #PLangSal 
SELECT PROF2, MAX(SALARY) AS HighestPay FROM programmer
GROUP BY PROF2

CREATE TABLE #PLangSalMax(PROF VARCHAR(20), SAL INT)

INSERT INTO #PLangSalMax
SELECT PROF, MAX(SAL) FROM #PLangSal GROUP BY PROF

SELECT PNAME,PROF,SAL FROM programmer INNER JOIN #PLangSalMax
ON PROF=PROF1 OR PROF=PROF2
WHERE SAL=SALARY
ORDER BY PROF desc

--48 Who is the least experienced Programmer.

SELECT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPRNCE FROM programmer
WHERE DATEDIFF(YY,DOJ,GETDATE()) = (SELECT MIN(DATEDIFF(YY,DOJ,GETDATE()))FROM programmer)

--49 Who is the most experienced male programmer knowing PASCAL.
SELECT MAX(DATEDIFF(YY,DOJ,GETDATE())) AS MOST_EXPERIENCED,PNAME,GENDER,PROF1,PROF2 FROM programmer WHERE PROF1='PASCAL' OR PROF2='PASCAL' GROUP BY DOJ,PNAME,GENDER,PROF1,PROF2 HAVING GENDER='M' ORDER BY  MAX(DATEDIFF(YY,DOJ,GETDATE())) DESC

SELECT DISTINCT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPRNCE FROM programmer
WHERE DATEDIFF(DD,DOJ,GETDATE()) = (SELECT MAX(DATEDIFF(DD,DOJ,GETDATE())) FROM programmer WHERE GENDER='M' AND PROF1='PASCAL' OR PROF2='PASCAL')

--50 Which Language is known by only one Programmer?
select prof1 from programmer
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

--51 Who is the Above Programmer Referred in 50?
CREATE TABLE #PSLang(PROF VARCHAR(20))

INSERT INTO #PSLang 
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer INNER JOIN #PSLang ON
PROF=PROF1 OR PROF=PROF2


SELECT * FROM programmer 
--52 Who is the Youngest Programmer knowing DBASE?
SELECT MIN(DATEDIFF(YY,DOB,GETDATE())) AS YOUNGEST_prog,PNAME, PROF1, PROF2 FROM programmer WHERE PROF1= 'DBASE' OR PROF2='DBASE'  GROUP BY DOB,PNAME,PROF1,PROF2 ORDER BY  MIN(DATEDIFF(YY,DOB,GETDATE()))

SELECT PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE()) =
(
SELECT MIN(DATEDIFF(DD,DOB,GETDATE())) FROM programmer 
WHERE 'DBASE' IN (PROF1,PROF2)
)

--53 Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT PNAME, SALARY ,GENDER ,PROF1,PROF2  FROM [dbo].[programmer] WHERE PROF1!='C++' AND PROF1!='C' AND PROF1!= 'ORACLE' AND PROF1!= 'DBASE' AND PROF2!='C' AND PROF2!='C++' AND PROF2!='ORACLE' AND PROF2!='DBASE' AND GENDER ='F'
GROUP BY SALARY,PNAME,GENDER,PROF1,PROF2
HAVING SALARY>3000 ORDER BY GENDER

--ALTERNATIVE 53
SELECT * FROM programmer WHERE SALARY>3000 AND GENDER='F' AND
PROF1 NOT IN ('C','CPP','ORACLE','DBASE') AND PROF2 NOT IN ('C','CPP','ORACLE','DBASE')

--54 Which Institute has most number of Students?
SELECT PNAME, MAX(INSTITUTE) FROM studies GROUP BY PNAME,INSTITUTE ORDER BY MAX(INSTITUTE) DESC

CREATE TABLE #InstStudNo (InsNam VARCHAR(20), StdNo INT)

INSERT INTO #InstStudNo
SELECT INSTITUTE,COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT InsNam,StdNo AS COUNT_OF_STUDENTS FROM #InstStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM #InstStudNo)

---54 Which Institute has most number of Students?
SELECT  COUNT(INSTITUTE) FROM studies GROUP BY INSTITUTE ORDER BY COUNT(INSTITUTE) DESC


--55 What is the Costliest course?
SELECT MAX(COURSE_FEE) AS COSTLIEST , COURSE FROM studies GROUP BY COURSE, COURSE_FEE ORDER BY (COURSE_FEE) DESC

SELECT COURSE, COURSE_FEE FROM studies
WHERE COURSE_FEE=(SELECT MAX(COURSE_FEE) FROM studies)


SELECT*FROM [dbo].[studies]
--56 Which course has been done by the most of the Students?
select COUNT(COURSE),COURSE FROM studies GROUP BY COURSE ORDER BY COUNT (COURSE) DESC


CREATE TABLE #CourStudNo (CourNam VARCHAR(20), StdNo INT)

INSERT INTO #CourStudNo
SELECT COURSE,COUNT(PNAME) FROM studies GROUP BY COURSE

SELECT CourNam,StdNo AS COUNT_OF_STUDENTS FROM #CourStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM #CourStudNo)


--57 Which Institute conducts costliest course.
SELECT MAX(COURSE_FEE) AS COSTLEST_COURSE, INSTITUTE FROM studies GROUP BY INSTITUTE,COURSE ORDER BY MAX(COURSE_FEE) DESC
--57 Which Institute conducts costliest course.
SELECT INSTITUTE,COURSE_FEE FROM studies
WHERE COURSE_FEE=(SELECT MAX(COURSE_FEE) FROM studies)

SELECT COURSE_FEE AS COSTLIEST_FEE, INSTITUTE FROM STUDIES WHERE COURSE_FEE=(SELECT MAX(COURSE_FEE) FROM STUDIES)



SELECT INSTITUTE , COURSE , AVG(COURSE_FEE) AS AVG_C FROM studies GROUP BY COURSE, COURSE_FEE, INSTITUTE HAVING COURSE_FEE<AVG(COURSE_FEE) ORDER BY COURSE_FEE

--58 Display the name of the Institute and Course, which has below AVG course fee.
SELECT AVG(COURSE_FEE) FROM studies GROUP BY COURSE_FEE ORDER BY AVG(COURSE_FEE) DESC


--59 Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee.
SELECT COURSE, COURSE_FEE FROM studies WHERE 
COURSE_FEE<(SELECT AVG (COURSE_FEE)+1000 FROM Studies) AND COURSE_FEE> (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES)


--60 Which package has the Highest Development cost?
 SELECT * FROM software
SELECT MAX(DCOST) AS HDC , DEVELOPIN FROM software  GROUP BY DCOST, DEVELOPIN HAVING DCOST= MAX(DCOST) ORDER BY MAX(DCOST) DESC

--60 RECORD WISE ALTERNATIVE
SELECT TITLE, DCOST FROM software WHERE DCOST = 
(SELECT MAX(DCOST) FROM software)


--61 Which course has below AVG number of Students?
CREATE TABLE #AVGCNT (CRS VARCHAR(20), CNT INT)

INSERT INTO #AVGCNT
SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE

SELECT CRS,CNT FROM #AVGCNT WHERE CNT <=
(SELECT AVG(CNT) FROM #AVGCNT)

--62 Which Package has the lowest selling cost?
SELECT PNAME,TITLE, SCOST,DEVELOPIN FROM software WHERE SCOST=
(SELECT MIN(SCOST) FROM Software)

--63 Who Developed the Package that has sold the least number of copies?
 SELECT SOLD AS L_SOLD, PNAME , DEVELOPIN FROM SOFTWARE WHERE SOLD=(SELECT MIN(SOLD) FROM software) 

 --64 Which language has used to develop the package, which has the highest sales amount?
 SELECT (SCOST) AS HIGHEST_S_A , DEVELOPIN AS LANGUAGE_ FROM software WHERE SCOST=(SELECT MAX(SCOST ) FROM software) GROUP BY SCOST,SOLD , DEVELOPIN ORDER BY MAX(SCOST)DESC
 
 --65 How many copies of package that has the least difference between development and selling cost where sold.
 SELECT TITLE, SOLD, DCOST-SCOST as LEAST_DIFFCOST FROM Software
WHERE DCOST-SCOST= (SELECT MIN( DCOST-SCOST)FROM Software)

--66 Which is the costliest package developed in PASCAL.
 SELECT DCOST AS COSTLIEST_PACKAGE , DEVELOPIN FROM software WHERE DCOST =(SELECT MAX(DCOST) FROM Software  WHERE DEVELOPIN = 'PASCAL' )

 --67 Which language was used to develop the most number of Packages.
 SELECT DEVELOPIN AS LANGUAGES , COUNT(DEVELOPIN) AS M_NO_P FROM software GROUP BY DEVELOPIN ORDER BY COUNT(DEVELOPIN) DESC
 
 --67 ALTERNATIVE ROW WISE

 CREATE TABLE #DEVCNT (LANG VARCHAR(20), CNT INT)

INSERT INTO #DEVCNT
SELECT DEVELOPIN, COUNT(TITLE) FROM software GROUP BY DEVELOPIN

SELECT LANG, CNT FROM #DEVCNT WHERE CNT=
(SELECT MAX(CNT) FROM #DEVCNT)

--68 Which programmer has developed the highest number of Packages?
CREATE TABLE #PRGCNT (PN VARCHAR(20), CNT INT)

INSERT INTO #PRGCNT
SELECT PNAME, COUNT(TITLE) FROM software GROUP BY PNAME

SELECT PN, CNT FROM #PRGCNT WHERE CNT=
(SELECT MAX(CNT) FROM #PRGCNT)
--68 Which programmer has developed the highest number of Packages?
SELECT COUNT(DEVELOPIN) AS H_NO_P, PNAME  AS PROGRAMMER FROM SOFTWARE GROUP BY PNAME ORDER BY COUNT(DEVELOPIN) DESC

--69 Who is the Author of the Costliest Package?
SELECT PNAME, DCOST FROM Software
WHERE DCOST= (SELECT MAX(DCOST)FROM Software)

SELECT DCOST AS COSTLIEST_P, PNAME AS AUTHOR FROM software WHERE DCOST=(SELECT MAX(DCOST)FROM Software) GROUP BY PNAME, DCOST ORDER BY MAX(DCOST) DESC

--70 Display the names of the packages, which have sold less than the AVG number of copies.
SELECT SOLD AS AVG_c_p,DEVELOPIN AS PACKAGES , TITLE FROM software GROUP BY DEVELOPIN , SOLD, TITLE HAVING SOLD<(SELECT AVG(SOLD) FROM SOFTWARE) ORDER BY DEVELOPIN DESC

SELECT TITLE,SOLD,DEVELOPIN FROM Software
WHERE SOLD<(SELECT AVG(SOLD) FROM Software)

--71 Who are the authors of the Packages, which have recovered more than double the Development cost?
SELECT PNAME AS AUTHOR , (SOLD*SCOST) AS RECOVERED FROM software WHERE (DCOST*2)<(SOLD*SCOST) GROUP BY  PNAME, SCOST, DCOST ,SOLD 

SELECT PNAME, TITLE FROM Software WHERE SOLD*SCOST> 2*DCOST

--72 Display the programmer Name and the cheapest packages developed by them in each language.
SELECT PNAME AS PROGRAMMER_NAME , DCOST AS MIN_DCOST, DEVELOPIN AS PACKAGE FROM software WHERE DCOST=(SELECT MIN(DCOST) FROM software) GROUP BY DEVELOPIN , PNAME,DCOST ORDER BY DEVELOPIN

--73 Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT DEVELOPIN AS LANGUAGES, PNAME, (SCOST*SOLD) AS selling_package  FROM software  GROUP BY DEVELOPIN , PNAME,SOLD,SCOST ORDER BY (SCOST*SOLD) desc

SELECT PNAME, DEVELOPIN, 'HIGHEST' FROM Software 
WHERE SOLD IN (SELECT MAX(SOLD) FROM Software) UNION 
SELECT PNAME, DEVELOPIN, 'LOWEST' FROM Software WHERE SOLD IN 
(SELECT MIN(SOLD) FROM Software)

--74 Who is the youngest male Programmer born in 1965?
SELECT DATEDIFF(YY,DOB,GETDATE()), PNAME AS PROGRAMMER , GENDER FROM programmer WHERE GENDER ='M' AND YEAR(DOB)=1965  GROUP BY DOB, PNAME, GENDER ORDER BY MIN( DATEDIFF(YY,DOB,GETDATE()))

SELECT PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
(SELECT MIN(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE  year(DOB)=1965 AND GENDER='M')

--75 Who is the oldest Female Programmer who joined in 1992?
SELECT DATEDIFF(YY,DOJ,GETDATE()), PNAME AS PROGRAMMER , GENDER FROM programmer WHERE GENDER ='F' AND YEAR(DOJ)=1992 GROUP BY DOJ, PNAME, GENDER ORDER BY MIN( DATEDIFF(YY,DOJ,GETDATE()))

SELECT PNAME,DOB,YEAR(DOJ) FROM Programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
(SELECT MAX(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE YEAR(DOJ) ='1992');


--76 In which year was the most number of Programmers born.
CREATE TABLE #TEMPY_M_pBORN (YOB INT, CNT INT)

INSERT INTO #TEMPY_M_pBORN
SELECT YEAR(DOB),COUNT(YEAR(DOB)) FROM programmer GROUP BY YEAR(DOB)

SELECT YOB, CNT FROM #TEMPY_M_pBORN
WHERE CNT= (SELECT MAX(CNT) FROM #TEMPY_M_pBORN)

--77 In which month did most number of programmers join?
SELECT COUNT(DOJ) AS COUNTOF_DOJ , MONTH(DOJ) AS JOINED_MONTH_mj FROM PROGRAMMER GROUP BY DOJ ORDER BY COUNT(DOJ) DESC

CREATE TABLE #MOJ (MOJ INT , CNT INT)
INSERT INTO #MOJ
SELECT MONTH(DOJ),COUNT (MONTH(DOJ)) FROM PROGRAMMER GROUP BY MONTH(DOJ)

 SELECT MOJ,CNT FROM #MOJ WHERE CNT=(SELECT MAX(CNT) FROM #MOJ)

 --78 In which language are most of the programmer?s proficient.
 CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2


INSERT INTO #PsCNT
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)

--79 Who are the male programmers earning below the AVG salary of Female Programmers?
SELECT PNAME,SALARY FROM PROGRAMMER  WHERE GENDER ='M' AND 
SALARY<(SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER ='F')
SELECT*FROM programmer

--80 Who are the Female Programmers earning more than the Highest Paid?
SELECT PNAME,SALARY FROM PROGRAMMER  WHERE GENDER ='F' AND 
SALARY<(SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER ='M')

SELECT MAX(SALARY) AS HIGHEST_PAID, GENDER , PNAME AS F_PROG FROM programmer WHERE GENDER = 'F' GROUP BY SALARY , PNAME,GENDER ORDER BY MAX(SALARY) DESC

--81 Which language has been stated as the proficiency by most of the Programmers?
SELECT MAX(DATEDIFF(YY,DOJ,GETDATE())) AS PROFICIENT_LEVEL,PNAME FROM programmer  GROUP BY DOJ, PNAME  ORDER BY MAX(DATEDIFF(YY,DOJ,GETDATE()))

 CREATE TABLE #PCNT1 (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT1 (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT1
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2


INSERT INTO #PsCNT1
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT1 WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT1)


--82 Display the details of those who are drawing the same salary.

SELECT PNAME,DOB,DOJ,PROF1,PROF2,AVG(SALARY) AS ALMOST_SAME FROM PROGRAMMER GROUP BY PNAME,DOB,DOJ,PROF1,PROF2 ,SALARY ORDER BY SALARY

SELECT A.PNAME, A.SALARY FROM Programmer A
INNER JOIN PROGRAMMER B ON A.SALARY= B.SALARY AND A.PNAME<>B.PNAME
ORDER BY A.SALARY

--83 Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.

SELECT  T1.SALARY,T1.GENDER , T2.*FROM  programmer AS T1  JOIN software AS T2 
ON T1.PNAME=T2.PNAME
 WHERE SALARY>3000 AND GENDER ='M'

 --OR
 --83
 SELECT * FROM software WHERE PNAME IN 
(SELECT PNAME FROM programmer WHERE SALARY>3000 AND GENDER='M')


--84 Display the details of the packages developed in Pascal by the Female Programmers.
SELECT  T1.PROF1,T1.GENDER,T1.PROF2 , T2.DEVELOPIN ,T2.PNAME FROM  programmer AS T1  JOIN software AS T2 
ON T1.PNAME=T2.PNAME
 WHERE DEVELOPIN ='PASCAL' AND GENDER ='F'

SELECT PNAME  , DEVELOPIN AS SOFTWARE_DEVE, TITLE FROM software WHERE DEVELOPIN='PASCAL' GROUP BY PNAME,DEVELOPIN ,TITLE ----DOUBT JOIN

--85 Display the details of the Programmers who joined before 1990.
SELECT [PNAME],[DOB],[DOJ],[GENDER],[PROF1],[PROF2],[SALARY] FROM programmer WHERE YEAR(DOJ)<1990

--86 Display the details of the Software Developed in C By female programmers of Pragathi.
SELECT SW.*,P.GENDER,ST.INSTITUTE FROM studies AS ST, software AS SW, programmer AS P
WHERE P.PNAME=SW.PNAME AND ST.PNAME=SW.PNAME AND
GENDER='F' AND INSTITUTE='PRAGATHI' AND DEVELOPIN='C'

SELECT DISTINCT T1.[GENDER],T2.[DEVELOPIN],T3.[INSTITUTE], T3.PNAME FROM [dbo].[programmer] AS T1 ,[dbo].[software] AS T2 , [dbo].[studies]AS T3 
WHERE DEVELOPIN='C' AND GENDER='F' AND INSTITUTE='PRAGATHI'

--87 Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
SELECT INSTITUTE, COUNT(SW.TITLE) AS PKGCNT, COUNT(SW.SOLD) AS SALESCNT, SUM(SCOST*SOLD) AS SALVAL
FROM software AS SW JOIN studies AS ST 
ON SW.PNAME=ST.PNAME
GROUP BY INSTITUTE 

--88 Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
CREATE TABLE #INST (INS VARCHAR(20), CNT INT)

INSERT INTO #INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT DISTINCT SW.* FROM software AS SW, programmer AS PG, studies AS ST, #INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM #INST)

--89 Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
SELECT S.*, YEAR(DOB),GENDER FROM Programmer p JOIN Software s 
ON s.PNAME=p.PNAME
WHERE
((GENDER='M' AND YEAR(DOB)<1965) AND (GENDER='F' AND YEAR(DOB)>1975))

--90 Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
SELECT SW.*,PG.PROF1,PG.PROF2 from Software AS SW JOIN programmer AS PG  ON PG.PNAME = SW.PNAME
WHERE PG.PROF1 <> SW.DEVELOPIN AND PG.PROF2 <> SW.DEVELOPIN 

--91 Display the details of the software developed by the male students of Sabhari.
SELECT T1.*, T2.INSTITUTE ,T3.GENDER FROM software AS T1 JOIN studies AS T2 
ON T1.PNAME = T2.PNAME JOIN  programmer AS T3 ON T2.PNAME=T3.PNAME 
WHERE GENDER='M' AND INSTITUTE ='SABHARI'

--92 Display the names of the programmers who have not developed any packages.
SELECT PNAME FROM Programmer 
	WHERE PNAME NOT IN (SELECT PNAME from Software)

--93 What is the total cost of the Software developed by the programmers of Apple?
SELECT SUM(SCOST) ,ST.INSTITUTE FROM Software s,Studies st 
WHERE s.PNAME=st.PNAME and INSTITUTE='APPLE' GROUP BY SCOST, INSTITUTE

--94 Who are the programmers who joined on the same day?
SELECT DISTINCT A.PNAME, A.DOJ FROM programmer AS A INNER JOIN programmer AS B
ON A.DOJ=B.DOJ WHERE A.PNAME<>B.PNAME ORDER BY A.DOJ

--95 Who are the programmers who have the same Prof2?
SELECT DISTINCT A.PNAME, A.PROF2 FROM programmer AS A INNER JOIN programmer AS B
ON A.PROF2=B.PROF2 WHERE A.PNAME<>B.PNAME ORDER BY A.PROF2

--96 Display the total sales value of the software, institute wise.
SELECT Studies.INSTITUTE,sum(Software.SOLD*Software.SCOST) from Software JOIN Studies 
	ON Studies.PNAME=Software.PNAME group by Studies.INSTITUTE

--97 In which institute does the person who developed the costliest package studied.
SELECT INSTITUTE, SW.PNAME, DCOST FROM studies AS ST, software AS SW 
WHERE ST.PNAME = SW.PNAME AND DCOST= (SELECT MAX(DCOST) FROM software)

--98 Which language listed in prof1, prof2 has not been used to develop any package.
SELECT DISTINCT PROF1 FROM programmer WHERE PROF1 NOT IN (SELECT DEVELOPIN FROM software) UNION
SELECT DISTINCT PROF2 FROM programmer WHERE PROF2 NOT IN (SELECT DEVELOPIN FROM software)

--99 How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
SELECT T1.[SALARY], T2.[DEVELOPIN],T2.SOLD, T3.[COURSE] FROM PROGRAMMER AS T1 JOIN SOFTWARE AS T2 
ON T1.PNAME=T2.PNAME JOIN STUDIES AS T3 ON T2.PNAME=T3.PNAME 
WHERE SOLD= (SELECT MAX(SOLD) FROM software)


--100 What is the AVG salary for those whose software sales is more than 50,000/-.
select avg(Salary) from Programmer p JOIN Software s 
	ON p.PNAME=s.PNAME WHERE SOLD*SCOST >50000

--101 How many packages were developed by students, who studied in institute that charge the lowest course fee?

select distinct t2.[PNAME],[DEVELOPIN],[COURSE_FEE],[INSTITUTE],COUNT ( T1.[TITLE]) 
from [dbo].[software] as t1,[dbo].[studies] as t2
WHERE  COURSE_FEE = (SELECT MIN(COURSE_FEE) FROM Studies)
GROUP BY  T2.PNAME, DEVELOPIN,COURSE_FEE,INSTITUTE,TITLE

--OR 

SELECT PNAME, COUNT(TITLE) FROM software WHERE PNAME IN
(
SELECT PNAME FROM studies WHERE INSTITUTE =
(SELECT DISTINCT INSTITUTE FROM studies WHERE COURSE_FEE = (SELECT MIN(COURSE_FEE) FROM Studies))
)
	 
--102 How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?

SELECT TG.*, ST.INSTITUTE FROM studies AS ST INNER JOIN 
(
SELECT SW.PNAME, COUNT(TITLE) AS SWCNT 
--INSTITUTE 
FROM software AS SW 
--INNER JOIN studies AS ST ON SW.PNAME=ST.PNAME
WHERE SW.PNAME = (SELECT PNAME FROM software WHERE DCOST = (SELECT MIN(DCOST) FROM software)) 
GROUP BY SW.PNAME
) AS TG
ON ST.PNAME = TG.PNAME

--103 How many packages were developed by the female programmers earning more than the highest paid male programmer?
SELECT COUNT(TITLE) from Programmer p,Software s 
WHERE s.PNAME=p.PNAME and GENDER='F'
AND SALARY>(SELECT MAX(SALARY) FROM programmer WHERE GENDER='M')

--104 How many packages are developed by the most experienced programmer form BDPS.
SELECT COUNT(TITLE) FROM software WHERE PNAME = 
(
	SELECT PG.PNAME, DOJ FROM programmer AS PG 
	WHERE DATEDIFF(DD,DOJ,GETDATE())= 
		(SELECT MAX(DATEDIFF(DD,DOJ,GETDATE())) 
		FROM programmer AS PG, studies AS ST
		WHERE PG.PNAME=ST.PNAME AND PG.PNAME IN (SELECT PNAME FROM studies WHERE INSTITUTE='BDPS'))
		AND PG.PNAME IN (SELECT PNAME FROM studies WHERE INSTITUTE='BDPS')
)

--105 List the programmers (form the software table) and the institutes they studied.

SELECT PNAME,INSTITUTE from studies WHERE PNAME IN (SELECT PNAME from software)


--106 List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.
SELECT DEVELOPIN,sum(SCOST*SOLD-DCOST) AS PROFIT, COUNT(1) AS PROG_CNT from Software 
WHERE DEVELOPIN IN 
((SELECT PROF1 FROM Programmer) UNION ALL (SELECT PROF2 FROM Programmer))
GROUP BY DEVELOPIN

--107 List the programmer names (from the programmer table) and No. Of Packages each has developed.
SELECT PG.PNAME,count(TITLE) FROM programmer AS PG,software AS SW 
WHERE PG.PNAME=SW.PNAME GROUP BY PG.PNAME;



