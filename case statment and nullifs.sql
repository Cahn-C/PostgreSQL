/**
* Database: Store
* Table: products
* Create a case statement that's named "price class" where if a product is over 20 dollars you show 'expensive'
* if it's between 10 and 20 you show 'average' 
* and of is lower than or equal to 10 you show 'cheap'.
*/
SELECT title,
       price,
       CASE WHEN price > 20 THEN 'expensive'
 	    WHEN price BETWEEN 10 AND 20 THEN 'average'
            ELSE 'cheap'
       END AS price_class
FROM products;


/*
* DB: Store
* Table: products
* Question: Show NULL WHEN the product is not on special (0)
*/
SELECT prod_id,
       title,
       price,
       special,
       nullif(special, 0) AS not_on_special
FROM products;
