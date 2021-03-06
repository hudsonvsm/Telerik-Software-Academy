USE master
GO

CREATE DATABASE PerformanceDBTest
GO

USE PerformanceDBTest
GO

CREATE TABLE Events(
  EventsId int NOT NULL PRIMARY KEY IDENTITY,
  [Date] DateTime,
  [Event] nvarchar(500)
)
INSERT INTO Events([Event], [Date]) VALUES ('Nikolay Kostov', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Doncho Minkov', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Ivaylo Kenov', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Evlogi Hristov', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Bay Ivan', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Kaka Penka', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Bate Goyko', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Bash Maistora', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Lelya Ginka', '20141010')
INSERT INTO Events([Event], [Date]) VALUES ('Chicho Mitko', '20141010')

DECLARE @Counter int = 2000
DECLARE @Text nvarchar(100)
DECLARE @Date datetime
WHILE @Counter < 1000000
BEGIN
	SET @Text = 'Text ' + CONVERT(nvarchar(10), @Counter) + ': ' + 'Ala bala'
	SET @Date = DATEADD(month, CONVERT(varbinary, newid()) % 600, getdate())
  INSERT INTO [PerformanceDBTest].[dbo].[Events]([Event], [Date])
   VALUES (@Text, @Date)
  SET @Counter = @Counter + 1
END

----------------------------TASK 1--------------------------------
CHECKPOINT; DBCC DROPCLEANBUFFERS; -- Empty the SQL Server cache

SELECT TOP 20 * FROM [Events]
WHERE [Date] > '31-Dec-2011' and [Date] < '1-Jan-2014'

--RESULT:
-- 3sec. without cache
-- 1.5sec. with cache

----------------------------TASK 2--------------------------------
CREATE INDEX IDX_Events_Date
ON Events([Date])

CHECKPOINT; DBCC DROPCLEANBUFFERS; -- Empty the SQL Server cache

SELECT * FROM Events
WHERE [Date] > '31-Dec-1991' and [Date] < '1-Jan-2014'

----------------------------TASK 3--------------------------------
CREATE INDEX IDX_Events_Event
ON Events([Event])

CHECKPOINT; DBCC DROPCLEANBUFFERS; -- Empty the SQL Server cache

SELECT e.[Event] FROM [PerformanceDBTest].[dbo].Events e
WHERE e.[Date] > '31-Dec-1991' and e.[Date] < '1-Jan-2014'

--It is faster with index