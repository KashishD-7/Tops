create database try;
use try;

create table employees(
	Employee_id int auto_increment primary key,
    Name varchar (100),
    Position varchar(100),
    Salary decimal(10,2),
    Hire_Date date
);

create table employee_audit(
	Audit_id int auto_increment primary key,
    Employee_id int,
    Name varchar(100),
    Position varchar(100),
    Salary decimal(10,2),
    Hire_Date date,
    Action_Date timestamp default current_timestamp
);

insert into employees(Name, Position, Salary, Hire_Date) values
('John Doe', 'Software Engineer', 80000.00, '2022-01-15'),
('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'),
('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01');

select * from employees;

DELIMITER //
	
create trigger after_Employee_insert after insert on employees
for each row  begin insert into 
employee_audit(Employee_id, Name, Position, Salary, Hire_Date)
values (new.Employee_id, new.Name, new.Position, new.Salary, new.Hire_Date);

END//

DELIMITER ;

