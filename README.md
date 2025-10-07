# Dataset_cleaning...


I specialize in cleaning and preparing raw data using MySQL to ensure accuracy, consistency, and reliability. My work involves handling duplicate records, missing values, inconsistent formats, and data normalization to make datasets ready for analysis. Using SQL queries, I perform tasks such as removing null values, correcting data types, standardizing text entries, and validating relationships between tables. I believe that clean data is the foundation of meaningful analysis, and MySQL provides the perfect platform for ensuring data integrity before any analytical or reporting work begins.


// Remove Duplicate ... //

select * from  layoff1;

<img width="815" height="240" alt="image" src="https://github.com/user-attachments/assets/d930d404-afc6-4aab-855d-2637210d8ca9" />

with duplicate_cte as (
select * ,
row_number() over(partition by company, location, industry, total_laid_off, 
percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoff)
select * from duplicate_cte
where row_num > 1;

<img width="803" height="231" alt="image" src="https://github.com/user-attachments/assets/87618355-81d3-4550-a8ac-fa750ed77851" />



