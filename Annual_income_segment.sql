-- segmentation analysis
-- customer segmentation based on annual income 

select 
case 
	when Annual_income < 30000 then 'low_income'
	when Annual_income between 30000 and 60000 then 'mid_income'
	else 'high_income'
End as income_segement,
count(*) as customer_count 
from customer_data_with_churn
group by 
case 
	when Annual_income < 40000 then 'low_income'
	when Annual_income between 40000 and 60000 then 'mid_income'
	else 'high_income'
End;
