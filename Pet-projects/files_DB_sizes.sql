/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
select CONVERT(char(24), @@Servername) AS 'Сервер'
       ,CONVERT(char(24), @@SERVICENAME) AS 'Служба'
	   ,LEFT(@@VERSION, 65) AS Version;

SELECT  CONVERT(char(24), @@Servername) AS ServerName
        ,create_date AS  ServerStarted
	    ,DATEDIFF(day, create_date, GETDATE()) AS 'Время работы в днях'
        ,DATEDIFF(SECOND,create_date, GETDATE())/60/60/24/365 AS 'Лет'
	    ,DATEDIFF(DAY,create_date, GETDATE())/30%12 AS 'Месяцев'
	    ,DATEDIFF(DAY,create_date, GETDATE())%30 AS 'Дней'
	    ,DATEDIFF(HOUR,create_date, GETDATE())%24 AS 'Часов'
	    ,DATEDIFF(MINUTE,create_date, GETDATE())%60 AS 'Минут'
FROM    sys.databases
WHERE   name = 'tempdb'; 
USE SRK
--exec sp_spaceused
;
SELECT
     CONVERT(char(20),[name]) AS Name
    ,CONVERT(char(80),[physical_name]) AS Folder
    ,CONVERT(decimal(10, 1),[size]/128.0) AS Size_Mb
FROM [SRK].[sys].[database_files]
;
--USE SRK;
SELECT CONVERT(char(24),@@Servername) AS 'Сервер', 
       CONVERT(char(10),file_id) AS file_id, 
	   CONVERT(char(10),type_desc) AS type_desc,
       CONVERT(decimal(10, 1),CAST(FILEPROPERTY(name, 'SpaceUsed') AS decimal(19,1)) * 8 / 1024.) AS space_used_mb,
       CONVERT(decimal(10, 1),CAST(size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS decimal(19,1))) AS space_unused_mb,
       CONVERT(decimal(10, 1),CAST(size AS decimal(19,1)) * 8 / 1024.) AS space_allocated_mb,
	   CONVERT(decimal(10, 1),(CAST(FILEPROPERTY(name, 'SpaceUsed') AS decimal(19,1)) * 8 / 1024.)/(CAST(size AS decimal(19,1)) * 8 / 1024.)*100) AS used_space_in_percent,
       CONVERT(char(20),CAST(max_size AS decimal(19,1)) * 8 / 1024.) AS max_size_mb
FROM sys.database_files;

SELECT  TOP 3
        CONVERT(char(24), @@Servername) AS ServerName ,
        CONVERT(char(20),d.Name) AS DBName ,
		b.type,
        b.Backup_finish_date ,
        CONVERT(char(52),bmf.Physical_Device_name) AS Physical_Device_name,
		CONVERT(DECIMAL(10,0), b.backup_size/1024.0) AS Backup_size_kb
FROM    sys.databases d
        INNER JOIN msdb..backupset b ON b.database_name = d.name
                                        AND b.[type] = 'D'
        INNER JOIN msdb.dbo.backupmediafamily bmf ON b.media_set_id = bmf.media_set_id
WHERE   d.NAME = 'SRK'
ORDER BY d.NAME ,
        b.Backup_finish_date DESC; 

USE SystemMonitoring
--exec sp_spaceused
;
SELECT CONVERT(char(24),[name]) AS Name
    ,CONVERT(char(100),[physical_name]) AS Folder
    ,CONVERT(decimal(10, 1),[size]/128.0) AS Size_Mb
