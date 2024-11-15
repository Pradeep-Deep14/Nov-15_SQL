CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Anjali'),
(2, 'Rohan'),
(3, 'Suresh'),
(4, 'Priya'),
(5, 'Rahul');

INSERT INTO orders (order_id, customer_id, amount, order_date) VALUES
(1, 1, 2500, '2023-01-01'),
(2, 1, 3000, '2023-01-02'),
(3, 2, 4500, '2023-01-05'),
(4, 3, 4000, '2023-01-12'),
(5, 1, 1500, '2023-01-15'),
(6, 2, 3500, '2023-01-20');

SELECT * FROM CUSTOMERS

SELECT * FROM ORDERS

/*Write a SQL query to find customers who have ordered more than once and their total spending.*/

SELECT C.CUSTOMER_NAME,
       COUNT(*) AS NO_OF_ORDERS,
	   SUM(O.AMOUNT) AS TOTAL_SPENDING
FROM CUSTOMERS C
JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY 1
HAVING COUNT(*)>1
ORDER BY 3 DESC
       
