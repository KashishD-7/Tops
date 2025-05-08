create database MarketCo;
use MarketCo;

create table Company(
	Company_id int primary key,
    Company_Name varchar(45),
    Street varchar(45),
    City varchar(45),
    State varchar(2),
    Zip varchar(10)
);

#1) Statement to create the Contact table 

create table Contact(
	Contact_id int primary key,
    Company_id int,
    First_Name varchar(45),
    Last_Name varchar(45),
    Street varchar(45),
    City varchar(45),
    State varchar(2),
    Zip varchar(10),
    lsMain boolean,
    Email varchar(45),
    Phone varchar(12),
    foreign key (Company_id) references Company(Company_id)
);
#2) Statement to create the Employee table

create table Employee(
	Employee_id int primary key,
    First_Name varchar(45),
    Last_Name varchar(45),
    Salary decimal(10, 2),
    Hire_Date date,
    Job_Title varchar(25),
    Email varchar(45),
    Phone varchar(12)
);

#3) Statement to create the ContactEmployee table
#HINT: Use DATE as the datatype for ContactDate. It allows you to store the
#date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014). 

create table Contact_Employee(
	Contact_Employee_id int primary key,
    Contact_id int,
    Employee_id int,
    Contact_Date date,
    Description varchar(100),
    foreign key (Contact_id) references Contact(Contact_id),
    foreign key (Employee_id) references Employee(Employee_id)
);

INSERT INTO Company (Company_id, Company_Name, Street, City, State, Zip) VALUES
(1, 'Toll Brothers', '123 Main St', 'Philadelphia', 'PA', '19103'),
(2, 'Google Inc.', '1600 Amphitheatre Pkwy', 'Mountain View', 'CA', '94043'),
(3, 'Apple Inc.', '1 Apple Park Way', 'Cupertino', 'CA', '95014'),
(4, 'Urban Outfitters, Inc.', '410 Terry Ave N', 'Seattle', 'WA', '98109'),
(5, 'Microsoft', '1 Microsoft Way', 'Redmond', 'WA', '98052'),
(6, 'Meta Platforms', '1 Hacker Way', 'Menlo Park', 'CA', '94025'),
(7, 'Urban Outfitters, Inc.', '100 Winchester Cir', 'Los Gatos', 'CA', '95032'),
(8, 'Adobe', '345 Park Ave', 'San Jose', 'CA', '95110'),
(9, 'Urban Outfitters, Inc.', '2200 Mission College Blvd', 'Santa Clara', 'CA', '95054'),
(10, 'Oracle', '500 Oracle Pkwy', 'Redwood City', 'CA', '94065'),
(11, 'Tesla, Inc.', '3500 Deer Creek Road', 'Palo Alto', 'CA', '94304');

INSERT INTO Contact (Contact_id, Company_id, First_Name, Last_Name, Street, City, State, Zip, lsMain, Email, Phone) VALUES
(1, 1, 'John', 'Smith', '123 Main St', 'Philadelphia', 'PA', '19103', TRUE, 'john.smith@toll.com', '215-555-1111'),
(2, 2, 'Mary', 'Johnson', '456 Oak Ave', 'Mountain View', 'CA', '94043', TRUE, 'mary.j@google.com', '650-555-2222'),
(3, 3, 'James', 'Brown', '789 Elm Rd', 'Cupertino', 'CA', '95014', FALSE, 'jbrown@apple.com', '408-555-3333'),
(4, 4, 'Linda', 'Davis', '101 Pine St', 'Seattle', 'WA', '98101', TRUE, 'lindad@amazon.com', '206-555-4444'),
(5, 5, 'Robert', 'Wilson', '202 Maple Dr', 'Redmond', 'WA', '98052', TRUE, 'robertw@microsoft.com', '425-555-5555'),
(6, 6, 'Patricia', 'Garcia', '303 Cedar Ln', 'Menlo Park', 'CA', '94025', FALSE, 'patricia@meta.com', '650-555-6666'),
(7, 7, 'Michael', 'Martinez', '404 Birch Ct', 'Los Gatos', 'CA', '95032', TRUE, 'mmartinez@netflix.com', '408-555-7777'),
(8, 8, 'Barbara', 'Rodriguez', '505 Spruce Blvd', 'San Jose', 'CA', '95110', FALSE, 'barbara@adobe.com', '408-555-8888'),
(9, 9, 'William', 'Lee', '606 Walnut Pl', 'Santa Clara', 'CA', '95054', TRUE, 'wlee@intel.com', '408-555-9999'),
(10, 10, 'Elizabeth', 'Hernandez', '707 Chestnut Way', 'Redwood City', 'CA', '94063', TRUE, 'elizabeth@oracle.com', '650-555-1010'),
(11, 11, 'Dianne', 'Connor', '808 Maple St', 'Palo Alto', 'CA', '94304', FALSE, 'dianne.connor@tesla.com', '650-555-1212');

