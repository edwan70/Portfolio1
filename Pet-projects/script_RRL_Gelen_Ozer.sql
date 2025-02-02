
USE [SystemMonitoring]

GO

--Выборка уровень сигнала по РРЛ Геленджик

select 'РТП Геленджик' as 'Выборка уровень сигнала РРЛ по объекту'
      , CONVERT(smalldatetime, GETDATE()) as 'Дата и Время запроса'

-- РТП "Геленджик"

  -- Сайт Центр1 - Геленджик1
  SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'Центр-Гелен'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1), [DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
  FROM [dbo].[DataLog]
   INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
  WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj37'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '28'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='7')
  
  UNION ALL
  
  -- Сайт Центр2 - Геленджик2
  SELECT TOP 1 
     -- [DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'Центр-Гелен'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
  FROM [dbo].[DataLog]
   INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
  WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
		FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj37'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '29'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='8')
  

-- Сайт Геленджик1 - Центр1
  SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'Гелен-Центр'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
  FROM [dbo].[DataLog]
   INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
  WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
		FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj38'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '30'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='7')
  
  UNION ALL

  -- Сайт Геленджик2 - Центр2
  SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'Гелен-Центр'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
  FROM [dbo].[DataLog]
   INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
  WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
		FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj38'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '31'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='8')

-- Выборка уровень сигнала по РРЛ Южная Озереевка

select 'РТП Южная Озереевка' as 'Выборка уровень сигнала РРЛ по объекту'
              , CONVERT(smalldatetime, GETDATE()) as 'Дата и Время запроса'
        
-- РТП "Ю. Озереевка"

-- Сайт Центр1 - РТПС1
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'Центр-КРТПЦ'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj25'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '13'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='7')
  
UNION ALL

-- Сайт Центр2 - РТПС2
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'Центр-КРТПЦ'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj25'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '14'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='8')

-- Сайт РТПС1 - Центр1
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'КРТПЦ-Центр'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj28'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '15'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='9')

UNION ALL

-- Сайт РТПС2 - Центр2
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'КРТПЦ-Центр'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj28'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '16'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='10')

-- Сайт РТПС1 - Абрау1
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'КРТПЦ-Абрау'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj28'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '17'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='11')
 
UNION ALL

-- Сайт РТПС2 - Абрау2
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'КРТПЦ-Абрау'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj28'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '18'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='12')
  
-- Сайт Абрау1 - РТПС1
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'Абрау-КРТПЦ'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj27'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '19'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='9')
  
UNION ALL

-- Сайт Абрау2 - РТПС2
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'Абрау-КРТПЦ'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
	 --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj27'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '20'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='10')
  

  -- Сайт Абрау1 - Озереевка1
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'Абрау-Озер'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
	 --, [DataSamples].[Type]
	 --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
	 --, [RecKinds].[Name]
	 --, [RecKinds].[Unit]
         --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj27'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '21'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='11')
  
UNION ALL

-- Сайт Абрау2 - Озереевка2
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'Абрау-Озер'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
        --, [DataSamples].[Type]
        --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
        --, [RecKinds].[Name]
        --, [RecKinds].[Unit]
        --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj27'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '22'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='12')
  
  
-- Сайт Озереевка1 - Абрау1
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU1' AS 'Озер-Абрау'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
       --, [DataSamples].[Type]
       --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
       --, [RecKinds].[Name]
       --, [RecKinds].[Unit]
       --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj26'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '23'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='7')
  
UNION ALL

-- Сайт Озереевка2 - Абрау2
SELECT TOP 1 
     --[DataLog].[Id]
     --[DataLog].[SampleID]
       [DataLog].[DateTime]
     , 'OU2' AS 'Озер-Абрау'
     --, [DataLog].[Type]
     --, [DataLog].[Value]
     , CONVERT(decimal(10, 1),[DataLog].[ValuePerSec]) AS 'Значение'
     , CONVERT(char(30), [DataSamples].[SourceElement]) AS 'Параметр'
      --, [DataSamples].[Type]
      --, [DataSamples].[Description]
     , [DataSamples].[Unit] AS 'Единица измерения'
      --, [RecKinds].[Name]
      --, [RecKinds].[Unit]
      --, [RecKinds].[Element]
FROM [dbo].[DataLog]
INNER JOIN [SystemMonitoring].[dbo].[DataSamples] on [SystemMonitoring].[dbo].[DataLog].[SampleID] = [SystemMonitoring].[dbo].[DataSamples].[Id] 
WHERE [SystemMonitoring].[dbo].[DataLog].[Id] = 
        (SELECT max([SystemMonitoring].[dbo].[DataLog].[Id]) 
        FROM [dbo].[DataLog]
        WHERE [SystemMonitoring].[dbo].[DataLog].[Object] = 'MonObj26'
        AND [SystemMonitoring].[dbo].[DataLog].[SampleID] = '24'
        AND [SystemMonitoring].[dbo].[DataLog].[Type] ='8')
  
GO
  
