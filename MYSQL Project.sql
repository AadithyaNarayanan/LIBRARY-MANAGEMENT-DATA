CREATE DATABASE LIBRARY;

USE LIBRARY;

CREATE TABLE BRANCH (
Branch_no INT PRIMARY KEY,
Manager_id INT,
Branch_address VARCHAR(25),
Contact_no BIGINT);


INSERT INTO BRANCH VALUES 
(1,101,'Murry Street', 757489347),
(2,102,'Randall Drive',808933397),
(3,103,'Patterson Fork Road', 312657942),
(4,104,'Old House Drive', 740934862),
(5,105,'West Fork Street',406497476),
(6,106,'Pinewood Drive',847881368),
(7,107,'Freed Drive',209745743),
(8,108,'Grove Street',631791108),
(9,109,'Ingram Road',336662485),
(10,110,'Sumner Street',310661207);

CREATE TABLE EMPLOYEE (
Emp_id INT PRIMARY KEY,
Emp_name VARCHAR(20),
Position VARCHAR(20),
Salary INT ,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES BRANCH (Branch_no)
);

INSERT INTO EMPLOYEE VALUES 
(001,'Jordan Perez','Library Director',65000,1),
(002,'Nova Rosales','Data Librarian',54000,2),
(003,'Martha Berg','Head Librarian',58000,3),
(004,'Angel Leach','Medical Librarian',60000,4),
(005,'Edward Lu','Digital Librarian',45000,5),
(006,'Noor Henry','Library Manager',57000,6),
(007,'Leo Wiley','Access Service',40000,7),
(008,'Allen Sellers','Archivist',35000,8),
(009,'Peter Parkor','Low Librarian',42000,9),
(010,'Steve Harrington','Adult Service',60000,10);

CREATE TABLE BOOKS (
ISBN BIGINT PRIMARY KEY,
Book_title VARCHAR(40),
Category VARCHAR(40),
Rental_price INT,
Status VARCHAR(10),
Author VARCHAR(40),
Publisher Varchar(25)
);


INSERT INTO BOOKS VALUES 
(9787824692390,'Goat Brothers','History,General',500,'Yes','Colton,Larry','Doubleday'),
(9787738135884,'The Missing Person','Fiction,General',450,'No','Grumbach, Doris','Putnam Pub Group'),
(9782734037606,'Journey Through Heartsongs','Poetry,General',550,'No','Stepanek, Mattie J.T.','VSP Books'),
(9781399398916,'Christmas Cookies','Cooking,General',600,'Yes','Katherine M ,Deaman','Oxmoor House'),
(9787284147782,'The Genesis of Ethics','Religion,Ethics',700,'Yes','Visotzky, Burton L','Crown'),
(9780153712678,'Personality of the Cat','Pets,Cats,General',400,'No','Aymar, Brandt','Bonanza Books'),
(9780792371311,'Shadow Song','Fiction,General',570,'Yes','Kay, Terry','Atria Books'),
(9788223173886,'Sunset at Rosalie','Fiction,General',420,'Yes','McLaughlin, Ann L','Daniel & Daniel Pub'),
(9787147234284,'New Lands, New Men','Biography & Autobiography,Adventurers',800,'Yes',' Goetzmann, William H','Viking Adult'),
(9784887908932,'Great American Countryside','Travel,United States,General',660,'No','Landi, Val','Scribner');


CREATE TABLE CUSTOMER (
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(25),
Customer_address VARCHAR(30),
Reg_Date DATE
);

INSERT INTO CUSTOMER VALUES
(111,'Kaylie Murray','1581 Sycamore Road','2024-01-10'),
(112,'Clay Riley','99 Concord Street','2024-01-25'),
(113,'Ezra Mathews','998 Coolidge Street','2024-02-1'),
(114,'Sasha Lara','4342 Sugarfoot Lane','2024-02-12'),
(115,'Elisabeth ','4537 Tree Top Lane','2024-02-20'),
(116,'Johnny Nash','2431 Midway Road','2024-03-02'),
(117,'Levi','4706 Oakwood Circle','2024-03-16'),
(118,'Julius','3656 Timbercrest Road','2024-04-12'),
(119,'Victoria','1329 Michael Street','2024-05-05'),
(120,'Ben','4002 Oak Street','2024-05-10');

