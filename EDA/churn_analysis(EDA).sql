# Exploratory Data Analysis
Select * from customer_data;

# Gender-wise Customer Distribution with Percentage Contribution
select Gender, count(Gender) as TotalCount,
count(Gender) / (select count(*) from customer_data) * 100 as Percentage
from customer_data
group by Gender;

# Contract-wise Customer Distribution with Percentage Contribution
select Contract, count(Contract) as TotalCount,
count(Contract) / (select count(*) from customer_data) * 100 as Percentage
from customer_data
group by Contract
order by TotalCount desc;

# Customer Status-wise Revenue Contribution and Distribution Analysis
select Customer_Status, count(Customer_Status) as TotalCount, sum(Total_Revenue) as total_rev,
sum(Total_Revenue) / (select sum(Total_Revenue) from customer_data) * 100 as Percentage
from customer_data
group by Customer_Status;

# State-wise Customer Segmentation to Identify Regional Churn Patterns
Select state, count(State) as TotalCount,
count(state) / (select count(*) from customer_data) * 100 as Percentage
from customer_data
group by State
order by Percentage desc;

Select distinct Internet_type from customer_data;

# Data Exploration – Check Nulls
SELECT 
    SUM(CASE WHEN Customer_ID IS NULL OR Customer_ID = '' THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL OR Gender = '' THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL OR Age = '' THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL OR Married = '' THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL OR State = '' THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL OR Number_of_Referrals = '' THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL OR Tenure_in_Months = '' THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL OR Value_Deal = '' THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL OR Phone_Service = '' THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL OR Multiple_Lines = '' THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL OR Internet_Service = '' THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL OR Internet_Type = '' THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL OR Online_Security = '' THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL OR Online_Backup = '' THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL OR Device_Protection_Plan = '' THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL OR Premium_Support = '' THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL OR Streaming_TV = '' THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL OR Streaming_Movies = '' THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL OR Streaming_Music = '' THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL OR Unlimited_Data = '' THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL OR Contract = '' THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL OR Paperless_Billing = '' THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL OR Payment_Method = '' THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL OR Monthly_Charge = '' THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL OR Total_Charges = '' THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL OR Total_Refunds = '' THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL OR Total_Extra_Data_Charges = '' THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL OR Total_Long_Distance_Charges = '' THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL OR Total_Revenue = '' THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL OR Customer_Status = '' THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL OR Churn_Category = '' THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL OR Churn_Reason = '' THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM customer_data;

# Data Preprocessing: Cleaning and Standardizing Null Values for Accurate Churn Analysis
UPDATE customer_data
SET 
    Value_Deal = NULLIF(TRIM(REPLACE(Value_Deal, 'NULL', '')), ''),
    Multiple_Lines = NULLIF(TRIM(REPLACE(Multiple_Lines, 'NULL', '')), ''),
    Internet_Type = NULLIF(TRIM(REPLACE(Internet_Type, 'NULL', '')), ''),
    Online_Security = NULLIF(TRIM(REPLACE(Online_Security, 'NULL', '')), ''),
    Online_Backup = NULLIF(TRIM(REPLACE(Online_Backup, 'NULL', '')), ''),
    Device_Protection_Plan = NULLIF(TRIM(REPLACE(Device_Protection_Plan, 'NULL', '')), ''),
    Premium_Support = NULLIF(TRIM(REPLACE(Premium_Support, 'NULL', '')), ''),
    Streaming_TV = NULLIF(TRIM(REPLACE(Streaming_TV, 'NULL', '')), ''),
    Streaming_Movies = NULLIF(TRIM(REPLACE(Streaming_Movies, 'NULL', '')), ''),
    Streaming_Music = NULLIF(TRIM(REPLACE(Streaming_Music, 'NULL', '')), ''),
    Unlimited_Data = NULLIF(TRIM(REPLACE(Unlimited_Data, 'NULL', '')), ''),
    Churn_Category = NULLIF(TRIM(REPLACE(Churn_Category, 'NULL', '')), ''),
    Churn_Reason = NULLIF(TRIM(REPLACE(Churn_Reason, 'NULL', '')), '');

# Create a production-ready churn dataset by transforming and cleaning raw customer data for analysis and reporting
CREATE TABLE customer.prod_Churn AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    IFNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    IFNULL(Multiple_Lines, 'No') AS Multiple_Lines,
    Internet_Service,
    IFNULL(Internet_Type, 'None') AS Internet_Type,
    IFNULL(Online_Security, 'No') AS Online_Security,
    IFNULL(Online_Backup, 'No') AS Online_Backup,
    IFNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
    IFNULL(Premium_Support, 'No') AS Premium_Support,
    IFNULL(Streaming_TV, 'No') AS Streaming_TV,
    IFNULL(Streaming_Movies, 'No') AS Streaming_Movies,
    IFNULL(Streaming_Music, 'No') AS Streaming_Music,
    IFNULL(Unlimited_Data, 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    IFNULL(Churn_Category, 'Others') AS Churn_Category,
    IFNULL(Churn_Reason, 'Others') AS Churn_Reason
from customer_data;

# Creating view for Churn prediction
create view  vw_ChurnData as
	select * from prod_churn
    where Customer_Status IN ('Churned', 'Stayed');
    
create view  vw_JoinData as
	select * from prod_churn
    where Customer_Status = 'Joined';


