select * from products;
describe products;

-- To check total rows --
select count(*) from products;

-- To check nulls --
select count(*) from products where ProductKey is null;
select count(*) from products where ProductName is null;
select count(*) from products where Brand is null;
select count(*) from products where Color is null;
select count(*) from products where UnitCostUSD is null;
select count(*) from products where UnitPriceUSD is null;
select count(*) from products where SubcategoryKey is null;
select count(*) from products where CategoryKey is null;
select count(*) from products where Category is null;

-- To check duplicates --
select productkey, count(*) from products group by productkey having count(*) >1 ;

-- Data consistency --
select min(unitcostusd), max(unitcostusd), min(UnitPriceUSD), max(UnitPriceUSD) from products;
