-- segmentation based on Spending score 

select 
case 
	when Spending_score < 40 then 'low_score'
	when spending_score between 40 and 70 then 'mid_score'
	else 'high_score'
End as spend_segment ,
count(*) as customer_count
from customer_data_with_churn
group by 
case 
	when Spending_score < 40 then 'low_score'
	when spending_score between 40 and 70 then 'mid_score'
	else 'high_score'
End
order by count(*) asc;