
create database cars;
use cars;

-- fetch all datas from the dataset --
select * from cardata;

-- Fetch the count of all cars per year(need only year & count) ordered from  latest to oldest --
select year,count(*) from cardata  group by year;

-- Fetch the count of cars available in 2023 --
select year,count(*) from cardata where year=2023;

-- Retrieve count of cars available in  last three years -- 
select year, count(*) from cardata where year in(2021,2022,2023) group by year;

-- Fetch the number of  cars uses Fuel Petrol will be there in 2020 --
select count(*) from cardata where year = 2020 and fuel ='Petrol';

-- Fetch the details of cars whose selling price greater than 5000000 in descending order --
select * from cardata where selling_price >5000000 order by selling_price desc;

-- check,in which year there were more than 100 cars per year -- 
select year,count(*) from cardata group by year having count(*)>100 order by count(*);

-- check, in which year there were less than 100 cars per year --
select year,count(*) from cardata group by year having count(*)<100 order by count(*) desc;
 
 -- Fetch complete list of cars in between year 2015 & 2023 --
 select * from cardata where year between 2015 and 2023;
 
 -- Retrieve the average mileage,engine displacement & maximum power for all cars --
 select round(avg(mileage),2) avg_mileage,round(avg(engine),2) avg_engine,round(avg(max_power),2) avg_max_power from cardata;
 
-- Fetch the details of car having  7 seats and mileage >20 --
select * from cardata where mileage>20 and seats =7;

-- Retrieve the number of cars for each fuel type --
select fuel,count(*) Total_Cars from cardata group by fuel order by Total_Cars;

-- Retrieve each years maxmimum,minimum and average selling price --
select year ,max(selling_price) from cardata group by year;
select year ,min(selling_price) from cardata group by year;
select year ,avg(selling_price) from cardata group by year;
 
 -- Retrive name and km_driven of  5 cars with maximum km driven --
 select name,km_driven from cardata order by  km_driven desc limit 5; 
 
 -- Retrieve all cars that have engine displacement greater than or eqaul to 2000 cc ,have been driven less than 100000 km,and are being sold by individual sellers --
 select name,seller_type,km_driven,engine from cardata where substring_index(engine,' ',1)>=2000 and seller_type ='individual' and km_driven<100000;

 -- Retrieve the average mileage,maximum power ,engine displacement for all cars of each fuel type --
 select fuel, round(avg(mileage),2) avg_mileage,round(avg(engine),2) avg_engine,round(avg(max_power),2) avg_max_power from cardata group by fuel order by fuel;
 
 -- Fetch total number of cars sold by dealers and individual sellers --
 select seller_type,count(*) Total_Cars from cardata where seller_type in ('dealer','individual') group by seller_type;
 
 -- Retrieve all cars that have been driven less than 50000km and are being sold by dealer --
 select * from cardata where km_driven <50000 and seller_type = 'dealer';


/* END */