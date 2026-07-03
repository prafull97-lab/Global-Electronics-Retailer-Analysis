select * from stores;

-- To check total rows --
select count(*) from stores;

-- To check nulls --
select count(*) from stores where StoreKey is null or StoreKey = '';
select count(*) from stores where Country is null or country = '';
select count(*) from stores where State is null or state = '';
select count(*) from stores where SquareMeters is null or SquareMeters = '';
select count(*) from stores where Opendate is null or Opendate = '';

-- To check duplicates --
select storekey, count(*) from stores group by StoreKey having count(*) >1;

-- To check distinct values -- 
select distinct country from stores;
select distinct state from stores;

-- data consistency --
select min(squaremeters), max(squaremeters) from stores;

-- To change text deliverydate column to date deliverydate -- 
UPDATE stores
SET Opendate = STR_TO_DATE(Opendate, '%d-%m-%Y');

ALTER TABLE stores
MODIFY COLUMN Opendate DATE;



