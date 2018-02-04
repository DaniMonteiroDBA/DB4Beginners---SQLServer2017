-- Estrutura do comando
-- UPDATE tabelaX SET colunaK = Y WHERE colunaZ = condição

-- Incrementar valor de uma coluna
UPDATE Sales.MyOrderDetails   
SET discount += 0.05 
WHERE orderid = 10251;

--Diminuir o desconto 
UPDATE Sales.MyOrderDetails   
SET discount -= 0.05 
WHERE orderid = 10251;


-- Atualizar e retornar o valor

--Crie a variável 
DECLARE @newdiscount AS NUMERIC(4, 3) = NULL; 


--Atualize o desconto de um determinado produto (veja que a operação deve retornar somente um desconto
UPDATE Sales.MyOrderDetails   
SET @newdiscount = discount += 0.05 
WHERE orderid = 10250   
AND productid = 51; 


--Selecione o valor do novo desconto
SELECT @newdiscount;

