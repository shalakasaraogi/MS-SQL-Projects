# Project 2 – Querying a Large Relational Database  

#### Problem Statement:
To get details about customers by querying a database?  

#### Topics:
In this project, first, I work on downloading a database and restoring it on the server. Then querying the database to get customer details like name, phone number, email ID, sales made in a particular month, increase in month-on-month sales, and even the total sales made to a particular customer.  

#### Highlights:  
- Table basics and data types  
- Various SQL operators  
- Various SQL functions  

#### Tasks performed:  
1) Downloaded the Adventure Works database from the following location and restore it in my server  

Location: https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks  
File Name: AdventureWorks2012.bak  

AdventureWorks is a sample database shipped with SQL Server, and it can be downloaded from the GitHub site. AdventureWorks has replaced Northwind and Pubs sample databases that were available in SQL Server 2005. Microsoft keeps updating the sample database as it releases new versions.  

2) Restored Backup  
Followed the below steps to restore a backup of my database using SQL Server Management Studio:  
- Opened SQL Server Management Studio and connected to the target SQL Server instance  
- Right-clicked on the Databases node and selected Restore Database  
- Selected Device and click on the ellipsis (...)  
- In the dialog, selected Backup devices, clicked on Add, navigate to the database backup in the file system of the server, selected the backup, and clicked on OK.  
- If needed, change the target location for the data and log files in the Files pane  
Note: It is a best practice to place the data and log files on different drives.  
- Clicked on OK  
This initiate the database restore. After it completed, I have the AdventureWorks database installed on your SQL Server instance.

3) Performed the following operations with help of the above database  
- Get all the details from the person table including email ID, phone number, and phone number type  
- Get the details of the sales header order made in May 2011  
- Get the details of the sales details order made in the month of May 2011  
- Get the total sales made in May 2011  
- Get the total sales made in the year 2011 by month order by increasing sales  
- Get the total sales made to the customer with FirstName='Gustavo' and LastName='Achong'  

---
