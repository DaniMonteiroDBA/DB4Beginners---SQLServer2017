USE AdventureWorks2017
GO


--Criar a trigger
CREATE TRIGGER trgLembrete  
ON Sales.Customer  
AFTER INSERT, UPDATE   
AS  RAISERROR ('Notifique a equipe responsável.', 16, 10);  
GO  

--Testar a trigger atualizando um registro na tabela
UPDATE [Sales].[Customer] Set
	[ModifiedDate] = getdate()
WHERE CustomerID  =1 
