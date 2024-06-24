select * from pizzadb.pizza_sales;

/*Total Revenue*/
select sum(total_price) as Total_Price from pizzadb.pizza_sales;

/*Average Order Value*/
select sum(total_price)/count(distinct order_id) as Avg_Order_Value from pizzadb.pizza_sales;

/*Total Pizzas Sold*/
select sum(quantity) as Total_Pizzas_Sold from pizzadb.pizza_sales;

/*Total Orders*/
select count(distinct order_id) as Total_orders from pizzadb.pizza_sales;

/*Average Pizzas Per Order*/
select sum(quantity)/count(distinct order_id) as Avg_Pizzas_Per_Order from pizzadb.pizza_sales;

/*Daily Trend for orders*/
select dayname(str_to_date(order_date,"%d-%m-%Y")) as order_day,count(distinct order_id) as total_orders
from pizzadb.pizza_sales
group by dayname(str_to_date(order_date,"%d-%m-%Y"));

/*Monthly Trend for orders*/
select monthname(str_to_date(order_date,"%d-%m-%Y")) as Order_Month,count(distinct order_id) as total_orders
from pizzadb.pizza_sales
group by monthname(str_to_date(order_date,"%d-%m-%Y"));

/*Percentage of sales by pizza category*/
select pizza_category, sum(total_price) * 100/(select sum(total_price) from pizzadb.pizza_sales) as "Sales by pizza category"
from pizzadb.pizza_sales
group by pizza_category;

/*Percentage of sales by pizza size*/
select pizza_size, sum(total_price) * 100/(select sum(total_price) from pizzadb.pizza_sales) as "Sales by pizza size"
from pizzadb.pizza_sales
group by pizza_size;

/*Total pizzas sold by pizza category*/
select pizza_category , count(pizza_category) as "Total pizzas"
from pizzadb.pizza_sales
group by pizza_category;

/* Top 5 best-sellers by revenue, total quantity and total orders*/
select pizza_name, sum(total_price) as Revenue
from pizzadb.pizza_sales
group by pizza_name
order by revenue DESC limit 5; 

/* Bottom 5 best-sellers by revenue*/
select pizza_name, sum(total_price) as Revenue
from pizzadb.pizza_sales
group by pizza_name
order by revenue limit 5; 

/*Top 5 best-sellers by total quantity*/
select pizza_name, sum(quantity) as "Total_Quantity"
from pizzadb.pizza_sales
group by pizza_name
order by Total_Quantity DESC limit 5; 

/*Bottom 5 best-sellers by total quantity*/
select pizza_name, sum(quantity) as "Total_Quantity"
from pizzadb.pizza_sales
group by pizza_name
order by Total_Quantity limit 5; 

/*Top 5 best-sellers by total orders*/
select pizza_name, count(distinct order_id) as "Total_Orders"
from pizzadb.pizza_sales
group by pizza_name
order by Total_Orders DESC limit 5; 

/*Bottom 5 best-sellers by total orders*/
select pizza_name, count(distinct order_id) as "Total_Orders"
from pizzadb.pizza_sales
group by pizza_name
order by Total_Orders limit 5; 

