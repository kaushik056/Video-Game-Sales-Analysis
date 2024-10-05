USE MAIN
SELECT * 
FROM Dataset

-- What are the top 10 bestselling games of all time?
SELECT Top 10 Game_Title, ROUND(SUM(Global_Sales),1) AS Total_Sales
FROM  Dataset
GROUP BY  Game_Title
ORDER BY Total_Sales DESC;
-- The top 10 list predominantly comprises titles from just two franchises: Call of Duty and Grand Theft Auto.
-- The prevalence of these two franchises underscores their dominant position in the gaming industry.

-- Who are the top 10 publisher with the highest total sales?
SELECT top 10 Publisher, ROUND(SUM(Global_Sales),1) AS Total_Sales , COUNT(*) AS Game_Count
FROM Dataset
GROUP BY Publisher
ORDER BY Total_Sales DESC
-- Activision stands out as the leader in sales among the listed game publishers.
-- Rockstar Games secured a spot on the list, despite having a relatively modest catalog of only 55 games.
-- Making it the sole publisher on the list with a double-digit count of released games.

-- Describe the sales trends of video games over the past century.
SELECT YEAR(Release_Date) AS Release_Year, ROUND(SUM(Global_Sales),1) AS Total_Sales
FROM Dataset
GROUP BY YEAR(Release_Date) 
ORDER BY Release_Year 
OFFSET 24 ROWS
FETCH NEXT 25 ROWS ONLY;
-- Video game sales experienced a notable upsurge starting from the 2005 period.
-- Continuing on an upward trajectory until reaching their pinnacle in 2011.
-- Following 2014, video game sales exhibited a downward trend.
-- Culminating in 2020 with a historic low, the sales figures plummeted to a meager 0.7, marking the lowest recorded in the 21st century.

-- How do the platforms compare in terms of sales, and what is the distribution of games across these platforms?"
SELECT Platform, ROUND(SUM(Global_Sales),1) AS Total_Sales , COUNT(*) AS Game_Count
FROM Dataset
GROUP BY Platform
ORDER BY Total_Sales DESC;
-- Xbox 360 and PlayStation 3 lead in sales despite fewer available games.
-- Despite a substantial release count of 12,615 games on the PC platform, it attained the lowest sales compared to its contemporaries.
-- We'll exclude PS5 and Xbox Series consoles from our analysis due to the absence of sales data for these platforms.

--What is the correlation between the genre of a video game and its global sales?
SELECT Genre, ROUND(SUM(Global_Sales),1) AS Total_Global_Sales 
FROM Dataset
WHERE Global_Sales IS NOT NULL
GROUP BY Genre
ORDER BY Total_Global_Sales DESC;
-- The genres of Shooter, Action, and Sports appear to dominate the top ranks in terms of competitiveness and sales.
-- However, beyond the third position, there is a significant drop-off in sales for games belonging to other genres.
-- My conclusion is that a game is more likely to achieve high sales figures if it falls within one of the three specified genres.

-- Which region accounted for the highest share of global sales?
SELECT ROUND(SUM(NA_sales),1) AS Total_NA_Sales,
ROUND(SUM(EU_sales),1) AS Total_EU_Sales,
ROUND(SUM(Other_sales),1) AS Total_Other_Sales,
ROUND(SUM(JP_sales),1) AS Total_JP_Sales
FROM Dataset
-- The North American region leads in total sales with 1293.1
-- The sales figures from North America alone has more sales recorded than the combined sales of japan and the other regions TIMES THREE!

-- Given the significance of North American sales, what are the top 10 games with the highest sales in the region?
SELECT Top 10 Game_Title, ROUND(NA_Sales,2) AS Total_NA_Sales
FROM Dataset
ORDER BY NA_Sales DESC;
-- The list comprises versions from only three franchises.
-- But the Call of Duty franchise dominates the list by securing 6 spots out of the 10.
-- Grand Theft Auto holds two positions, while Halo claims the other two spots within the top 10 rankings

-- Which publishers have the highest number of appearances in the dataset?
SELECT Top 10 Publisher, COUNT(*) AS Appearances 
FROM Dataset
WHERE Publisher <> 'Unknown'
GROUP BY Publisher
ORDER BY Appearances DESC;
-- Ubisoft and Electronic Arts share the top positions, tied for both 1st and 2nd place, with each appearing 692 times
-- Activision closely follows, with 610 appearances.
