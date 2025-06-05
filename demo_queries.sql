-- Demo 1: Customer Acquisition Analysis
SELECT
    COUNT(customer_id) AS new_customers_may_2025
FROM
    Customers
WHERE
    registration_date BETWEEN '2025-05-01' AND '2025-05-31';

-- Demo 2: Understanding Sales Performance: Aggregation Basics
SELECT
    SUM(total_amount) AS total_revenue_q1_2025,
    AVG(total_amount) AS average_order_value_q1_2025
FROM
    Orders
WHERE
    order_date BETWEEN '2025-01-01' AND '2025-03-31';

-- Demo 3: High-Value Customer Segments
SELECT
    C.customer_segment,
    SUM(O.total_amount) AS segment_revenue
FROM
    Customers C
JOIN
    Orders O ON C.customer_id = O.customer_id
WHERE
    O.order_date BETWEEN '2024-12-01' AND '2025-05-31'
GROUP BY
    C.customer_segment
HAVING
    SUM(O.total_amount) > 1000;

-- Bonus Discussion Query (Explicit Join Example for Product Categories)
SELECT
    P.category,
    SUM(O.total_amount) AS total_revenue
FROM
    Orders O
JOIN
    Order_Items OI ON O.order_id = OI.order_id
JOIN
    Products P ON OI.product_id = P.product_id
WHERE
    O.order_date BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY
    P.category
ORDER BY
    total_revenue DESC
LIMIT 3;

-- Bonus Discussion Query (Implicit Join Example for Product Categories)
SELECT
    P.category,
    SUM(O.total_amount) AS total_revenue
FROM
    Orders O,
    Order_Items OI,
    Products P
WHERE
    O.order_id = OI.order_id
    AND OI.product_id = P.product_id
    AND O.order_date BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY
    P.category
ORDER BY
    total_revenue DESC
LIMIT 3;