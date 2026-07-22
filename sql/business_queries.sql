SELECT Country, 
   ROUND(SUM(Revenue), 2) as Total_Revenue,
       COUNT(DISTINCT CustomerID) as Unique_Customers
FROM retail 
GROUP BY Country 
ORDER BY Total_Revenue DESC
LIMIT 5

-- Revenue by Country


SELECT Description, 
    ROUND(SUM(Revenue), 2) as Revenue
FROM retail 
GROUP BY Description 
ORDER BY Revenue DESC
LIMIT 20

-- Top 20 Products by Revenue

 
SELECT YearMonth,
  ROUND(SUM(Revenue), 2) as Monthly_Revenue 
FROM retail 
GROUP BY YearMonth 
ORDER BY Monthly_Revenue DESC

-- Monthly Revenue Trend


WITH customer_revenue AS (            
    SELECT CustomerID, SUM(Revenue) as Total            
    FROM retail GROUP BY CustomerID        
),
ranked AS (            
    SELECT *, NTILE(10) OVER (ORDER BY Total DESC) as Decile 
    FROM customer_revenue
)        
SELECT Decile, ROUND(SUM(Total), 2) as Revenue_Per_Decile
FROM ranked 
GROUP BY Decile
ORDER BY Decile

-- Customer Revenue Concentration (Decile Analysis)



