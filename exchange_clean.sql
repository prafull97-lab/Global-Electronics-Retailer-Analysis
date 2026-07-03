select * from exchange_rates;

-- To check nulls --
select count(*) from exchange_rates where `Date` is null or `Date` = '';
select count(*) from exchange_rates where currency is null or Currency = '';
select count(*) from exchange_rates where `exchange` is null or `exchange` = '';

-- To check duplicates --
select `date`, currency, count(*) from exchange_rates
group by `date`, Currency
having count(*) >1;

-- Data consistency --
select distinct currency from exchange_rates;
select min(`exchange`), max(`exchange`) from exchange_rates;

-- To change text date column to date date -- 
UPDATE exchange_rates
SET `Date` = STR_TO_DATE(`Date`, '%d-%m-%Y');

ALTER TABLE exchange_rates
MODIFY COLUMN `Date` DATE;


