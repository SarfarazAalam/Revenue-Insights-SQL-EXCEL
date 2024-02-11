create table pizza_sales(
    pizza_id int primary key,
	order_id int,
	pizza_name_id varchar(50),
	quantity int,
	order_date date,
	order_time time,
	unit_price float,
	total_price float,
	pizza_size varchar(50),
	pizza_category varchar(50),
	pizza_ingredients varchar (200),
	pizza_name varchar(50)
	
	
);
select * from pizza_sales
select count(*) from pizza_sales

select sum(total_price) As Total_Revenue FROM pizza_sales

select sum(total_price)/count(Distinct order_id) As Average_order_Value from pizza_sales

select sum(quantity)As pizza_sold from pizza_sales

select Count(Distinct order_id) As Total_orders from pizza_sales

select CAST(CAST(sum(quantity)AS DECIMAL(10,2))/CAST(count(Distinct order_id)AS DECIMAL(10,2))AS DECIMAL(10,2)) AS Average_order from pizza_sales

--Daily Trend
select To_CHAR(order_date,'Day')as order_day,Count(Distinct order_id)as total_orders from pizza_sales
group by order_day
order by total_orders desc

--Hourly Trend
select EXTRACT(Hour from order_time) as Hour_of_day, count(Distinct order_id)as total_order from pizza_sales
group by Hour_of_day


select pizza_category,sum(total_price)*100/(select sum(total_price)from pizza_sales) as percentage_of_sales
from pizza_sales
group by pizza_category

select pizza_category,sum(total_price)*100/(select sum(total_price) from pizza_sales
										   where Extract(Month from order_date)=1) as percentage_of_sales
from pizza_sales
where Extract(Month from order_date)=1
group by pizza_category



select * from pizza_sales

select pizza_size, CAST(sum(total_price)*100/(select sum(total_price) from pizza_sales)as decimal(10,2)) as sales_percentage
from pizza_sales
group by pizza_size
order by sales_percentage DESC



select pizza_size, CAST(sum(total_price)*100/(select sum(total_price) from pizza_sales
											 Where EXTRACT(QUARTER FROM order_date)=1)as decimal(10,2)) as sales_percentage
from pizza_sales
Where EXTRACT(QUARTER FROM order_date)=1
group by pizza_size
order by sales_percentage DESC




select pizza_category, sum(QUANTITY) AS TOTAL_PIZZA_SOLD
from pizza_sales
group by pizza_category


select * from pizza_sales

SELECT pizza_name,sum(quantity)as Total_pizza_sold from pizza_sales
group by pizza_name
order by Total_pizza_sold desc
limit 5


SELECT pizza_name,sum(quantity)as Total_pizza_sold from pizza_sales
WHERE extract(month from order_date)=8
group by pizza_name
order by Total_pizza_sold asc
limit 5








































