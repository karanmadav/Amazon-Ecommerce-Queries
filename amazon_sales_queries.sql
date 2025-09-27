
CREATE TABLE amazon_sales (
    order_id VARCHAR(20),
    order_date DATETIME,
    product VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    total_sales DECIMAL(12,2),
    customer_name VARCHAR(100),
    customer_location VARCHAR(100),
    payment_method VARCHAR(50),
    status VARCHAR(50)
);

select * from`amazon_sales_data 2025`;

DESCRIBE 'amazon_sales_data 2025';

SELECT 
    SUM(CAST('Total Sales' AS DECIMAL(10,2))) AS revenue,
    SUM(CAST('Quantity' AS UNSIGNED)) AS total_qty
FROM 'amazon_sales_data 2025';

SELECT 
    'Category',
    SUM(CAST('Total Sales' AS DECIMAL(10,2))) AS revenue
FROM 'amazon_sales_data 2025'
GROUP BY 'Category'
ORDER BY revenue DESC;

SELECT 
    'Category',
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS revenue
FROM 'amazon_sales_data 2025'
GROUP BY 'Category'
ORDER BY revenue DESC;
SELECT 
    'Product',
    SUM('Quantity') AS total_quantity_sold,
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS revenue
FROM 'amazon_sales_data 2025'
GROUP BY 'Product'
ORDER BY total_quantity_sold DESC
LIMIT 10;
SELECT 
    DATE_FORMAT('Date', '%Y-%m') AS month,
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS monthly_revenue
FROM 'amazon_sales_data 2025'
GROUP BY month
ORDER BY month;
SELECT 
    'Customer Location',
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS revenue
FROM 'amazon_sales_data 2025'
GROUP BY 'Customer Location'
ORDER BY revenue DESC
LIMIT 10;

SELECT 
    'Payment Method',
    COUNT(*) AS total_transactions,
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS total_revenue
FROM 'amazon_sales_data 2025'
GROUP BY 'Payment Method'
ORDER BY total_revenue DESC;

SELECT 
    'Status',
    COUNT(*) AS total_orders,
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS revenue
FROM 'amazon_sales_data 2025'
GROUP BY 'Status';

SELECT 
    'Customer Name',
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS total_spent,
    COUNT('Order ID') AS total_orders
FROM 'amazon_sales_data 2025'
GROUP BY 'Customer Name'
ORDER BY total_spent DESC
LIMIT 10;

SELECT 
    AVG(CAST('Total Sales' AS DECIMAL(12,2))) AS avg_order_value
FROM 'amazon_sales_data 2025';

SELECT 
    'Customer Name',
    COUNT(DISTINCT 'Order ID') AS order_count,
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS total_spent
FROM 'amazon_sales_data 2025'
GROUP BY 'Customer Name'
HAVING order_count > 1
ORDER BY order_count DESC;

SELECT 
    'Customer Location',
    'Category',
    SUM(CAST('Total Sales' AS DECIMAL(12,2))) AS revenue
FROM 'amazon_sales_data 2025'
GROUP BY 'Customer Location', 'Category'
ORDER BY revenue DESC
LIMIT 20;
