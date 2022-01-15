/*Project 3 – Relational Database Design*/

/*1. Creating Schema User_roles*/
create schema User_roles

/*2. Creating Table Role*/
Create table Role (ID int primary key, role_name varchar(100) );

/* 2.1 Inserting values into Role table */
Insert into Role(ID,role_name) values
(101,'Admin'),
(102,'Power_User'),
(103,'User'),
(104,'Power_admin')

select * from Role

/* 3. Creating User_account */
Create table User_account 
(
	ID int primary key,
	user_name varchar(100),
	email varchar(254),
	password varchar(200),
	password_salt varchar(50) ,
	password_hash_algorithm varchar(50)
)

/* 3.1 Inserting values into User_account */
insert into User_account(ID,user_name,email,password,password_salt,password_hash_algorithm) values
(1,'Dave','Dave@gmail.com','dave123','SDave123','HADave123'),
(2,'Debbie','Debbie@gmail.com','deb123','Sdebbie123','HAdebbie123'),
(3,'Grill','Grill@gmail.com','Grill123','SGrill123','HAGrill123')

select * from User_account

/*4. Creating Table User_has_role 
 NOTE: Change datatype for role_start_time and role_end_time from timestamp to datetime 
 as SQL allows only one column with timestamp */

create table User_has_role
(
	id int primary key,
	role_start_time datetime,
	role_end_time datetime,
	user_account_id int,
	role_id int,
	foreign key(user_account_id)references User_account(ID),
	foreign key(role_id)references Role(ID)
)

/*4.1 Insert into table User_has_roles */
insert into User_has_role values
( 1001,'2010-01-20','2010-01-30',1,101),
(1002,'2011-05-01','2011-05-30',2,102),
(1003,'2012-09-01','2012-09-30',3,103)

select * from User_has_role

/* 5. Creating Table Status  
NOTE: used BIT instead of Boolean as SQL does not have Boolean data type*/

Create table Status 
( 
	ID int primary key,
	status_name varchar(100),
	is_user_working BIT
)

/* Insert into Status Table */

Insert into Status values
( 11,'WIP',1),
(22,'Pending',0),
(33,'Done',1)

select * from Status

/* 6.Creating Table User_has_status*/

Create table User_has_status
(
	ID int primary key,
	status_start_time datetime,
	status_end_time datetime,
	user_account_id int,
	status_id int,
	foreign key(user_account_id) references User_account(ID),
	foreign key(status_id) references Status(ID)
)

/* 6.1 Insert into Table User_has_status */
Insert into User_has_Status values
(111,'2000-01-01','2000-01-30',1,11),
(222,'2001-02-01','2001-02-27',2,22),
(333,'2002-03-01','2002-03-31',3,33)

select * from User_has_status

/* Deleting Data from all the tables*/

delete from User_has_status
delete from Status
delete from User_has_role
delete from User_account
delete from Role

