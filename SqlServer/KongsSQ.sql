--Subquery
use AdventureWorksLT2016

select * from SalesLT.Product
select * from SalesLT.ProductCategory

--nested
select ProductCategoryID as ProductCategory, Name as ProductName 
from SalesLT.Product
where ProductCategoryID in
(select ProductCategoryID
from SalesLT.ProductCategory
where Name = 'Road Bikes'
)

--correlated subquery
select CustomerID,SalesOrderID 
from SalesLT.SalesOrderHeader as sales1
where SalesOrderID in
(select max(sales2.Salesorderid)
from SalesLT.SalesOrderHeader as sales2
where sales2.CustomerID = sales1.CustomerID)

--dml insert/update/delete
update SalesLT.Customer
set EmailAddress='newandrea@gmail.com'
where CustomerID in
(select CustomerID
from SalesLT.SalesOrderHeader
where SalesOrderID = '71776')


select * from SalesLT.Customer



