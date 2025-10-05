SELECT * FROM jobs.layoff1;
SELECT count(*) FROM jobs.layoff;

-- Remove Duplicate Values ....
 
with duplicate_cte as (
select * ,
row_number() over(partition by company, location, industry, total_laid_off, 
percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoff)
select * from duplicate_cte
where row_num > 1;

delete from layoff1
where row_num > 1;

select * from layoff1
where row_num > 1;

-- Remove  nulls And Blank Values,,,


select * from
layoff1 
where total_laid_off is null 
and percentage_laid_off is null ; 

select  * 
from  layoff1
where industry  is null or industry = '';


select t1.industry,t2.industry from  layoff1 t1
join layoff1 t2 
on  t1.company =t2.company
where (t1.industry is  null or t1.industry = '' )
and t2.industry is not null;

update  layoff1 t1
join layoff1 t2 
on  t1.company =t2.company
set t1.industry= t2.industry
where (t1.industry is  null or t1.industry = '' )
and t2.industry is not null;

UPDATE layoff1
SET 
    country = null
WHERE  country = '';

select t1.country,t2.country from  layoff1 t1 
join layoff1 t2 on
t1.company=t2.company
where (t1.country is null or  t1.country= '')and 
t2.country is not null;

update layoff1 t1 
join layoff1 t2 
on t1.company=t2.company
set  t1.country= t2.country
where (t1.country is null or  t1.country= '')and 
t2.country is not null;


select * from layoff1;
select * from
layoff1 
where total_laid_off is null 
and percentage_laid_off is null ; 

delete from layoff1 
where total_laid_off is null 
and percentage_laid_off is null ; 

update layoff1 
set location = 'unknown'
where  location  is null;

update layoff1 
set industry= 'unknown'
where  industry  is null;


UPDATE layoff1
SET 
    total_laid_off = 0,
    percentage_laid_off = 0,
    funds_raised_millions = 0
WHERE  
    total_laid_off IS NULL 
    OR percentage_laid_off IS NULL 
    OR funds_raised_millions IS NULL;

update layoff1 
set `date` = '2023-07-26'
where  `date` is null;

select t1.stage ,t2.stage from layoff1 t1
join layoff1 t2 
on t1.company=t2.company
where (t1.stage is null  or t1.stage = '')
and t2.stage is not null;


update layoff1 t1 
join layoff1  t2 on 
t1.company= t2.company
set t1.stage=t2.stage
where (t1.stage is null  or t1.stage = '')
and t2.stage is not null;
 