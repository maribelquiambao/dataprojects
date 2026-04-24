create table Midblock
(
	   [X] float
      ,[Y] float
      ,[ACC_ID] int
	  ,[ROAD_NO] nvarchar(50)
      ,[ROAD_NAME] nvarchar(100)
      ,[COMMON_ROAD_NAME] nvarchar(100)
      ,[CWAY] nvarchar(50)
      ,[SLK] float
      ,[INTERSECTION_NO] int
      ,[INTERSECTION_DESC] varchar(max)
      ,[LONGITUDE] float
      ,[LATITUDE] float
      ,[CRASH_DATE] varchar(50)
      ,[CRASH_TIME] smallint
      ,[ACCIDENT_TYPE] nvarchar(50)
      ,[SEVERITY] nvarchar(50)
      ,[EVENT_NATURE] nvarchar(50)
      ,[EVENT_TYPE] nvarchar(50)
      ,[TOTAL_BIKE_INVOLVED] int
      ,[TOTAL_TRUCK_INVOLVED] int
      ,[TOTAL_HEAVY_TRUCK_INVOLVED] int
      ,[TOTAL_MOTOR_CYCLE_INVOLVED] int
      ,[TOTAL_OTHER_VEHICLES_INVOLVED] int
      ,[TOTAL_PEDESTRIANS_INVOLVED] int
      ,[OBJECTID] int
      ,[GlobalID] nvarchar(50)
)

Select *
FROM dbo.Midblock

ALTER TABLE dbo.Midblock
(
[ACC_ID] int
)

ALTER TABLE dbo.Midblock
ADD PRIMARY KEY (ACC_ID)

create table Intersection
(
	   [X] float
      ,[Y] float
      ,[ACC_ID] int
      ,[ROAD_NO] nvarchar(50)
      ,[ROAD_NAME] nvarchar(100)
      ,[COMMON_ROAD_NAME] nvarchar(100)
      ,[CWAY] nvarchar(50)
      ,[SLK] float
      ,[INTERSECTION_NO] int
      ,[INTERSECTION_DESC] varchar(max)
      ,[LONGITUDE] float
      ,[LATITUDE] float
      ,[CRASH_DATE] varchar(50)
      ,[CRASH_TIME] smallint
      ,[ACCIDENT_TYPE] nvarchar(50)
      ,[SEVERITY] nvarchar(50)
      ,[EVENT_NATURE] nvarchar(50)
      ,[EVENT_TYPE] nvarchar(50)
      ,[TOTAL_BIKE_INVOLVED] int
      ,[TOTAL_TRUCK_INVOLVED] int
      ,[TOTAL_HEAVY_TRUCK_INVOLVED] int
      ,[TOTAL_MOTOR_CYCLE_INVOLVED] int
      ,[TOTAL_OTHER_VEHICLES_INVOLVED] int
      ,[TOTAL_PEDESTRIANS_INVOLVED] int
      ,[OBJECTID] int
      ,[GlobalID] nvarchar(50)
)

BULK INSERT Midblock
 FROM 'C:\Users\quiam\Downloads\Midblock Crash_Information_(Last_5_Years).csv'
 WITH 
 (
	FORMAT='CSV',
	FIRSTROW=2
)
GO

BULK INSERT Intersection_2222
FROM 'C:\Users\quiam\Downloads\Intersection Crash_Information_(Last_5_Years) .csv'
WITH
(
	FORMAT='CSV',
	FIRSTROW=2
)
GO

 select count(*)
  from intersection
  where LEN(crash_date) = 9 and SUBSTRING( crash_date, 2,1) = '/'

  -- prefix date with leading zeros
  
  update intersection
  set crash_date = CONCAT('0', crash_date)
  where LEN(crash_date) = 9 and SUBSTRING( crash_date, 2,1) = '/'

  update midblock
  set crash_date = CONCAT('0', crash_date)
  where LEN(crash_date) = 9 and SUBSTRING( crash_date, 2,1) = '/'

  select count(*)
  from midblock
  where LEN(crash_date) = 9 and SUBSTRING( crash_date, 2,1) = '/'

  select *
  from Midblock


