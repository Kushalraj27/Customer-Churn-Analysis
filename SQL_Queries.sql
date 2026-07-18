-- Creating Database

create database customer_churn;

use customer_churn;

desc churn_prediction;

 -- Check Missing Values
 
select * from churn_prediction
where TotalCharges is null;

-- 1.Total Customers

select count(*) as total_customer
from churn_prediction;
 
 -- 2.customer ID and gender
 
select customerID , gender
from churn_prediction;

-- 3.unique contract

select distinct Contract
from churn_prediction;  

-- 4.Customer's Monthly chagres whose Charge is greater than 80

select CustomerID, MonthlyCharges
from churn_prediction
where MonthlyCharges > 80;

-- 5.Count customers in different monthly charge ranges
SELECT
    CASE
      WHEN MonthlyCharges < 40 THEN 'LOW'
      WHEN MonthlyCharges BETWEEN 40 AND 80 THEN 'MEDIUM'
      ELSE 'HIGH'
    END AS Charge_Category,
    COUNT(*) AS Customer_Category
from churn_prediction
GROUP BY Charge_Category;

-- 6.Find customers with month-to-month contracts
SELECT count(*) AS Month_to_Month_Customer
FROM churn_prediction
WHERE Contract= 'Month-to-Month';

-- 7.Find customers having internet service
SELECT count(*) AS cus
from churn_prediction
where InternetService <>'No';

-- 8.Find Sceond Highest Monthlycharges
select max(MonthlyCharges)
from churn_prediction
where MonthlyCharges < (select MAX(MonthlyCharges)
from churn_prediction);

-- 9. Find customers with tenure greater than 24 months
select CustomerID
from churn_prediction
where tenure >24;

-- 10.Avg MonthlyCharges
select Round(AVG(MonthlyCharges),2) AS AVG_Monthly_charges
from churn_prediction;

-- 11. Find Total revenue
select round(sum(TotalCharges),2) as total_revenue
from churn_prediction;

-- 12. To count churned customer & to find active customer -> churn = No
select count(CustomerID)
from churn_prediction
where Churn = 'Yes';

-- 13.To find Avg Tenure
select AVG(tenure)
from churn_prediction;

-- 14. TO find highest revenue customer & lowest remove desc
select CustomerID,TotalCharges
from churn_prediction
order by TotalCharges desc
limit 1;

-- 15. to find customer by gender
select gender,count(*)
from churn_prediction
group by gender;

-- 16.Customer by Contract
select Contract,count(*)
from churn_prediction
group by Contract;

-- 17.Revenue By Contract
select Contract,round(sum(TotalCharges),2)
from churn_prediction
group by Contract;

-- 18.Average Monthly Charges by Contract
select round(avg(MonthlyCharges),2),Contract
from churn_prediction
group by Contract;

-- 19. Churn By Contract
select Contract,
sum(case when Churn='Yes' then 1 else 0 End) as customer_lost_by_contract
from churn_prediction
group by Contract;

-- 20.Churn By Gender
select gender,
sum(case when Churn='Yes' then 1 else 0 end) as churn_by_gender
from churn_prediction
group by gender;

-- 21.Revenue By Payment Method
select PaymentMethod,
round(sum(TotalCharges),2) as revenue_by_payment
from churn_prediction
group by PaymentMethod;

-- 22.Customer by internet service
select InternetService,
count(*) as customer_by_internetservice
from churn_prediction
group by InternetService;

-- 23.Avg tenure by Contract
select Contract,
avg(tenure)
from churn_prediction
group by Contract;

-- 24.Churn By Payment Method
select Paymentmethod,
sum(case when Churn='Yes' then 1 else 0 end) as Churn_by_paymentmethod
from churn_prediction
group by PaymentMethod;
 
-- 25. Customer Segment
select 
count(*),
case
when TotalCharges > 5000 then 'VIP'
when TotalCharges > 3000 then 'HIGH'
when TotalCharges > 1000 then 'MEDIUM'
else 'LOW'
end as customer_segment
from churn_prediction
group by customer_segment;

-- 26. High Bill Customer
select count(*),
Case
when MonthlyCharges >100 then 'High Bill'
else 'Normal'
end as high_bill_customer
from churn_prediction
group by high_bill_customer;

-- 27. Churn Rate /Churn=No => Retention rate
select round(sum(case when Churn='Yes' then 1 else 0 end )*100/count(*),2)
as Churn_Rate
from churn_prediction;

-- 28.Average Monthly Charges of Churned Customers
select round(avg(MonthlyCharges),2) 
from churn_prediction
where Churn='Yes';

-- 29. Top Revenue By Contract
select Contract,
round(sum(TotalCharges),2) as Contract_revenue
from churn_prediction
group by Contract
order by sum(TotalCharges) desc;

-- 30.Rank Customer By Revenue
select customerID,TotalCharges,
Rank() over(order by TotalCharges desc) Rank_no
from churn_prediction;

-- 31. Dense Rank
select customerID,TotalCharges,
dense_rank() over (order by TotalCharges desc) as dense_ranking
from churn_prediction;

-- 32.Row Number
SELECT
customerID,
ROW_NUMBER() OVER(ORDER BY TotalCharges DESC)
FROM churn_prediction;

-- 33. Running Revenue
SELECT
customerID,
TotalCharges,
round(SUM(TotalCharges) OVER(ORDER BY tenure))
FROM churn_prediction;

-- 34. Avg Revenue By Contract
select customerID,Contract,
round(AVg(TotalCharges) over(partition by Contract))
from churn_prediction;

-- 35. High Revenue Customer
with revenue as
(select * from churn_prediction
where TotalCharges>5000)
select * from revenue;

-- 36. High Churn Risk
with Risk as(
select *,
case
when Contract='Month-to-month' and tenure <12 then 'High Risk'
else 'Low Risk'
end as RiskLevel
from churn_prediction)
select * from Risk;

-- 37. Which Contract has the highest churn rate?
select Contract,
round(sum(case when Churn='Yes' then 1 else 0 end )*100/count(*),2)
as Churn_Rate
from churn_prediction
group by Contract
order by Churn_Rate;

-- 38.Which payment method loses the most customers?
select PaymentMethod,
count(*) as Churncustomer
from churn_prediction
where Churn ='Yes'
group by PaymentMethod
order by Churncustomer desc;

-- 39. Which internet service has the highest revenue?
select InternetService,
max(TotalCharges) as highest_revenue
from churn_prediction
group by InternetService;

