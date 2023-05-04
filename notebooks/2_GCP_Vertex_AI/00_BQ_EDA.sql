# Code to create new Dataset

SELECT Master.*,
a_d.City as Destination_City,a_d.State as Destination_State, a_d.Elevation as Destination_Elevation,
a_d.Lat as Destination_Lat,a_d.Lon as Destination_Lon
 FROM 
(SELECT Year, Quarter, Month, DayofMonth, DayOfWeek, FlightDate,DOT_ID_Reporting_Airline, IATA_CODE_Reporting_Airline, Tail_Number, OriginAirportID,
DestAirportID, CRSDepTime, DepTime, DepDelay, DepDelayMinutes, CRSArrTime, ArrTime,
ArrDelay, ArrDelayMinutes, CancellationCode, Diverted, CRSElapsedTime, ActualElapsedTime,
AirTime, Flights, Distance, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, LateAircraftDelay,
City as Origin_City,State as Origin_State, Elevation as Origin_Elevation,
Lat as Origin_Lat,Lon as Origin_Lon
FROM `master-314712.CSE6242.Airport_Final` as a_f
join `master-314712.CSE6242.Delay` as D on a_f.AirportID = D.OriginAirportID) AS Master
JOIN `master-314712.CSE6242.Airport_Final` as a_d on a_d.AirportID = Master.DestAirportID

-- SELECT 1 FROM (SELECT Year, Quarter, Month, DayofMonth, DayOfWeek, FlightDate,DOT_ID_Reporting_Airline, IATA_CODE_Reporting_Airline, Tail_Number, OriginAirportID,
-- DestAirportID, CRSDepTime, DepTime, DepDelay, DepDelayMinutes, CRSArrTime, ArrTime,
-- ArrDelay, ArrDelayMinutes, CancellationCode, Diverted, CRSElapsedTime, ActualElapsedTime,
-- AirTime, Flights, Distance, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, LateAircraftDelay
-- City as Origin_City,State as Origin_State, Elevation as Origin_Elevation, Lat as Origin_Lat,
-- Lon as Origin_Lon 
-- FROM `master-314712.CSE6242.Airport_Final` as a_f
-- join `master-314712.CSE6242.Delay` as D on a_f.AirportID = D.OriginAirportID) AS Main
-- join `master-314712.CSE6242.Airport_Final` AS A_F ON Main.DestAirportID = A_F.AirportID

# To add more info on to the Dealy_Plus_Airport


# To Add Carrier Details

SELECT A.*, C.ICAO_CODE ,C.Air_Carrier_Name FROM `master-314712.CSE6242.Delay_Plus_Airport` as A 
JOIN `master-314712.CSE6242.Carrier` AS C ON A.IATA_CODE_Reporting_Airline = C.IATA_CODE

# EDA

SELECT Avg((ArrDelay + DepDelay)/(ArrDelay))
FROM `master-314712.CSE6242.Delay_Final_Dataset`
where ArrDelay > 0 and DepDelay > 0

SELECT SUM(Case when ArrDelay > 0 and DepDelay > 0 then 1 else 0 end)/Count(*) as ArrDelay 
FROM `master-314712.CSE6242.Delay_Final_Dataset`

SELECT SUM(Case when ArrDelay > 0 then 1 else 0 end)/Count(*) as ArrDelay 
FROM `master-314712.CSE6242.Delay_Final_Dataset`

SELECT SUM(Case when DepDelay > 0 then 1 else 0 end)/Count(*) as Dep_Delay 
FROM `master-314712.CSE6242.Delay_Final_Dataset`

# BQML Codebase


