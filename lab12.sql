CREATE DATABASE CTYSoftWare
--
CREATE TABLE Employee
(
	EmployeeID	INT
	CONSTRAINT PK_EmployeeID_Employee PRIMARY KEY(EmployeeID),
	Name VARCHAR(100),
	Tel	CHAR(11)	,
	Email	VARCHAR(30)
)

CREATE TABLE Project
(
	ProjectID INT
	CONSTRAINT PK_ProjectID_Project PRIMARY KEY(ProjectID),
	ProjectName	VARCHAR(30),
	StarDate	DATETIME,
	EndDate	DATETIME,
	Period	INT,
	Cost MONEY
)
CREATE TABLE Leader
(
	LeaderID INT
	CONSTRAINT PK_LeaderID_Leader PRIMARY KEY(LeaderId),
	LeaderName	VARCHAR(30),
	Phone INT,
	Adreress VARCHAR(30)
)
CREATE TABLE Group1
(
	GroupID	INT
	CONSTRAINT PK_GroupID_Group1 PRIMARY KEY(GroupID),
	GroupName	VARCHAR(30),
	LeaderID	INT,
	ProjectID INT,
	CONSTRAINT FK_Project_Group1 FOREIGN KEY (ProjectID) REFERENCES Project,
	CONSTRAINT FK_Leader_Group1	FOREIGN KEY(LeaderID) REFERENCES  Leader
)
CREATE TABLE GroupDetail
(
	GroupID INT,
	EmployeeID	Int,
	Status	CHAR(20),
	CONSTRAINT FK_Employee_GroupDetail FOREIGN KEY (EmployeeID) REFERENCES Employee,
	CONSTRAINT FK_Group_GroupDetail FOREIGN KEY (GroupID) REFERENCES Group1

)
--Tao Bang
--Bnag Employee
INSERT INTO Employee VALUES('01','Van Phan','0355345','phanvanmai9898@gmail.com')
INSERT INTO Employee VALUES('02','Van Hai','0696433','haivanmai9898@gmail.com')
INSERT INTO Employee VALUES('03','Van Hung','083027432','hungvanle9898@gmail.com')
--
INSERT INTO Project VALUES('001','CNTT','2017-5-7','2018-5-7',12,'350000000')
INSERT INTO Project VALUES('002','Java','2017-4-5','2018-4-5',12,'550000000')
INSERT INTO Project VALUES('003','SQL','2016-5-7','2017-5-7',12,'3450000000')
--bang Leader
INSERT INTO Leader VALUES('100','Hai Huy',027973,'Ha Noi')
INSERT INTO Leader VALUES ('102','Vu Thuan',0729074,'Ha Noi')
--Bang Group
INSERT INTO Group1 VALUES('1','Phat Trien','100','001')
INSERT INTO Group1 VALUES('2','Quan Sat','100','002')
INSERT INTO Group1 VALUES('3','Tam Nhin','102','003')

--Bang GroupDetail
INSERT INTO GroupDetail VALUES('1','01','Dang Lam')
INSERT INTO GroupDetail VALUES('2','02','Dang Lam')
INSERT INTO GroupDetail VALUES('3','03','Dang Lam')
--3
--a
SELECT * From Employee
--b
SELECT EmployeeID,Name,ProjectName
FROM Employee,Project
WHERE ProjectName='Du An Chinh Phu'
--c
SELECT GroupID, SUM (EmployeeID) AS 'Tong so luong'
FROM GroupDetail
GROUP BY GroupID
--d
SELECT * From Leader
--e
SELECT EmployeeId,Name,StarDate
From Employee,Project
WHERE StarDate > '2010-10-12'
--f
SELECT Name,Status
From Employee,GroupDetail
WHERE Status='Sap Lam'
--g
SELECT Name,GroupID,Status
FROM Employee,GroupDetail
WHERE Status='Da lam'
--4
SELECT *
FROM Employee
WHERE Name IS NULL;
--c





