/* 1. Get all the details from the person table including emailID, phone number and Phone number type */
select P.firstname, P.lastname,E.emailaddress,PH.phonenumber,PHT.name from person.person P
inner join person.EmailAddress E on P.BusinessEntityID= E.BusinessEntityID
inner join person.PersonPhone PH on PH.BusinessEntityID = E.BusinessEntityID
inner join person.PhoneNumberType PHT on PHT.PhoneNumberTypeID=PH.PhoneNumberTypeID

/*2. Get the details of the sales header order made in May 2011 */
select * from sales.SalesOrderHeader where orderdate between ('2011-05-01') and ('2011-05-31')

/* 3. Get the details of the sales details order made in month of May 2011 */
select * from sales.SalesOrderDetail SD
inner join sales.SalesOrderHeader SH on SD.SalesOrderID=SH.SalesOrderID
where SH.OrderDate between ('2011-05-01') and ('2011-05-31')

/* 4. Get Total Sales made in May 2011 */
select sum(sd.LineTotal) as Totalsales  from sales.SalesOrderDetail SD
inner join sales.SalesOrderHeader SH on SD.SalesOrderID=SH.SalesOrderID
where SH.OrderDate between ('2011-05-01') and ('2011-05-31')

/* 5. Get the total sales made in the year 2011 by month order by increasing sales */
select sum(sd.LineTotal)as Totalsales,month(OrderDate) as Salemonth from sales.SalesOrderDetail SD
inner join sales.SalesOrderHeader SH on SD.SalesOrderID=SH.SalesOrderID
group by month(OrderDate) 
order by Totalsales 

/* 6. Get the total sales made to the customer with FirstName='	Gustavo' and LastName='Achong'.
Since the given customer do not have any sales records. Tried with a diffrent customer*/

select P.FirstName,P.LastName,sum(SD.LineTotal) TotalSales from person.person P 
inner join sales.PersonCreditCard CC on P.BusinessEntityID=CC.BusinessEntityID  
inner join [Sales].[SalesOrderHeader] SH on SH.creditcardID=CC.creditcardID
inner join sales.SalesOrderDetail SD on SD.SalesOrderID=SH.SalesOrderID
and P.FirstName='Guastov' and P.LastName='Abel'
group by P.BusinessEntityID,P.FirstName,P.LastName;




