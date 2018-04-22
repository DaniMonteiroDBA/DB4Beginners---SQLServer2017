--Se a tabela existe dropar
IF OBJECT_ID (N'dbo.Purchases', N'U') IS NOT NULL 
    DROP TABLE dbo.Purchases;
GO

--Criar a tabela Purchases
CREATE TABLE dbo.Purchases (
    ProductID int, CustomerID int, PurchaseDate datetime, 
    CONSTRAINT PK_PurchProdID PRIMARY KEY(ProductID,CustomerID));
GO

--Inserir dados na tabela Purchases
INSERT INTO dbo.Purchases VALUES(707, 11794, '20180321'),
(707, 15160, '20180325'),(708, 18529, '20180321'),
(711, 11794, '20180321'),(711, 19585, '20180322'),
(712, 14680, '20180325'),(712, 21524, '20180325'),
(712, 19072, '20180321'),(870, 15160, '20180323'),
(870, 11927, '20180324'),(870, 18749, '20180325');
GO

--Se a tabela FactBuyingHabits existe dropar
IF OBJECT_ID (N'dbo.FactBuyingHabits', N'U') IS NOT NULL 
    DROP TABLE dbo.FactBuyingHabits;
GO

--Criar a tabela FactBuyingHabits
CREATE TABLE dbo.FactBuyingHabits (
    ProductID int, CustomerID int, LastPurchaseDate datetime, 
    CONSTRAINT PK_FactProdID PRIMARY KEY(ProductID,CustomerID));
GO

--Insserir dados na tabela FactBuyingHabits
INSERT INTO dbo.FactBuyingHabits VALUES(707, 11794, '20180314'),
(707, 18178, '20180318'),(864, 14114, '20180318'),
(866, 13350, '20180318'),(866, 20201, '20180315'),
(867, 20201, '20180314'),(869, 19893, '20180315'),
(870, 17151, '20180318'),(870, 15160, '20180317'),
(871, 21717, '20180317'),(871, 21163, '20180315'),
(871, 13350, '20180315'),(873, 23381, '20180315');
GO

BEGIN TRANSACTION 

MERGE dbo.FactBuyingHabits AS Destino 
USING dbo.Purchases AS Origem
--Condição: O produto existe nas 2 tabelas e o cliente também
ON (Destino.ProductID = Origem.ProductID AND Destino.CustomerID = Origem.CustomerID)
--Se a condição for obedecida, ou seja, existem registros nas duas tabelas
WHEN MATCHED THEN
    UPDATE SET Destino.LastPurchaseDate = Origem.PurchaseDate
--Se a condição não foi obedecida porque o registro não existe na tabela de destino
WHEN NOT MATCHED BY TARGET THEN
    INSERT (CustomerID, ProductID, LastPurchaseDate)
    VALUES (Origem.CustomerID, Origem.ProductID, Origem.PurchaseDate)
OUTPUT $action, Inserted.*, Deleted.*;
ROLLBACK TRANSACTION --nos testes use o rolloback até ter certeza que o comando está ok. Depois do teste comente esta linha!
--COMMIT TRANSACTION -- só depois de testar, remova o comentário desta linha.