SELECT TOP (1000) [X]
      ,[Y]
      ,[ACC_ID]
      ,[ROAD_NO]
      ,[ROAD_NAME]
      ,[COMMON_ROAD_NAME]
      ,[CWAY]
      ,[SLK]
      ,[INTERSECTION_NO]
      ,[INTERSECTION_DESC]
      ,[LONGITUDE]
      ,[LATITUDE]
      ,[CRASH_DATE]
      ,[CRASH_TIME]
      ,[ACCIDENT_TYPE]
      ,[SEVERITY]
      ,[EVENT_NATURE]
      ,[EVENT_TYPE]
      ,[TOTAL_BIKE_INVOLVED]
      ,[TOTAL_TRUCK_INVOLVED]
      ,[TOTAL_HEAVY_TRUCK_INVOLVED]
      ,[TOTAL_MOTOR_CYCLE_INVOLVED]
      ,[TOTAL_OTHER_VEHICLES_INVOLVED]
      ,[TOTAL_PEDESTRIANS_INVOLVED]
      ,[OBJECTID]
      ,[GlobalID]
  FROM [assmt4].dbo.Intersection

  select count(*)
  from intersection
  where LEN(crash_date) = 9 and SUBSTRING( crash_date, 2,1) = '/'

  -- prefix date with leading zeros
  
  update intersection
  set crash_date = CONCAT('0', crash_date)
  where LEN(crash_date) = 9 and SUBSTRING( crash_date, 2,1) = '/'
 update midblock
  set crash_date = CONCAT('0', crash_date)
  where LEN(crash_date) = 9 and SUBSTRING( crash_date, 2,1) = '/'

  
  SELECT *
  FROM dbo.Persons

  -- Query to make CRASH_TIME from smallint to timeformat

SELECT ACC_ID, ROAD_NAME, CRASH_DATE,
    TIMEFROMPARTS(CRASH_TIME / 100, CRASH_TIME % 100, 0, 0, 0) As timeFormat
FROM dbo.Intersection

alter table dbo.Intersection
add  CRASH_TIME_F time 

update  dbo.Intersection
SET CRASH_TIME_F = TIMEFROMPARTS(CRASH_TIME / 100, CRASH_TIME % 100, 0, 0, 0)


