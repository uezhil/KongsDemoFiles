use artDB
--Stored Procedure
--I-Create the proc
create proc addproc
@n1 int,
@n2 int,
@res int out
--II - Logic proc
as
begin
set @res = @n1 + @n2
end

--III Call the proc
declare @additionres int
exec addproc 40,50,@additionres out

select @additionres

--SP - tables
alter proc Upd_Cust
@cid int,
@res nvarchar(50) out
as
begin
update Customer
set firstName='Raj'
where custId = @cid
if @@error = 0
set @res = 'Success'
else
set @res = 'Failure'
end

--execute sp
declare @result nvarchar(50)
exec Upd_Cust 4,@result out
select @result

select * from Customer


--Functions
use AdventureWorks2016
--func tables
IF OBJECT_ID (N'Sales.ufn_SalesByStore', N'IF') IS NOT NULL  
    DROP FUNCTION Sales.ufn_SalesByStore;  
GO  

alter FUNCTION Sales.ufn_SalesByStore (@storeid int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'  
    FROM Production.Product AS P   
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE C.StoreID = @storeid  
    GROUP BY P.ProductID, P.Name  
);

SELECT * FROM Sales.ufn_SalesByStore (602); 