FROM [SystemMonitoring].[sys].[database_files]
;
--USE SystemMonitoring;
SELECT CONVERT(char(24),@@Servername) AS 'Сервер', 
       CONVERT(char(10),file_id) AS file_id, 
	   CONVERT(char(10),type_desc) AS type_desc,
       CONVERT(decimal(10, 1),CAST(FILEPROPERTY(name, 'SpaceUsed') AS decimal(19,1)) * 8 / 1024.) AS space_used_mb,
       CONVERT(decimal(10, 1),CAST(size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS decimal(19,1))) AS space_unused_mb,
       CONVERT(decimal(10, 1),CAST(size AS decimal(19,1)) * 8 / 1024.) AS space_allocated_mb,
	   CONVERT(decimal(10, 1),(CAST(FILEPROPERTY(name, 'SpaceUsed') AS decimal(19,1)) * 8 / 1024.)/(CAST(size AS decimal(19,1)) * 8 / 1024.)*100) AS used_space_in_percent,
       CONVERT(char(20),CAST(max_size AS decimal(19,1)) * 8 / 1024.) AS max_size_mb
FROM sys.database_files;

SELECT  TOP 3
        CONVERT(char(24), @@Servername) AS ServerName ,
        CONVERT(char(20),d.Name) AS DBName ,
		b.type,
        b.Backup_finish_date ,
        CONVERT(char(72),bmf.Physical_Device_name) AS Physical_Device_name,
		CONVERT(DECIMAL(10,0), b.backup_size/1024.0) AS Backup_size_kb
FROM    sys.databases d
        INNER JOIN msdb..backupset b ON b.database_name = d.name
                                        AND b.[type] = 'D'
        INNER JOIN msdb.dbo.backupmediafamily bmf ON b.media_set_id = bmf.media_set_id
WHERE   d.NAME = 'SystemMonitoring'
ORDER BY d.NAME ,
         b.Backup_finish_date DESC;

SELECT CONVERT(char(24),ServerName) AS ServerName,
       CONVERT(char(20), DBname) AS DBName ,
	   type,
       min(Backup_finish_date) AS Backup_MIN_DateTime,
	   max(Backup_finish_date) AS Backup_MAX_DateTime,
	   COUNT(*) AS 'Backup_count'
FROM(        
SELECT  @@Servername AS ServerName ,
        d.Name AS DBName ,
		b.type,
        b.Backup_finish_date AS Backup_finish_date,
        bmf.Physical_Device_name AS Physical_Device_name
FROM    sys.databases d
        INNER JOIN msdb..backupset b ON b.database_name = d.name
                                        AND b.[type] = 'D'
        INNER JOIN msdb.dbo.backupmediafamily bmf ON b.media_set_id = bmf.media_set_id
WHERE   b.Backup_finish_date >= CAST('01.08.2024' AS date)
     ) AS TEMP
GROUP BY ServerName, DBName, type
; 
SELECT  TOP 3
        CONVERT(char(24), @@Servername) AS ServerName ,
        CONVERT(char(20),d.Name) AS DBName ,
		b.type,
        b.Backup_finish_date ,
        CONVERT(char(72),bmf.Physical_Device_name) AS Physical_Device_name,
		CONVERT(DECIMAL(10,0), b.backup_size/1024.0) AS Backup_size_kb
FROM    sys.databases d
        INNER JOIN msdb..backupset b ON b.database_name = d.name
                                        AND b.[type] = 'L'
        INNER JOIN msdb.dbo.backupmediafamily bmf ON b.media_set_id = bmf.media_set_id
WHERE   d.NAME = 'SystemMonitoring'
ORDER BY d.NAME ,
         b.Backup_finish_date DESC;

SELECT CONVERT(char(24),ServerName) AS ServerName,
       CONVERT(char(20), DBname) AS DBName ,
	   type,
       min(Backup_finish_date) AS Backup_MIN_DateTime,
	   max(Backup_finish_date) AS Backup_MAX_DateTime,
	   COUNT(*) AS 'Backup_count'
FROM(        
SELECT  @@Servername AS ServerName ,
        d.Name AS DBName ,
		b.type,
        b.Backup_finish_date AS Backup_finish_date,
        bmf.Physical_Device_name AS Physical_Device_name
FROM    sys.databases d
        INNER JOIN msdb..backupset b ON b.database_name = d.name
                                        AND b.[type] = 'L'
        INNER JOIN msdb.dbo.backupmediafamily bmf ON b.media_set_id = bmf.media_set_id
     ) AS TEMP
GROUP BY ServerName, DBName, type
;
