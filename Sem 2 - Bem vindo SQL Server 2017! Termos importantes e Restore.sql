USE [master]
RESTORE DATABASE [AdventureWorks2017] FROM  DISK = N'/home/db4beginners/Downloads/AdventureWorks2017.bak' WITH  FILE = 1,  MOVE N'AdventureWorks2017' TO N'/var/opt/mssql/data/AdventureWorks2017.mdf',  MOVE N'AdventureWorks2017_log' TO N'/var/opt/mssql/data/AdventureWorks2017_log.ldf',  NOUNLOAD,  STATS = 5
