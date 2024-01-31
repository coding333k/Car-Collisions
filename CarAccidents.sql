select *
from CarCrash.[dbo].[CarCrash2022$];

select * 
from CarCrash.[dbo].[CarCrash2022$]
where VehicleModelYear is null;

select * 
from CarCrash.[dbo].[CarCrash2022$]
where persondeathcount = 1 ;

select *
from CarCrash.[dbo].[CarCrash2022$]
where crashseverity = 'K - FATAL INJURY';
--see which columns contain nulls 

select CrashSeverity,PersonInjurySeverity
from CarCrash.[dbo].[CarCrash2022$]
where PersonInjurySeverity = 'K - FATAL INJURY';
--data vallidation, which field will we use for injury status?

--look at some sums of injuries
select sum(persondeathcount) as deaths 
from CarCrash.[dbo].[CarCrash2022$];

select sum(personsuspectedseriousinjurycount) as reallyhurt
from CarCrash.[dbo].[CarCrash2022$];

select isnull(cast(caseid as varchar), 'No Data' ) as CaseID
from CarCrash.[dbo].[CarCrash2022$];
--there are no nulls in the crashid, there are in the caseid

select
case 
	when personage < 16 then 'young passenger'
	when personage  >= 16 and  personage <= 24 then  'teen driver'
	when personage between 24 and 39 then  'experienced driver'
	when personage between 39 and 64 then  'middleage driver'
	when personage > 64 then  'senior driver'
	else 'No Data' 
	end as personage
from CarCrash.[dbo].[CarCrash2022$];
--create clusters of age groups

select surfacecondition, 
substring(surfacecondition, charindex('-', surfacecondition)+2, len(surfacecondition))
from CarCrash.[dbo].[CarCrash2022$];
--use substrings

select cast(crashdate as date)
from CarCrash.[dbo].[CarCrash2022$];
--convert from crashdate from datetime to just date

select crashtime, 
right('0000' +convert(varchar(4), crashtime),4) + '00'  as modtime
from CarCrash.[dbo].[CarCrash2022$];
-- add zeros to crash time so each time can later be modified to type of time

select crashtime, 
cast(format(crashtime, '0000') as time) as modtime
from CarCrash.[dbo].[CarCrash2022$]

--complete query
select CrashId, City, County, cast(crashdate as date) as CrashDate,
right('0000' +convert(varchar(4), crashtime),4) as CrashTime,
substring(crashseverity, charindex('-', crashseverity )+2, len(crashseverity)) as CrashSeverity,
Latitude, Longitude, SpeedLimit, 
substring(surfacecondition, charindex('-', surfacecondition)+2, len(surfacecondition)) as SurfaceCondition,
substring(weathercondition, charindex('-', weathercondition)+2, len(weathercondition)) as WeatherCondition,
driverbloodalcoholcontenttestresult as DriverBAC,
substring(DriverDrugTestResult, charindex('-', DriverDrugTestResult)+2, len(DriverDrugTestResult)) 
as DriverDrugTest, VehicleMake, VehicleModelYear, Charge, Citation,
case 
	when personage < 16 then 'young passenger'
	when personage  >= 16 and  personage <= 24 then  'teen driver'
	when personage between 24 and 39 then  'experienced driver'
	when personage between 39 and 64 then  'middleage driver'
	when personage > 64 then  'senior driver'
	else 'No Data' 
	end as PersonAge,
substring(PersonAirbagDeployed, charindex('-', PersonAirbagDeployed)+2, len(PersonAirbagDeployed)) 
as AirbagDeployment, 
substring(Persongender, charindex('-', Persongender)+2, len(Persongender)) as PersonGender,
substring(PersonInjurySeverity, charindex('-', PersonInjurySeverity)+2, len(PersonInjurySeverity)) 
as InjurySeverity, PersonTotalInjuryCount
from CarCrash.[dbo].[CarCrash2022$];

--same query but for 2021
select CrashId, City, County, cast(crashdate as date) as CrashDate,
right('0000' +convert(varchar(4), crashtime),4) as CrashTime,
substring(crashseverity, charindex('-', crashseverity )+2, len(crashseverity)) as CrashSeverity, 
Latitude, Longitude, SpeedLimit, 
substring(surfacecondition, charindex('-', surfacecondition)+2, len(surfacecondition)) as SurfaceCondition,
substring(weathercondition, charindex('-', weathercondition)+2, len(weathercondition)) as WeatherCondition,
driverbloodalcoholcontenttestresult as DriverBAC,
substring(DriverDrugTestResult, charindex('-', DriverDrugTestResult)+2, len(DriverDrugTestResult)) 
as DriverDrugTest, VehicleMake, VehicleModelYear, Charge, Citation,
case 
	when personage < 16 then 'young passenger'
	when personage  >= 16 and  personage <= 24 then  'teen driver'
	when personage between 24 and 39 then  'experienced driver'
	when personage between 39 and 64 then  'middleage driver'
	when personage > 64 then  'senior driver'
	else 'No Data' 
	end as PersonAge,
substring(PersonAirbagDeployed, charindex('-', PersonAirbagDeployed)+2, len(PersonAirbagDeployed)) 
as AirbagDeployment, 
substring(Persongender, charindex('-', Persongender)+2, len(Persongender)) as PersonGender,
substring(PersonInjurySeverity, charindex('-', PersonInjurySeverity)+2, len(PersonInjurySeverity)) 
as InjurySeverity, PersonTotalInjuryCount
from CarCrash.[dbo].[CarCrash2021$];




