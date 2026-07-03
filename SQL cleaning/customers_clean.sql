select * from customers;

-- To check nulls -- 
select count(*) from customers where customerkey is null or CustomerKey ='';
select count(*) from customers where gender is null or gender ='';
select count(*) from customers where `Name` is null or `Name` ='';
select count(*) from customers where city  is null or city ='';
select count(*) from customers where Statecode is null or Statecode ='';
select count(*) from customers where State is null or State ='';
select count(*) from customers where Country is null or Country ='';
select count(*) from customers where continent is null or continent ='';
select count(*) from customers where birthday is null or birthday ='';

-- To check duplicates --
select customerkey, count(*) from customers group by customerkey having count(*) > 1;

-- To check distinct values --
select distinct gender from customers;
select distinct country from customers;
select distinct continent from customers;
select distinct birthday from customers;

-- To check if there are whitespaces -- 
select distinct gender, length(gender) from customers;
select distinct country, length(country) from customers;
select distinct continent, length(continent) from customers;

-- To change text birthday column to date birthday -- 
UPDATE customers
SET Birthday = STR_TO_DATE(Birthday, '%d-%m-%Y');

ALTER TABLE customers
MODIFY COLUMN Birthday DATE;

