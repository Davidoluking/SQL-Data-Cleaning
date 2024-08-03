SELECT * FROM world_layoffs.layoffs;  


CREATE TABLE layoffs_demo
LIKE world_layoffs.layoffs;

select *
from layoffs_demo;

insert layoffs_demo
select *
from world_layoffs.layoffs;

select *
from layoffs_demo;


select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off, 'date',stage,country,funds_raised_millions) as row_num
from layoffs_demo;

with duplicate_cte as
(
select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off, 'date',stage,country,funds_raised_millions) as row_num
from layoffs_demo
)
select *
from duplicate_cte
where row_num > 1;

with duplicate_cte as
(
select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off, 'date',stage,country,funds_raised_millions) as row_num
from layoffs_demo
)
delete
from duplicate_cte
where row_num > 1;


CREATE TABLE `layoffs_demo2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_demo2;

insert into layoffs_demo2
select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off, 'date',stage,country,funds_raised_millions) as row_num
from layoffs_demo;

delete
from layoffs_demo2
where row_num > 1; 

select company, (trim(company))
from layoffs_demo2;

update layoffs_demo2
set company = (trim(company));

select distinct industry
from layoffs_demo2
order by 1;

select *
from layoffs_demo2
where country like 'United States';

select distinct country, trim(trailing '.'from country)
from layoffs_demo2
order by 1;

update layoffs_demo2
set country = trim(trailing '.'from country)
where country like 'United States%' ;

select date ,
str_to_date(date, '%m/%d/%Y') 
from layoffs_demo2;

update layoffs_demo2
set date = str_to_date(date, '%m/%d/%Y');

alter table  layoffs_demo2
modify column date DATE;

select *
FROM layoffs_demo2
WHERE total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_demo2
where industry is null
or industry ='' ;

select *
from layoffs_demo2
where total_laid_off is null
and percentage_laid_off is null 
; 

delete
from layoffs_demo2
where total_laid_off is null
and percentage_laid_off is null 
; 

select *
from layoffs_demo2;

alter table layoffs_demo2
drop column row_num;

select *
from layoffs_demo2;