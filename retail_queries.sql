USE 
	my_table;

-- Retail Sales SQL Analysis Queries
-- Author: Aman
-- Dataset: Superstore (Retail)
-- Tools: PostgreSQL/MySQL/SQLite
-- Description: Business insights from regional, temporal, product, and customer perspectives
-- --------------------------------------------------------------------------------------------

-- 1. 📊 Total Sales and Profit by Region
-- Purpose: Compare how each region performs in terms of revenue and profitability
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- --------------------------------------------------------------------------------------------

-- 2. 📈 Monthly Sales Trend
-- Purpose: Understand how sales are distributed across months and years (seasonality analysis)
SELECT 
    EXTRACT(YEAR FROM `Order Date`) AS Year,
    EXTRACT(MONTH FROM `Order Date`) AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM retail_data
GROUP BY Year, Month
ORDER BY Year, Month;

-- --------------------------------------------------------------------------------------------

-- 3. 🏆 Top 10 States by Sales
-- Purpose: Identify the highest revenue-generating states to focus business efforts
SELECT 
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM retail_data
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- --------------------------------------------------------------------------------------------

-- 4. 🔎 Segment-wise Profit by Region
-- Purpose: Analyze which customer segments contribute most profit in each region
SELECT 
    Region,
    Segment,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data
GROUP BY Region, Segment
ORDER BY Region, Total_Profit DESC;

-- --------------------------------------------------------------------------------------------

-- 5. 📊 Category and Sub-Category Profitability
-- Purpose: Compare profit margins across sub-categories to identify high-margin areas
SELECT 
    Category,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Category,`Sub-Category`
ORDER BY Profit_Margin_Percent DESC;

-- --------------------------------------------------------------------------------------------

-- 6. ⭐ Top 10 Products by Total Sales
-- Purpose: Discover top-selling products to identify demand trends
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM retail_data
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- --------------------------------------------------------------------------------------------

-- 7. ⚠️ Bottom 10 Products by Profit
-- Purpose: Flag products that consistently lose money to potentially discontinue or improve pricing
SELECT 
    `Product Name`,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 10;

-- --------------------------------------------------------------------------------------------

-- 8. 💸 Discount Level Impact on Profit
-- Purpose: Assess whether deeper discounts hurt profit margins
SELECT 
    ROUND(Discount, 2) AS Discount_Level,
    COUNT(*) AS Order_Count,
    ROUND(AVG(Profit), 2) AS Avg_Profit
FROM retail_data
GROUP BY Discount_Level
ORDER BY Discount_Level;

-- --------------------------------------------------------------------------------------------

-- 9. 📉 Monthly Average Discount Trend
-- Purpose: Track if average discount levels have increased or decreased over time
SELECT 
    EXTRACT(YEAR FROM `Order Date`) AS Year,
    EXTRACT(MONTH FROM `Order Date`) AS Month,
    ROUND(AVG(Discount), 2) AS Avg_Discount
FROM retail_data
GROUP BY Year, Month
ORDER BY Year, Month;

-- --------------------------------------------------------------------------------------------

-- 10. 📦 Quantity Sold by Segment
-- Purpose: Evaluate which customer segment is buying the most in terms of volume
SELECT 
    Segment,
    SUM(Quantity) AS Total_Quantity
FROM retail_data
GROUP BY Segment
ORDER BY Total_Quantity DESC;

