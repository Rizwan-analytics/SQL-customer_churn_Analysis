-- churn analysis 
-- find the churn percentage based on membership_level  
select 
Membership_level,
sum(case when Churn_status = 1 then 1 else 0 End)*100/count(*) as churn_percentage 
from customer_data_with_churn
group by Membership_Level
