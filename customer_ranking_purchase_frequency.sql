-- Ranking 
-- ranking customer by purchase frequency 

select 
CustomerID,
Name,
Purchase_Frequency,
DENSE_RANK() over(order by Purchase_Frequency) as customer_rank
from customer_data_with_churn;