
/* Login no SQL Server
usuário: sa
Senha: DB4Beginners
*/
Use  AdventureWorks2017

--Criar ums tabela
SELECT  CustomerID, SalesPersonID, orderdate, N'USA' as shipcountry, freight  INTO Sales.MyOrders_Delete FROM Sales.SAlesOrderHeader WHERE SalesPersonID is not NULL


--Antes do DELETE selecionar os dados da tabela, onde a coluna SalesPersonID seja igual a 282 (271 linhas)
SELECT  CustomerID, SalesPersonID, orderdate, shipcountry, freight  FROM  Sales.MyOrders_Delete
WHERE SalesPersonID = 282

--Deletar os dados onde a coluna SalesPersonID seja igual a 282
DELETE FROM Sales.MyOrders_Delete WHERE SalesPersonID = 282

--Deletar todas as linhas da tabela
TRUNCATE TABLE Sales.MyOrders_Delete

--Selecionar as linhas da tabela 
SELECT  CustomerID, SalesPersonID, orderdate, shipcountry, freight  FROM  Sales.MyOrders_Delete
