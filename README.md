# Customer-segmentation analysis 

## Overview 
This project demonstrates customer segmentation using SQL. By analyzing customer behaviors, income, spending patterns, and demographic attributes, uncovered actionable insights to support targeted marketing strategies.
## Objectives
* Segment customers based on income, spending frequency, and recency.
* Identify high-value customer segments for targeted marketing.
* Ranking customer based on Annual_income and Spending_score
* identify the churn percentage based on membership_level

## Dataset
This dataset consists the following attributes 
* CustomerID : unique identifier for each customer
* Name : cusotmer's name
* Age : customer's age
* Gender : customer's gender
* Annual_income : annual_income of customer
* Spending_score : Spending score of customer
* Purchase_frequency : how many times did purchase
* churn_status : customer in service or leave the service

## SQL Analysis and Queries 

select * from customer_data_with_churn;

### select specific columns 
select 
	CustomerID,
	Name,
	Age, 
	Gender 
from customer_data_with_churn;

### filer by segmentation 
get the customer who belongs to 'high_value' segment 

with segmented as(
	select 
	Name,
case 
	when Annual_income < 30000 then 'low_value'
	when Annual_income between 30000 and 60000 then 'mid_value'
	else 'high_value'
End as income_segment
from customer_data_with_churn
)
select 
*
from segmented 
where income_segment = 'high_value';
### group by segmentation 
find the number of customer in each segmentation group? 
select 
case 
	when Annual_income < 30000 then 'low_value'
	when Annual_income between 30000 and 60000 then 'mid_value'
	else 'high_value'
End as income_segment,
count(*) as customer_count
from customer_data_with_churn
group by 
case 
	when Annual_income < 30000 then 'low_value'
	when Annual_income between 30000 and 60000 then 'mid_value'
	else 'high_value'
End
order by count(*) desc;

### find the customer with high income?

select 
*
from customer_data_with_churn
where Annual_income > 75000;

### find the average_spending score ?
select 
avg(Spending_score) as avg_spending 
from customer_data_with_churn;

### Ranking the customer by purchase frequency 
select 
CustomerID,
Name,
Purchase_Frequency,
DENSE_RANK() over(order by Purchase_Frequency) as customer_rank
from customer_data_with_churn;

find the churn percentage on the basis of membership level ?

select 
Membership_level,
sum(case when Churn_status = 1 then 1 else 0 End)*100/count(*) as churn_percentage 
from customer_data_with_churn
group by Membership_Level