INSERT INTO  Employee (Employee_id, First_Name, Last_Name, Salary, Hire_Date, Job_Title, Email, Phone) VALUES
(1, 'Lesley', 'Bland', 75000.00, '2020-06-15', 'Sales Manager', 'lesley.bland@company.com', '215-445-5800'),
(2, 'Anna', 'Taylor', 68000.00, '2019-04-20', 'Account Executive', 'anna.t@company.com', '215-555-1234'),
(3, 'David', 'Miller', 80000.00, '2018-11-05', 'Regional Manager', 'd.miller@company.com', '215-555-5678'),
(4, 'Susan', 'Anderson', 72000.00, '2021-01-10', 'Project Lead', 'susan.anderson@company.com', '215-555-9012'),
(5, 'Charles', 'Thomas', 65000.00, '2022-03-17', 'Developer', 'charles.t@company.com', '215-555-3456'),
(6, 'Nancy', 'Jackson', 60000.00, '2023-07-22', 'QA Engineer', 'nancy.jackson@company.com', '215-555-7890'),
(7, 'Kevin', 'White', 78000.00, '2020-09-09', 'Team Lead', 'kevin.white@company.com', '215-555-2345'),
(8, 'Emily', 'Harris', 71000.00, '2019-05-30', 'HR Manager', 'emily.harris@company.com', '215-555-6789'),
(9, 'Brian', 'Clark', 64000.00, '2017-12-18', 'Support Engineer', 'brian.clark@company.com', '215-555-1122'),
(10, 'Karen', 'Lewis', 69000.00, '2021-08-01', 'Analyst', 'karen.lewis@company.com', '215-555-3344'),
(11, 'Jack', 'Lee', 67000.00, '2022-06-01', 'Business Analyst', 'jack.lee@company.com', '215-555-4455');

INSERT INTO Contact_Employee (Contact_Employee_id, Contact_id, Employee_id, Contact_Date, Description) VALUES
(1, 1, 1, '2024-04-01', 'Initial contact with Toll Brothers.'),
(2, 2, 2, '2024-04-03', 'Scheduled demo with Google.'),
(3, 3, 3, '2024-04-05', 'Follow-up with Apple.'),
(4, 4, 4, '2024-04-07', 'Requirements meeting with Amazon.'),
(5, 5, 5, '2024-04-10', 'Discussed partnership with Microsoft.'),
(6, 6, 6, '2024-04-12', 'Introductory call with Meta.'),
(7, 7, 7, '2024-04-15', 'Demo presentation to Netflix.'),
(8, 8, 8, '2024-04-18', 'UX discussion with Adobe.'),
(9, 9, 9, '2024-04-20', 'Follow-up on tech specs with Intel.'),
(10, 10, 10, '2024-04-22', 'Negotiation with Oracle.'),
(11, 11, 11, '2024-04-25', 'Introductory meeting with Dianne Connor.');

select * from Company;

select * from Contact;

select * from Employee;

select * from Contact_Employee;

#4) In the Employee table, the statement that changes Lesley Bland’s phone number
#to 215-555-8800
 
update Employee set Phone = '215-555-8800' where First_Name = 'Lesley' and Last_Name = 'Bland';

#5) In the Company table, the statement that changes the name of “Urban
#Outfitters, Inc.” to “Urban Outfitters” . 

update Company set Company_Name = 'Urban Outfitters' where Company_Name = 'Urban Outfitters, Inc.';

#6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
#event with Jack Lee (one statement).
#HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove

delete from Contact_Employee where Contact_Employee_id = 11;

#7) Write the SQL SELECT query that displays the names of the employees that
#have contacted Toll Brothers (one statement). Run the SQL SELECT query in
#MySQL Workbench. Copy the results below as well. 

select Employee.First_Name, Employee.Last_Name from Employee 
join Contact_Employee on Employee.Employee_id = Contact_Employee.Employee_id
join Contact on Contact_Employee.Contact_id = Contact.Contact_id
join Company on Contact.Company_id = Company.Company_id
where Company.Company_Name = 'Toll Brothers';

#8) What is the significance of “%” and “_” operators in the LIKE statement?

select * from Employee where First_Name like 'A%';

select * from Employee where First_Name like '___cy';

#9) Explain normalization in the context of databases. 
Normalization is the process of organizing data in a database. 
It includes creating tables and establishing relationships between those tables according 
to rules designed both to protect the data and to make the database more flexible by eliminating redundancy 
and inconsistent dependency.

#10) What does a join in MySQL mean?
join operation combines rows from two or more tables based on a related column, 
allowing you to retrieve data that spans multiple tables. This is a fundamental 
operation in relational databases for querying data from different tables simultaneously. 

#11)What do you understand about DDL, DCL, and DML in MySQL? 
DDL stands for Data Definition Language, which defines the structure or schema of the database. 
DML, or the Data Manipulation Language, helps us deal with managing and manipulating data in the database. 
DCL, or the Data Control Language, helps us deal with controls, rights, and permission in the database system.

#12)What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
The JOIN clause in MySQL is used to combine rows from two or more tables based on a related column.
It allows you to retrieve related data stored across multiple tables in a single result set.
Connects tables that share a relationship.
Enables complex queries involving multiple tables. Helps normalize data.
INNER JOIN = Returns only the rows that have matching values in both tables. Most commonly used.
LEFT JOIN = Returns all rows from the left table, and matched rows from the right table. If no match, right side will be NULL.
RIGHT JOIN = Returns all rows from the right table, and matched rows from the left table. If no match, left side will be NULL.
FULL JOIN = Returns all rows when there is a match in either left or right table.
CROSS JOIN = Returns the Cartesian product of the two tables. Usually not used unless intentional.
SELF JOIN = Joins a table to itself. Useful for comparing rows within the same table.