update intersection
  set crash_time = CONCAT('0', crash_time)
  where LEN(crash_time) = 1, 2, 3


 --FIND TOTAL # FATALITIES 

  SELECT ACC_ID, ROAD_NAME, ACCIDENT_TYPE, CRASH_DATE, CRASH_TIME
  FROM dbo.Intersection
  WHERE SEVERITY = 'Fatal'

  --LOOKING AT TOTAL CASES VS TOTAL FATALITIES
  select *
  from dbo.Intersection
  update intersection
  set crash_date = CONVERT(varchar(20),crash_date,103)

  SELECT ACC_ID, ROAD_NAME, ACCIDENT_TYPE, CRASH_DATE, CRASH_TIME
  FROM dbo.Intersection
  WHERE SEVERITY = 'Fatal' / 

  SELECT COUNT (SEVERITY= 'Fatal' DIVIDE COUNT SEVERITY= 'Not Fatal'x

  
  --Queries about fatal accidents

SELECT *
FROM dbo.Intersection
WHERE SEVERITY='Fatal'
SELECT *
FROM dbo.Midblock
WHERE SEVERITY='Fatal'

SELECT COUNT (*)
FROM dbo.Intersection
WHERE SEVERITY='Fatal'
SELECT COUNT (*)
FROM dbo.Midblock
WHERE SEVERITY='Fatal'

SELECT COUNT (TOTAL_PEDESTRIANS_INVOLVED)
FROM dbo.Midblock
WHERE SEVERITY='Fatal'


SELECT *
FROM dbo.Intersection
WHERE SEVERITY='Fatal'
ORDER BY TOTAL_PEDESTRIANS_INVOLVED Desc
SELECT *
FROM dbo.Midblock
WHERE SEVERITY='Fatal'
ORDER BY TOTAL_PEDESTRIANS_INVOLVED Desc

SELECT MAX(TOTAL_PEDESTRIANS_INVOLVED)
FROM dbo.Intersection
WHERE SEVERITY='Fatal'

SELECT COUNT (*)
FROM dbo.Intersection
WHERE SEVERITY='Fatal' AND CRASH_DATE LIKE '%2021'
SELECT COUNT (*)
FROM dbo.Midblock
WHERE SEVERITY='Fatal' AND CRASH_DATE LIKE '%2021'

SELECT *
FROM dbo.Midblock
WHERE SEVERITY='Fatal' AND EVENT_TYPE LIKE '%driveway'

SELECT *
FROM dbo.Intersection
INNER JOIN dbo.Midblock
ON dbo.Intersection.SEVERITY = dbo.Midblock.SEVERITY




-- Queries about accidents with bikes involved

SELECT COUNT (*)
FROM dbo.Intersection
WHERE TOTAL_BIKE_INVOLVED = 1 
SELECT COUNT (*)
FROM dbo.Midblock
WHERE TOTAL_BIKE_INVOLVED = 1 


SELECT COUNT (*)
FROM dbo.Intersection
WHERE TOTAL_BIKE_INVOLVED > 1 
SELECT COUNT (*)
FROM dbo.Midblock
WHERE TOTAL_BIKE_INVOLVED > 1 


SELECT *
FROM dbo.Intersection
WHERE TOTAL_BIKE_INVOLVED = 1
SELECT *
FROM dbo.Midblock
WHERE TOTAL_BIKE_INVOLVED = 1


SELECT *
FROM dbo.Intersection
WHERE TOTAL_BIKE_INVOLVED > 1 
ORDER BY TOTAL_BIKE_INVOLVED Desc
SELECT *
FROM dbo.Midblock
WHERE TOTAL_BIKE_INVOLVED > 1
ORDER BY TOTAL_BIKE_INVOLVED Desc

SELECT MAX(TOTAL_BIKE_INVOLVED)
FROM dbo.Intersection

--Queries about accidents with trucks involved

SELECT *
FROM dbo.Intersection
WHERE NOT TOTAL_TRUCK_INVOLVED = 0
ORDER BY TOTAL_TRUCK_INVOLVED DESC

SELECT *
FROM dbo.Midblock
WHERE NOT TOTAL_TRUCK_INVOLVED = 0
ORDER BY TOTAL_TRUCK_INVOLVED DESC

SELECT MAX(TOTAL_TRUCK_INVOLVED)
FROM dbo.Intersection


SELECT *
FROM dbo.Intersection
WHERE INTERSECTION_DESC LIKE 'Wanneroo%'
SELECT *
FROM dbo.Midblock
WHERE INTERSECTION_DESC LIKE 'Wanneroo%'


SELECT *
FROM dbo.Intersection
WHERE ROAD_NAME = 'Wanneroo Rd'
SELECT *
FROM dbo.Midblock
WHERE ROAD_NAME = 'Wanneroo Rd'


SELECT *
FROM dbo.Intersection
WHERE CRASH_TIME_F BETWEEN 1900 and 2400 OR CRASH_TIME BETWEEN 0 and 300
ORDER BY CRASH_TIME
SELECT *
FROM dbo.Midblock
WHERE CRASH_TIME BETWEEN 1900 and 2400 OR CRASH_TIME BETWEEN 0 and 300
ORDER BY CRASH_TIME

Select *
from dbo.Intersection
ORDER BY CRASH_TIME

SELECT *
FROM dbo.Intersection
WHERE SEVERITY = 'Fatal' and CRASH_TIME BETWEEN 0 and 300

SELECT COUNT (*)
FROM dbo.Intersection
WHERE SEVERITY='Fatal'

SELECT COUNT (*)
FROM dbo.Intersection
WHERE SEVERITY = 'Fatal' and CRASH_TIME BETWEEN 0 and 300





