USE apexplanet_task2;
SHOW TABLES;

DESCRIBE Sales;

SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'apexplanet_task2'
AND TABLE_NAME = 'Sales';

SELECT COUNT(*) AS total_records
FROM Sales;

SELECT *
FROM Sales
LIMIT 10;


-- Question 1: Which are the top 5 products by revenue?
SELECT
    Product,
    ROUND(SUM(Total_Sales),2) AS Total_Revenue
FROM Sales
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Question 2: Which category generates the highest revenue?
SELECT
    Category,
    ROUND(SUM(Total_Sales),2) AS Category_Revenue
FROM Sales
GROUP BY Category
ORDER BY Category_Revenue DESC;

-- Question 3: What is the monthly sales trend?
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    ROUND(SUM(Total_Sales),2) AS Monthly_Revenue
FROM Sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Sales_Month;

-- Question 4: Which city generates the highest sales?
SELECT
    City,
    ROUND(SUM(Total_Sales),2) AS City_Revenue
FROM Sales
WHERE City IS NOT NULL
GROUP BY City
ORDER BY City_Revenue DESC;

-- Question 5: Who are the top 5 customers by spending?
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Total_Sales) AS Total_Spending
FROM Sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Spending DESC
LIMIT 5;

-- Question 6: What is the average order value?
SELECT
    SUM(Total_Sales) /
    COUNT(DISTINCT Order_ID) AS Average_Order_Value
FROM Sales;

