/**
* Database: Store
* Table: products
* Create a case statement that's named "price class" where if a product is over 20 dollars you show 'expensive'
* if it's between 10 and 20 you show 'average' 
* and of is lower than or equal to 10 you show 'cheap'.
*/
select title,
       price,
       case when price > 20 then 'expensive'
 	    when price between 10 and 20 then 'average'
            else 'cheap'
       end as price_class
from products;


/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/
select prod_id,
       title,
       price,
       special,
       nullif(special, 0) as not_on_special
from products;
