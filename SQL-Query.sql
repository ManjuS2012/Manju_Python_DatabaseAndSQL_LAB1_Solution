-- Q3
select customer.CUS_GENDER,count(customer.CUS_GENDER) as count from customer 
        inner join `orders` on customer.CUS_ID = `orders`.CUS_ID
        where `orders`.ORD_AMOUNT>=3000 group by customer.CUS_GENDER ;
        
-- Q4
select `orders`.*,product.PRO_NAME
from `orders` , product_details,product 
where `orders`.CUS_ID=2 and `orders`.PROD_ID=product_details.PRO_ID and product_details.PRO_ID=product.PRO_ID;

-- Q5
select supplier.* 
from supplier,product_details
where supplier.SUPP_ID in (select product_details.SUPP_ID from product_details
group by product_details.SUPP_ID having count(product_details.SUPP_ID)>1)
group by supplier.SUPP_ID;

-- Q6
select category.* from `orders` inner join product_details on `orders`.PROD_ID=product_details.PRO_ID
inner join product on product.PRO_ID=product_details.PRO_ID
inner join category on category.CAT_ID=product.CAT_ID having min(`orders`.ORD_AMOUNT);

-- Q7
select product.PRO_ID,product.PRO_NAME from `orders` inner join product_details on product_details.PROD_ID=`orders`.PROD_ID
inner join product on product.PRO_ID=product_details.PRO_ID where `orders`.ORD_DATE>'2021-10-05'; 

-- Q8
select supplier.SUPP_ID,supplier.SUPP_NAME,customer.CUS_NAME,rating.RAT_RATSTARS 
from rating inner join supplier on rating.SUPP_ID=supplier.SUPP_ID 
inner join customer on customer.CUS_ID=rating.CUS_ID order by rating.RAT_RATSTARS desc limit 3;

-- Q9
select customer.CUS_NAME,customer.CUS_GENDER from customer
where customer.CUS_NAME like 'A%' or customer.CUS_NAME like '%A';

-- Q10
select sum(`orders`.ORD_AMOUNT) as AMOUNT 
from `orders` inner join customer on customer.CUS_ID=`orders`.CUS_ID
where customer.CUS_GENDER='M';

-- Q11
SELECT customer.*,`orders`.* from customer LEFT OUTER JOIN `orders` ON customer.CUS_ID=`orders`.CUS_ID;