CREATE TABLE ISSUE_STATUS (
Issue_id INT PRIMARY KEY,
Issued_cust INT ,
FOREIGN KEY (Issued_cust) REFERENCES CUSTOMER (Customer_id),
Issued_book_name VARCHAR(40),
Issued_date DATE,
ISBN_book BIGINT,
FOREIGN KEY (ISBN_book) REFERENCES BOOKS (ISBN)
);

INSERT INTO ISSUE_STATUS VALUES 
(11,111,'Goat Brothers','2024-01-10',9787824692390),
(12,112,'The Missing Person','2024-01-25',9787738135884),
(13,113,'Journey Through Heartsongs','2024-02-1',9782734037606),
(14,114,'Christmas Cookies','2024-02-12',9781399398916),
(15,115,'The Genesis of Ethics','2024-02-20',9787284147782),
(16,116,'Personality of the Cat','2024-03-02',9780153712678),
(17,117,'Shadow Song','2024-03-16',9780792371311),
(18,118,'Sunset at Rosalie','2024-04-12',9788223173886),
(19,119,'New Lands, New Men','2024-05-05',9787147234284),
(20,120,'Great American Countryside','2024-05-10',9784887908932);

CREATE TABLE RETURN_STATUS (
Return_id INT PRIMARY KEY,
Return_Cust INT,
Return_book_name VARCHAR(40),
Return_date DATE ,
ISBN_book2 BIGINT,
FOREIGN KEY (ISBN_book2) REFERENCES BOOKS (ISBN)
);

INSERT INTO RETURN_STATUS VALUES 
(1001,111,'Goat Brothers','2024-01-20',9787824692390),
(1002,112,'The Missing Person','2024-02-05',9787738135884),
(1003,113,'Journey Through Heartsongs','2024-02-10',9782734037606),
(1004,114,'Christmas Cookies','2024-02-22',9781399398916),
(1005,115,'The Genesis of Ethics','2024-03-01',9787284147782),
(1006,116,'Personality of the Cat','2024-03-12',9780153712678),
(1007,117,'Shadow Song','2024-03-25',9780792371311),
(1008,118,'Sunset at Rosalie','2024-05-28',9788223173886),
(1009,119,'New Lands, New Men','2024-05-20',9787147234284),
(1010,120,'Great American Countryside','2024-05-30',9784887908932);

#1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,Category,Rental_price FROM BOOKS;

#2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name ,Salary FROM EMPLOYEE ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT I.Issued_book_name ,C.Customer_name
FROM ISSUE_STATUS I JOIN CUSTOMER C ON Issued_cust=Customer_id;

# 4. Display the total count of books in each category.
SELECT Count(*),Category FROM BOOKS GROUP BY Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name , Position , Salary FROM EMPLOYEE WHERE Salary > 50000;

#6. List the customer names who registered before 2024-02-01 and have not issued any books yet. 
SELECT Customer_name , Reg_date FROM CUSTOMER WHERE Reg_date < '2024-02-01';

#7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(Emp_id) AS Total_Employees
FROM EMPLOYEE GROUP BY Branch_no;

#8. Display the names of customers who have issued books in the month of February 2024.
SELECT C.Customer_name , I.Issued_date
FROM CUSTOMER C JOIN ISSUE_STATUS I ON Customer_id = Issued_cust
WHERE MONTH(I.Issued_date)=2 and YEAR(I.Issued_date) =2024;

#9. Retrieve book_title from book table containing History,General
SELECT Book_title , Category FROM BOOKS WHERE Category ="History,General";

#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
SELECT Branch_no, COUNT(Emp_id) AS Total_Employees
FROM EMPLOYEE GROUP BY Branch_no HAVING COUNT(Emp_id)>5;

#11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name , E.Branch_no , B.Branch_address
FROM EMPLOYEE E JOIN BRANCH B ON E.Branch_no = B.Branch_no;

#12. Display the names of customers who have issued books with a rental price higher than Rs. 250.
SELECT  C.Customer_name 
FROM CUSTOMER C JOIN ISSUE_STATUS I ON C.Customer_id = I.Issued_cust
JOIN BOOKS B ON I.ISBN_BOOK = B.ISBN 
WHERE B.Rental_price >250; 


