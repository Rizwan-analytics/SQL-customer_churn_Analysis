-- Ranking   
--6. top 20% customer by spending_score  
with ranked as (
select
CustomerID,
Name,
Spending_score,
Ntile(5) over(order by Spending_score desc) as quintile
from customer_data_with_churn
)
select 
*
from ranked 
where quintile = 1
