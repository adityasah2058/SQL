-- 1. Retreive the total number of orders placed
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;
    
    

-- 2. Print the first 3 characters of pizza_name.
SELECT 
    SUBSTRING(name, 1, 3)
FROM
    pizza_types;
    
    


-- 3. Print name of pizza starting with letter T.
SELECT 
    name
FROM
    pizza_types
WHERE
    name LIKE 'T%';
    
    


-- 4. Print name of pizza starting with letter T and contain 6 alphabets
SELECT 
    name
FROM
    pizza_types
WHERE
    name LIKE 't------';




-- 5. Write a SQL query to find the position of alphabet ('a') name coloumn where name=The Chicken Pesto Pizza
SELECT 
    INSTR(name, 'a') AS position
FROM
    pizza_types
WHERE
    name = 'The Chicken Pesto Pizza';
    
    


-- 6. Calculate total revenue generated from pizza sales
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id; 
    
    


-- 7. Identify the highest price pizza
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;




-- 8. Identify most common pizza size ordered.
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;




-- 9. List the top 5 most ordered pizza types along with their quantities
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;




-- 10. Find total quantity of each pizza category ordred.
SELECT 
    pizza_types.category, SUM(order_details.quantity) AS quanity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;




-- 11.Determine the distribution of order by hour per day
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);



-- 12. Find category wise distrinution of pizza.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;




-- 13. Group the orders by date and calculate average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity), 0) AS avg_pizza_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;
    
    


-- 14. Determine top 3 most orderd pizza based on revenue
SELECT 
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_types_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;










