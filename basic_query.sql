-- basic query 

select * from customer_data_with_churn;

-- sengment the customer based on Annual_income 

select 
Name,
case 
	when Annual_income < 30000 then 'Low_income'
	when Annual_income between 30000 and 60000 then 'Mid_income'
	Else 'High_income'
End as income_segment
from customer_data_with_churn;
--- find the total number of customer based on segmentation ?
select 
case 
	when Annual_income < 30000 then 'Low_income'
	when Annual_income between 30000 and 60000 then 'Mid_income'
	Else 'High_income'
End as income_segment,
count(*) as customer_count
from customer_data_with_churn
group by case 
	when Annual_income < 30000 then 'Low_income'
	when Annual_income between 30000 and 60000 then 'Mid_income'
	Else 'High_income'
End;

-- segment the customer based on Spending_score 
select
CustomerID,
Name,
case 
	when Spending_score < 40 then 'low_value'
	when Spending_score between 40 and 70 then 'mid_value'
	else 'high_value'
End as spending_segment 
from customer_data_with_churn;

-- find the total number of customer for each spending_segment 

select
case 
	when Spending_score < 40 then 'low_value'
	when Spending_score between 40 and 70 then 'mid_value'
	else 'high_value'
End as spending_segment,
count(*) as customer_count 
from customer_data_with_churn
group by 
case 
	when Spending_score < 40 then 'low_value'
	when Spending_score between 40 and 70 then 'mid_value'
	else 'high_value'
End
order by count(*) asc;

-- find those customer who's annaul income more average annual income with platinum membership ?
with platinum_ as (
select
Membership_Level,
Name,
Annual_income
from customer_data_with_churn
where Annual_Income > (select avg(Annual_Income) from customer_data_with_churn)
)
select 
*
from platinum_
where Membership_level = 'platinum'

-- customer raking based on purchase_frequncy, top 20% customer 
select 
CustomerID,
Name,
Purchase_frequency,
Ntile(5) over(order by Purchase_frequency desc) as purchased_rank
from customer_data_with_churn;

-- find the churn percentage based on membership level 
select 
Membership_level,
sum(case when Churn_status = 1 then 1 else 0 end)*100/count(*) as churn_percentage 
from customer_data_with_churn
group by Membership_level;

-- find those customer who' has churned based on gender  ?
select
Gender,
case 
	when Churn_status = 1 then 'Churned'
	else 'Not_churned'
end as customer_churn,
count(*) as customer_count 
from customer_data_with_churn
group by 
case 
	when Churn_status = 1 then 'Churned'
	else 'Not_churned'
end, Gender
