create database ola;
use ola;
select count(*) from booking;

-- Q.1 Retrive all successful bookings;
create view successful_bookings as
select * from booking where booking_status = 'Success' limit 100000; 

select * from successful_bookings;

-- Q.2 Find the average ride distance from each vehicle type;
create view ride_distance_from_each_vehicle as
select vehicle_type ,avg(ride_distance) 
as avg_distance from booking group by vehicle_type;

select * from ride_distance_from_each_vehicle;

-- Q.3 Get the total numbers of canceled rides by customer;
create view canceled_rides_by_customer as
select count(*) from booking 
where booking_status = 'canceled by customer';

select * from canceled_rides_by_customer;

-- Q.4 list the top 5 customers who booked the highest number of rides;
create view top5_customers as
select customer_id , count(booking_id) as total_rides
from booking
group by customer_id 
order by total_rides desc limit 5;

select * from top5_customers;

-- Q.5 Get the number of rides cancelled by driver due to personal and car related issue
create view  rides_cancelled_by_driver_p_c_issues as 
select count(*) from booking 
where canceled_rides_by_driver = 'personal & car related issue';

 select * from rides_cancelled_by_driver_p_c_issues;
 
 -- Q.6 find the maximum & minimum drivers rating for prime sudan
 create view max_min_driver_ratings as
 select max(driver_ratings) as max_ratings,
 min(driver_ratings) as min_ratings from booking
 where vehicle_type = 'prime sedan';
 
 select * from  max_min_driver_ratings;
 
 -- Q.7 Retrive all rides where payment was  made by using upi
 create view upi_payment as
 select * from booking
 where payment_method = 'upi';
 
 select * from upi_payment;
 
 -- Q.8 find the average customer rating per vehicle type
 create view avg_cust_rating as
 select vehicle_type , avg(customer_rating) as avg_customer_rating
 from booking group by vehicle_type;
 
 select * from avg_cust_rating;
 
 -- Q.9 calculate the total booking value of rides completed successfully
 create view  total_successful_ride_values as
 select sum(booking_value) as total_successful_ride_value
 from booking where booking_status ='success';
 
 select * from  total_successful_ride_values;
 
 -- Q.10 list all incomplete rides along with the reason
 create view incomplete_rides_reason as 
 select booking_id , incomplete_rides_reason
 from booking
 where incomplete_rides = 'yes';
 
 select * from incomplete_rides_reason;