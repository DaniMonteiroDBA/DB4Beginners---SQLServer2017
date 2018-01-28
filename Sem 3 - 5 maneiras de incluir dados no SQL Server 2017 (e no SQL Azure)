Use  AdventureWorks2017;

/* Login no SQL Server
usuário: sa
Senha: DB4Beginners
*/

--Criar a tabela de Exemplo
CREATE TABLE Sales.MyOrders 

(   orderid INT NOT NULL IDENTITY(1, 1)    

 CONSTRAINT PK_MyOrders_orderid PRIMARY KEY,   

custid  INT NOT NULL,   

empid   INT NOT NULL,  

 orderdate DATE NOT NULL,

shipcountry NVARCHAR(15) NOT NULL,   

freight MONEY NOT NULL ,

updatedate DATE NULL);

--Inclusão de dados
INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight) VALUES(2, 19, '20170620', N'USA', 30.00);

--Inserindo valor em coluna identity
SET IDENTITY_INSERT Sales.MyOrders ON

INSERT INTO Sales.MyOrders(orderid , custid, empid, orderdate, shipcountry, freight)   VALUES(999, 3, 11, '20170620', N'USA', 10.00);

SET IDENTITY_INSERT Sales.MyOrders OFF

--Incluir várias linhas
INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight)

VALUES 

 (2, 11, '20170620', N'USA', 50.00),  

 (5, 13, '20170620', N'USA', 40.00), 

 (7, 17, '20170620', N'USA', 45.00);

--Insert com Select
INSERT INTO Sales.MyOrders (custid, empid, orderdate, shipcountry, freight) 

 SELECT  CustomerID, SalesPersonID, orderdate, N'USA', freight   FROM Sales.SAlesOrderHeader WHERE SalesPersonID is not NULL

--Select com Insert
DROP TABLE IF EXISTS Sales.MyOrders;

 SELECT  CustomerID, SalesPersonID, orderdate, N'USA' as shipcountry, freight  INTO Sales.MyOrders FROM Sales.SAlesOrderHeader WHERE SalesPersonID is not NULL




