-- Create table
Create table retailsale
(
		transactions_id int primary key, 
		sale_date	DATE, 
		sale_time	Time, 
		customer_id	int, 
		gender	varchar(30),
		age	int,
		category	varchar(30),
		quantiy	int ,
		price_per_unit	float,
		cogs	float,
		total_sale float

)

-- Insert data via Import 
--View importad Data 
Select * from retailsale

Select count(*) from retailsale

Select * from retailsale where 
		transactions_id is NULL or 
		sale_date	is Null or  
		sale_time	is Null or  
		customer_id	is Null or  
		gender	is Null or 
		age	is Null or 
		category	is Null or 
		quantiy	is Null or 
		price_per_unit	is Null or 
		cogs	is Null or 
		total_sale is Null 

Delete from retailsale where 
		transactions_id is NULL or 
		sale_date	is Null or  
		sale_time	is Null or  
		customer_id	is Null or  
		gender	is Null or 
		age	is Null or 
		category	is Null or 
		quantiy	is Null or 
		price_per_unit	is Null or 
		cogs	is Null or 
		total_sale is Null 
Select * from retailsale

Select count(*) from retailsale
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
Select * from retailsale where sale_date='2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
Select * from retailsale 
where 
	category='Clothing'
	And Extract (Year from sale_date) = 2022
	And Extract (Month from sale_date) =11
	AND quantiy >3


Select * from retailsale 
where 
	Extract (Year from sale_date) = 2022
	And Extract (Month from sale_date) =11
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
Select category,sum(total_sale) from retailsale group by category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
Select round(avg(age),2) from retailsale
 where category ='Beauty' 

--Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
Select * from retailsale where total_sale >1000


--Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

Select category,gender,count(transactions_id) from retailsale group by category,gender


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
Select customer_id,sum(total_sale) as total_Sales from retailsale group by customer_id order by total_Sales desc limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
Select count(distinct customer_id),category from retailsale  group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
Select  
case 
when Extract(hour from sale_time)<12 THEN 'Morning Shift'
when Extract(hour from sale_time) between 12 AND 17 THEN 'Afternoon Shift'
Else 'Evening Shift'
End as shift, count(transactions_id) from retailsale group by 
case 
when Extract(hour from sale_time)<12 THEN 'Morning Shift'
when Extract(hour from sale_time) between 12 AND 17 THEN 'Afternoon Shift'
Else 'Evening Shift'
End Order by count(transactions_id) desc;
