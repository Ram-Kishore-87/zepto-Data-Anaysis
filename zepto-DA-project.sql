drop table if exists zepto;

CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

--data exploration

--count of rows
select count(*) from zepto;

--sample data
select * from zepto
limit 10;

--null values
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
discountedSellingPrice is null
or
weightInGms is null
or
availableQuantity is null
or 
outOfStock is null
or 
quantity is null;

--difference product category
select distinct category
from zepto
order by category;

--products in stock vs out of stock
select outOfStock , count(sku_id)
from zepto
group by outOfStock;

--product name present multiple times
select name,count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

--data cleaning

--products with price = 0
select * from zepto
where mrp = 0 or discountedSellingPrice=0;

delete from zepto where mrp = 0;

--convert paise to rupees
update zepto 
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0 ;

select mrp , discountedSellingPrice from zepto;

--data analysis
--Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name,mrp,discountPercent
from zepto
order by discountPercent Desc
limit 10;

--Q2. What are the Products with High MRP but Out of Stock

select distinct name,mrp
from zepto
where outOfStock = True and mrp > 300
order by mrp desc;

--Q3. Calculate Estimated Revenue for each category

select category,sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

--Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%

select distinct name, mrp , discountPercent
from zepto
where mrp>500 and discountPercent <10
order by mrp desc, discountPercent Desc;


--Q5. Identify the top 5 categories offering the highest average discount percentage.

select category,round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

--Q6. Find the price per gram for products above 100g and sort by best value.

select distinct name, weightInGms , discountedSellingPrice ,
round(discountedSellingPrice/weightInGms,2) as price_per_grms
from zepto
where weightInGms >=100
order by price_per_grms;

--Q7. Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;



--Q8. What is the Total Inventory Weight Per Category 

SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

