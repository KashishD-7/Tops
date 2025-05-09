create database ola;
use ola;

create table driver(
	d_id int primary key,
    d_name varchar(50),
    d_phone varchar(15),
    d_vehicle_model enum('Car', 'Bike', 'Rickshow', 'Activa') not null,
    d_vehicle_number varchar(20) unique
);

create table passenger(
	p_id int primary key,
    p_name varchar(50),
    p_phone varchar(15),
    p_vehicle_num varchar(20),
    foreign key (p_vehicle_num) references driver(d_vehicle_number)
);

INSERT INTO driver (d_id, d_name, d_phone, d_vehicle_model, d_vehicle_number) VALUES
(1, 'Ravi Kumar', '9876543210', 'Car', 'DL8CAF1234'),
(2, 'Sunita Sharma', '9123456789', 'Bike', 'MH12BK5678'),
(3, 'Amit Verma', '9988776655', 'Rickshow', 'UP14RK3344'),
(4, 'Preeti Singh', '9090909090', 'Activa', 'GJ18AC9090'),
(5, 'Rahul Mehra', '9812345678', 'Car', 'KA03MC7777');

select * from driver;

INSERT INTO passenger (p_id, p_name, p_phone, p_vehicle_num) VALUES
(1, 'Anjali Rao', '9811122233', 'DL8CAF1234'),
(2, 'Vikram Joshi', '9822334455', 'MH12BK5678'),
(3, 'Meena Patel', '9833445566', 'UP14RK3344'),
(4, 'Rajeev Nair', '9844556677', 'GJ18AC9090'),
(5, 'Kiran Deshmukh', '9855667788', 'KA03MC7777');

select * from passenger;

select * from driver inner join passenger on driver.d_vehicle_number = passenger.p_vehicle_num;

create table after_new_passenger(
	log_id int auto_increment primary key,
    p_id int,
    p_name varchar(50),
    p_vehicle_num varchar(20),
    log_time timestamp default current_timestamp
);

DELIMITER //

create trigger after_passenger_insert after insert on passenger
for each row begin
insert into after_new_passenger(p_id, p_name, p_vehicle_num)
values (new.p_id, new.p_name, new.p_vehicle_num);
end //

DELIMITER ;