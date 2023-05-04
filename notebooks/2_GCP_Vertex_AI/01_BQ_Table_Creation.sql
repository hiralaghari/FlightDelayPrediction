-- 3 Tables are already created in the database (Raw Download)
-- Carrier Table - Details on the Airlines
-- Delay Table - Major Table that contains the delay of the airlines
-- Airport Table - Table on the Airport details
-- Furthermore, the tables are joined, and the master table is created, based of which Visulizations are made on Looker Studio
-- Also, BQML is also used, wherein the models are developed on top of this

-- Query to combine Delay + Airport Data

SELECT Master.*,
a_d.City as Destination_City,a_d.State as Destination_State, a_d.Elevation as Destination_Elevation,
a_d.Lat as Destination_Lat,a_d.Lon as Destination_Lon
 FROM 
(SELECT Year, quarter as Quarter, Month, DayofMonth, DayOfWeek, FlightDate,DOT_ID_Reporting_Airline, IATA_CODE_Reporting_Airline, Tail_Number, OriginAirportID,
DestAirportID, CRSDepTime, DepTime, DepDelay, DepDelayMinutes, CRSArrTime, ArrTime,
ArrDelay, ArrDelayMinutes, CancellationCode, Diverted, CRSElapsedTime, ActualElapsedTime,
AirTime, Flights, Distance, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, LateAircraftDelay,
City as Origin_City,State as Origin_State, Elevation as Origin_Elevation,
Lat as Origin_Lat,Lon as Origin_Lon
FROM `master-314712.CSE6242.Airport_Final` as a_f
join `master-314712.CSE6242.Delay_Ayush` as D on a_f.AirportID = D.OriginAirportID) AS Master
JOIN `master-314712.CSE6242.Airport_Final` as a_d on a_d.AirportID = Master.DestAirportID

-- Storing the above as Delay_Airport_Add

-- Query to obtain the final Table

SELECT A.*, C.ICAO_CODE ,C.Air_Carrier_Name FROM `master-314712.CSE6242.Delay_Airport_Add` as A 
JOIN `master-314712.CSE6242.Carrier` AS C ON A.IATA_CODE_Reporting_Airline = C.IATA_CODE