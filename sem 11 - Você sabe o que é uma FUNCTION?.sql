--Criando uma função escalar
CREATE FUNCTION dbo.SubtracaoPostBlog   
( @Valor1 AS INT,
  @valor2 as INT)  
RETURNS INT  
AS 
    BEGIN   
        DECLARE @Retorno AS INT
		
		Set @Retorno = @Valor1 - @Valor2
		   
        RETURN @Retorno  
    END  


--Validando o resultado da função
SELECT [dbo].[SubtracaoPostBlog] (
   20
  ,10)
GO

--Inline Table-Valued Function
CREATE FUNCTION Sales.ufn_SalesByStore (@storeid int)  
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
GO

--Testar a função
Select * from Sales.ufn_SalesByStore(934)

--Multi-Statement Table-Valued Function
CREATE FUNCTION Sales.ufn_SalesByStore_V2 (@storeid int)  
RETURNS @VariavelTabela TABLE 
    (IDProduto  int NOT NULL, 
    Nome nvarchar(255) NOT NULL,
    Total decimal(20,2) NOT NULL) 
AS  
    BEGIN
        INSERT INTO @VariavelTabela
        SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'  
        FROM Production.Product AS P   
        JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
        JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
        JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
        WHERE C.StoreID = @storeid  
        GROUP BY P.ProductID, P.Name  
        
        RETURN
    END;  
GO

--Testar a função
Select * from Sales.ufn_SalesByStore_V2(934)
