# Dataset_cleaning...


I specialize in cleaning and preparing raw data using MySQL to ensure accuracy, consistency, and reliability. My work involves handling duplicate records, missing values, inconsistent formats, and data normalization to make datasets ready for analysis. Using SQL queries, I perform tasks such as removing null values, correcting data types, standardizing text entries, and validating relationships between tables. I believe that clean data is the foundation of meaningful analysis, and MySQL provides the perfect platform for ensuring data integrity before any analytical or reporting work begins.


```sql
SELECT Region,Product,
		ROUND(SUM(`Total Amount`)) AS Total_Amount,
        ROUND(SUM(Profit)) AS Profit,
ROW_NUMBER() 
	OVER(
		PARTITION BY Region 
        ORDER BY SUM(`Total Amount`) DESC,SUM(Profit) DESC
        ) AS `Rank`
FROM adidas
GROUP BY 1,2;
```
<img width="856" height="236" alt="image" src="https://github.com/user-attachments/assets/d05dcfdf-46fb-4f5c-ad32-205b25f39ec8" />












