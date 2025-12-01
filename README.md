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

SELECT * FROM Customers;

### 2 Select Specific Columns
SELECT CustomerID, Name, Income, Segmentation
FROM Customers;

### 3. Filter by Segmentation
Get the customers who belong to the "High-Value" segment.

SELECT * FROM Customers
WHERE Segmentation = 'High-Value';

###4. Group by Segmentation
Find the number of customers in each segmentation group.

SELECT Segmentation, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY Segmentation;

###5. Find Customers with High Income
Select customers who have an income greater than 75,000

SELECT * FROM Customers
WHERE Income > 75000;

###6.  Order Customers by Recency
Sort the customers by recency of their last purchase (most recent first).

SELECT * FROM Customers
ORDER BY Recency DESC;

###7. Find Average Monetary Value
Calculate the average monetary value spent by customers.

SELECT AVG(Monetary) AS AverageMonetary
FROM Customers;

###8. Using Case for Income Categories
Use a CASE statement to categorize customers based on their income.

SELECT CustomerID, Name, Income,
       CASE
           WHEN Income > 70000 THEN 'High Income'
           WHEN Income BETWEEN 40000 AND 70000 THEN 'Medium Income'
           ELSE 'Low Income'
       END AS IncomeCategory
FROM Customers;

###9. Top 3 Customers by Monetary Value

SELECT TOP 3 * FROM Customers
ORDER BY Monetary DESC;

###9. Segment Customers by Age Range
 create segments like "Youth," "Adult," and "Senior" based on age ranges.

SELECT CustomerID, Name, Age,
       CASE
           WHEN Age < 30 THEN 'Youth'
           WHEN Age BETWEEN 30 AND 50 THEN 'Adult'
           ELSE 'Senior'
       END AS AgeGroup
FROM Customers;

###10. Analyze Spending Trends by Gender
Compare average spending based on gender.

SELECT Gender, AVG(Monetary) AS AvgSpending
FROM Customers
GROUP BY Gender;


## Data Insights
- The segmentation revealed three distinct customer groups: high spenders, medium spenders, and low spenders. This helps tailor 
  marketing strategies.
- Customers with frequent premium item purchases were categorized as high spenders.
- Recent Purchases: Customers who made recent purchases should be targeted with follow-up offers or loyalty rewards.
- Sorting customers by recency shows those who are most engaged, allowing targeted follow-ups to retain them.
- Identifying top spenders allows for the creation of VIP offers and loyalty programs.

