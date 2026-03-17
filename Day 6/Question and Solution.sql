use company;


--  1. Select the names of all the products in the store.
Select Name
from products;

-- 2. Select the names and the prices of all the products in the store.
select Name, Price
from products; 

-- 3. Select the name of the products with a price less than or equal to $200..

select Name 
from products
where Price <= 200;

-- 4. Select all the products with a price between $60 and $120.
select  * 
from products
where Price between 60 AND 120;

-- 5. Select the name and price in cents (i.e., the price must be multiplied by 100).
select Name , Price*100 as price_cents
from products;

-- 6. Compute the average price of all the products.
select Avg(Price)
from products;

-- 7. Compute the average price of all products with manufacturer code equal to 2.
select Avg(Price)
from products
where manufacturer = 2;

-- 8.  Compute the number of products with a price larger than or equal to $180.
select count(*)
from products
where price >= 180;

-- 9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
select Name , Price
from products
where Price>=180
order by Price desc, Name;

-- 10. Select all the data from the products, including all the data for each product's manufacturer.
select * 
from products as p
LEFT join manufacturers as M 
on p.Manufacturer = M.Code;

-- 11. Select the product name, price, and manufacturer name of all the products.
select p.Name, p.Price, M.Name 
from products as p
LEFT join manufacturers as M 
on p.Manufacturer = M.Code;

-- 12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
Select manufacturer, Avg(Price)
from products 
group by manufacturer;

-- count products per manufacturer name.
select m.Name, COUNT(*)
from products p
left join manufacturers m
on p.manufacturer = m.Code
group by m.Name;

-- 13. Select the average price of each manufacturer's products, showing the manufacturer's name.
select m.Name,Avg(Price) 
from products p
left join manufacturers m
on p.manufacturer = m.Code
group by manufacturer;

-- 14. Select the names of manufacturer whose products have an average price larger than or equal to $150.
select m.Name, avg(Price)
from products p
Inner join manufacturers m
on p.manufacturer = m.Code
group by manufacturer 
having avg(Price) >= 150;

-- 15. Select the name and price of the cheapest product.
Select Name, price
from Products
where Price = (select min(price) from products);

-- 16. Select the name of each manufacturer along with the name and price of its most expensive product.
Select m.Name, p.Name, p.Price
from products p inner join manufacturers m
on p.manufacturer= m.Code
where p.Price = (select max(p.Price) from products p where p.manufacturer = m.Code );

-- 17. Select the name of each manufacturer which have an average price above $145 and contain at least 2 different products.
select m.name, avg(p.price) as Avg_Price
from products as p inner join manufacturers m
on p.manufacturer = m.Code
group by p.manufacturer
having Avg_Price > 145 and count(p.manufacturer) >= 2; 

-- 18. Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products(code,Name,Price,Manufacturer) Values(11,'Loudspeakers',70,2);

-- 19. Update the name of product 8 to "Laser Printer".
UPDATE Products
set Name = "Laser Printer"
where Code = 8;

-- 20. Apply a 10% discount to all products.
Update products
set Price = Price-(Price * 0.1);

-- 21. Apply a 10% discount to all products with a price larger than or equal to $120.
Update Products 
set Price = Price -(Price*0.1)
where Price >= 120;


SET SQL_SAFE_UPDATES = 0;
