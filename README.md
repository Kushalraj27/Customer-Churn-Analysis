# Customer Churn Analysis | SQL + Python + Power BI

## Project Overview

This project performs an end-to-end analysis of a telecom customer churn dataset to identify the factors that influence customer retention and churn. 
The project combines SQL, Python, and Power BI to demonstrate the complete analytics workflow: data cleaning, exploratory analysis, business querying, 
KPI reporting, and interactive dashboard development.

## Dataset Information

* Dataset: Customer Churn Prediction Dataset
* Records: 7,042 customers
* Features: 21 columns
* Domain: Telecom / Customer Retention Analytics

Each row represents a single customer and contains demographic information, subscribed services, billing details, contract type, and churn status.

### Key Columns

* customerID - Unique customer identifier
* gender - Male/Female
* SeniorCitizen - Senior citizen flag (0/1)
* Partner - Whether the customer has a partner
* Dependents - Whether the customer has dependents
* tenure - Number of months with the company
* PhoneService - Phone service subscription
* InternetService - DSL / Fiber optic / No internet
* OnlineSecurity - Security service subscription
* TechSupport - Technical support subscription
* Contract - Month-to-month / One year / Two year
* PaymentMethod - Customer payment method
* MonthlyCharges - Monthly billing amount
* TotalCharges - Total amount charged
* Churn - Whether the customer left the company (Yes/No)

## Project Objectives

* Analyze customer churn patterns
* Identify high-risk customer segments
* Measure revenue impact of churn
* Build business-focused SQL queries
* Create an interactive Power BI dashboard
* Perform exploratory data analysis in Python

## Topics Covered

### SQL Topics

* SELECT, WHERE, ORDER BY
* Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
* GROUP BY and HAVING
* CASE Statements
* Window Functions (RANK, DENSE_RANK, ROW_NUMBER)
* Common Table Expressions (CTEs)
* Business KPI calculations

### Python Topics

* Data Cleaning
* Missing Value Handling
* Exploratory Data Analysis (EDA)
* Correlation Analysis
* Feature Engineering
* Data Visualization using Matplotlib and Seaborn

### Power BI Topics

* KPI Cards
* DAX Measures
* Donut Charts
* Bar Charts
* Line Charts
* Treemaps
* Slicers
* Drill Down
* Drill Through
* Interactive Filtering

## Business Questions Solved

* What is the overall churn rate?
* Which contract type has the highest churn?
* Which payment method loses the most customers?
* Which internet service generates the highest revenue?
* How does tenure affect churn?
* What is the total revenue lost due to churn?
* Which customer segment is most valuable?
* Who are the high-risk customers likely to churn?

## Power BI Dashboard

The dashboard contains six pages:

1. Executive Summary
2. Customer Demographics
3. Service Analysis
4. Revenue Analysis
5. Churn Analysis
6. Customer Risk Analysis

### Executive Summary KPIs

* Total Customers: 7,042
* Active Customers: 5,173
* Churn Customers: 1,869
* Churn Rate: 26.54%
* Total Revenue: 16.05M
* Revenue Lost: 2.86M
* Average Monthly Charges: 64.76

### Interactive Features

* Gender slicer
* Contract slicer
* Drill Down hierarchy
* Drill Through to Customer Details page
* Cross-filtering across visuals

## Key Insights

* Month-to-month contracts show the highest churn.
* Customers without Tech Support churn more frequently.
* Fiber Optic customers have higher churn compared to DSL customers.
* Higher monthly charges are associated with increased churn.
* Longer-tenure customers are generally more loyal.
* Electronic Check is the payment method with the highest churn count.
* Churn results in significant revenue loss, indicating opportunities for retention strategies.

## Tools & Technologies

* SQL (MySQL)
* Python (Pandas, NumPy, Matplotlib, Seaborn)
* Power BI
* Power Query
* DAX
  
## Learning Outcomes

Through this project, I strengthened my skills in:

* SQL querying and business analytics
* Data cleaning and transformation
* Exploratory data analysis
* DAX calculations
* Dashboard design and storytelling
* Interactive report development in Power BI

