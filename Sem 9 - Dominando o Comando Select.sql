USE AdventureWorks2017
GO

--Usar o ALIAS e o nome da tabela
SELECT SalesOrderHeader.SalesOrderID, SOH.Comment
FROM Sales.SalesOrderHeader AS SOH

--Esquecer a vírgula entre as colunas 
SELECT SalesOrderID Comment
FROM Sales.SalesOrderHeader

--Retorno de uma expressão sem ALIAS
SELECT OrderQty *10 
FROM Sales.SalesOrderDetail

--Retorno de uma expressão com ALIAS
SELECT OrderQty *10 AS EXPRESSAO
FROM Sales.SalesOrderDetail

--SELECT SEM FROM 
SELECT 'SQLSERVER' as Coluna

--Usando NULL de forma INCORRETA na comparação
SELECT OrderQty 
FROM Sales.SalesOrderDetail
WHERE UnitPrice = NULL

--Usando NULL de forma correta na comparação
SELECT OrderQty 
FROM Sales.SalesOrderDetail
WHERE UnitPrice is NULL

--Selecionar OederQty da tabela SalesOrderDetail, onde a coluna UnitPrice não seja NUla 
SELECT OrderQty 
FROM Sales.SalesOrderDetail
WHERE UnitPrice is not NULL
