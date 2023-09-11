use AdventureWorks2016

exec sp_helpindex 'Sales.Customer'

use artDB
exec sp_help Course 
--Index
--unique clustered index - only one per table
create clustered index Cindex
on Course(Cost,CourseName)
with pad_index,fillfactor=50

drop index course.pk_course

--non-clustered index - multiple indexes
create unique nonclustered index CourseNameIdx
on course(courseid,coursename)

create nonclustered index DiscountIdx
on course(discount)

dbcc showcontig ('course'
dbcc showcontig('Humanresources.Employee')


use AdventureWorksLT2016

--Joins
--inner/outer join
select cust.CustomerID,cust.FirstName,cust.LastName,
cust.SalesPerson,cust.EmailAddress,sales.OrderDate,
sales.TotalDue
from SalesLT.Customer as cust
right outer join SalesLT.SalesOrderHeader as sales
on cust.CustomerID = sales.CustomerID

--cross join
select cust.FirstName, sales.TotalDue
from SalesLT.Customer as cust
cross join SalesLT.SalesOrderHeader as sales


--multi join
select cust.CustomerID,cust.FirstName,cust.SalesPerson,
ads.City,ads.CountryRegion,sales.OrderDate,sales.TotalDue
from SalesLT.SalesOrderHeader as sales
join SalesLT.Customer as cust
on cust.CustomerID = sales.CustomerID
join SalesLT.CustomerAddress as custad
on cust.CustomerID = custad.CustomerID
join SalesLT.Address as ads
on custad.AddressID = ads.AddressID







