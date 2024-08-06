select *
from layoffs_demo2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_demo2;

select *
from layoffs_demo2
where percentage_laid_off = 1
order by total_laid_off desc;

select *
from layoffs_demo2
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from layoffs_demo2
group by company
order by 2 desc;

select min(date), max(date)
from layoffs_demo2;

select country, sum(total_laid_off)
from layoffs_demo2
group by country
order by 2 desc;

select year(date), sum(total_laid_off)
from layoffs_demo2
group by year(date)
order by 2 desc;

select stage, sum(total_laid_off)
from layoffs_demo2
group by stage
order by 2 desc;

select substring(date, 1,7) as Month, sum(total_laid_off)
from layoffs_demo2
group by Month
order by 1 asc
;

with Rolling_total as 
(select substring(date, 1,7) as Month, sum(total_laid_off) as total_fired
from layoffs_demo2
group by Month
order by 1 asc
)
select Month , total_fired,
sum(total_fired) over(order by Month) as rolling_total
from Rolling_total;

select company, YEAR(date), sum(total_laid_off)
from layoffs_demo2
group by company, YEAR(date)
order by 3 desc;

WITH Company_Year (Company,Years, Total_fired) as
 (
 select company, YEAR(date), sum(total_laid_off)
from layoffs_demo2
group by company, YEAR(date)
),Company_Year_Rank as 
(select *, dense_rank() over (partition by Years order by Total_fired desc) as Ranking 
from Company_Year
WHERE Years is not null
)
select * 
from Company_Year_Rank
where Ranking <= 5
;


