USE p2DB

PRINT(CHAR(10) + '--1')
PRINT('SELECT customer_last_name, customer_phone' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'ORDER BY customer_last_name' + CHAR(10))
SELECT customer_last_name, customer_phone
FROM dbo.customers
ORDER BY customer_last_name

PRINT(CHAR(10) + '--2')
PRINT('SELECT customer_first_name, customer_last_name, customer_phone, customer_fax' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'ORDER BY customer_fax ASC' + CHAR(10))
SELECT customer_first_name, customer_last_name, customer_phone, customer_fax
FROM dbo.customers
ORDER BY customer_fax ASC

PRINT(CHAR(10) + '--3')
PRINT('SELECT *' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'WHERE customer_city = ''Los Angeles'' OR customer_city = ''San Francisco''' + CHAR(10))
SELECT * 
FROM dbo.customers
WHERE customer_city = 'Los Angeles' OR customer_city = 'San Francisco'

PRINT(CHAR(10) + '--4')
PRINT('SELECT *' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'WHERE (customer_state = ''CA'' AND customer_city = ''San Francisco'') OR customer_city = ''Fairfield''' + CHAR(10))
SELECT * 
FROM dbo.customers
WHERE (customer_state = 'CA' AND customer_city = 'San Francisco') OR customer_city = 'Fairfield'

PRINT(CHAR(10) + '--5')
PRINT('SELECT CONCAT(customer_first_name, '' '', customer_last_name) AS ''Customer'', customer_phone AS ''Phone''' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'WHERE customer_state IN (''NY'', ''DC'', ''NJ'')' + CHAR(10) + 'ORDER BY Phone' + CHAR(10))
SELECT CONCAT(customer_first_name, ' ', customer_last_name) AS 'Customer', customer_phone AS 'Phone'
FROM dbo.customers
WHERE customer_state IN ('NY', 'DC', 'NJ') 
ORDER BY Phone

PRINT(CHAR(10) + '--6')
PRINT('SELECT DISTINCT customer_city' + CHAR(10) + 'FROM dbo.cutomers' + CHAR(10) + 'ORDER BY customer_city DESC')
SELECT DISTINCT customer_city
FROM dbo.customers
ORDER BY customer_city DESC

PRINT(CHAR(10) + '--7')
PRINT('SELECT CONCAT(title, '' $'', unit_price) AS Original, CONCAT(title, '' $'', (CAST(ROUND(unit_price*0.85,2,1) AS DECIMAL(18,2)))) AS Sale' + CHAR(10) + 'From dbo.items' + CHAR(10) + 'ORDER BY price DESC' + CHAR(10))

SELECT CONCAT(title, ' $', unit_price) AS Original, CONCAT(title, ' $', (CAST(ROUND(unit_price*0.85,2,1) AS DECIMAL(18,2)))) AS Sale 
FROM dbo.items
ORDER BY unit_price DESC

PRINT(CHAR(10) + '--8')
PRINT('SELECT COUNT(*) AS numOrders' + CHAR(10) + 'FROM dbo.orders' + CHAR(10))
SELECT COUNT(*) AS numOrders
FROM dbo.orders

PRINT(CHAR(10) + '--9')
PRINT('SELECT customer_city, customer_first_name, customer_last_name, customer_zip' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'WHERE customer_zip LIKE ''9%''' + CHAR(10))
SELECT customer_city, customer_first_name, customer_last_name, customer_zip
FROM dbo.customers
WHERE customer_zip LIKE '9%';

PRINT(CHAR(10) + '--10')
PRINT('SELECT order_id, FORMAT(order_date, ''MMM dd, yyyy'', ''en-US'') AS ''Ordered''' + CHAR(10) + 'FROM dbo.orers' + CHAR(10) + 'WHERE order_date >= ''2014-3-01'' AND order_date <= ''2014-4-30''' + CHAR(10))
-- using convert instead of format because on docker format messes up formatting, both do the same thing but format is simpler to understand so im displaying that as the command
SELECT order_id, CONVERT(varchar, order_date, 107) AS Ordered
FROM dbo.orders
WHERE order_date >= '2014-3-01' AND order_date <= '2014-4-30'

PRINT(CHAR(10) + '--11')
PRINT('SELECT order_id, FORMAT(order_date, ''d'', ''en-US'') AS ''Ordered''' + CHAR(10) + 'FROM dbo.orers' + CHAR(10) + 'WHERE order_date BETWEEN ''2014-3-01'' AND ''2014-4-30''' + CHAR(10))
-- using convert instead of format because on docker format messes up formatting, both do the same thing but format is simpler to understand so im displaying that as the command
SELECT order_id, CONVERT(varchar, order_date, 101) AS Ordered
FROM dbo.orders
WHERE order_date BETWEEN '2014-3-01' AND '2014-4-30'


PRINT(CHAR(10) + '--12')
PRINT('SELECT order_id, dbo.orders.customer_id, DATEDIFF(day, order_date, shipped_date) AS Days' + CHAR(10) + 'FROM dbo.orders' + CHAR(10) + 'WHERE DATEDIFF(day, order_date, shipped_date) >=15' + CHAR(10) + 'ORDER BY Days DESC' + CHAR(10))
SELECT order_id, dbo.orders.customer_id, DATEDIFF(day, order_date, shipped_date) AS Days 
FROM dbo.orders
WHERE DATEDIFF(day, order_date, shipped_date) >=15
ORDER BY Days DESC

PRINT(CHAR(10) + '--13')
PRINT('SELECT order_id, dbo.orders.customer_id, dbo.orders.employee_id, order_date' + CHAR(10) + 'FROM dbo.orders' + CHAR(10) + 'WHERE shipped_date IS NULL' + CHAR(10) + 'ORDER BY order_date DESC' + CHAR(10))
SELECT order_id, dbo.orders.customer_id, dbo.orders.employee_id, order_date
FROM dbo.orders
WHERE shipped_date IS NULL
ORDER BY order_date DESC

PRINT(CHAR(10) + '--14')
PRINT('SELECT order_id, order_date, shipped_date, DATENAME(WEEKDAY, order_date) AS Order_day' + CHAR(10) + 'FROM dbo.orders' + CHAR(10) + 'WHERE DATENAME(WEEKDAY, order_date) = ''Saturday'' OR DATENAME(WEEKDAY, order_date) = ''Sunday''' + CHAR(10) + 'ORDER BY order_date DESC' + CHAR(10))
SELECT order_id, order_date, shipped_date, DATENAME(WEEKDAY, order_date) AS Order_day
FROM dbo.orders
WHERE DATENAME(WEEKDAY, order_date) = 'Saturday' OR DATENAME(WEEKDAY, order_date) = 'Sunday'
ORDER BY order_date DESC

PRINT(CHAR(10) + '--15')
PRINT('SELECT customer_last_name, customer_phone, customer_fax' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'WHERE customers_fax IS NOT NULL' + CHAR(10))
SELECT customer_last_name, customer_phone, customer_fax
FROM dbo.customers
WHERE customer_fax IS NOT NULL

PRINT(CHAR(10) + '--16')
PRINT('INSERT INTO dbo.items(item_id,title,artist_id,unit_price)' + CHAR(10) + 'SELECT 11, ''The Ode To Your ERD'', 15, 13.45' + CHAR(10) + 'WHERE NOT EXISTS' + CHAR(10) + '(SELECT item_id' + CHAR(10) + '  FROM dbo.items' + CHAR(10) + '  WHERE item_id = 11)' + CHAR(10) + 'SELECT * FROM dbo.items WHERE item_id > 8' + CHAR(10)) 
INSERT INTO dbo.items(item_id,title,artist_id,unit_price)
SELECT 11, 'The Ode To Your ERD', 15, 13.45
WHERE NOT EXISTS 
(SELECT item_id 
	FROM dbo.items  
	WHERE item_id = 11)
SELECT * FROM dbo.items WHERE item_id > 8

PRINT(CHAR(10) + '--17')
PRINT('UPDATE dbo.items' + CHAR(10) + 'SET unit_price = 13.25' + CHAR(10) + 'SELECT * FROM dbo.items WHERE item_id > 7' + CHAR(10))
UPDATE dbo.items
SET unit_price = 13.25
WHERE item_id = 11
SELECT * FROM dbo.items WHERE item_id > 7

PRINT(CHAR(10) + '--18')
PRINT('DELETE FROM dbo.items WHERE item_id = 11' + CHAR(10) + 'SELECT * FROM dbo.items WHERE item_id > 7' + CHAR(10))
DELETE FROM dbo.items WHERE item_id = 11
SELECT * FROM dbo.items WHERE item_id > 7

PRINT(CHAR(10) + '--19')
PRINT('SELECT CONCAT(customer_last_name, '', '', customer_first_name) AS Customer,' + CHAR(10) + '       CONCAT(''('', SUBSTRING(customer_phone, 1, 3), '') '', SUBSTRING(customer_phone, 4, 3), ''-'', SUBSTRING(customer_phone, 7, 4)) AS Phone' + CHAR(10) + 'FROM dbo.customers' + CHAR(10) + 'ORDER BY customer_last_name' + CHAR(10))
SELECT CONCAT(customer_last_name, ', ', customer_first_name) AS Customer, 
       CONCAT('(', SUBSTRING(customer_phone, 1, 3), ') ', SUBSTRING(customer_phone, 4, 3), '-', SUBSTRING(customer_phone, 7, 4)) AS Phone
FROM dbo.customers
ORDER BY customer_last_name

PRINT(CHAR(10) + '--20')
PRINT('INSERT INTO dbo.customers(customer_id, customer_first_name, customer_last_name, customer_address, customer_city, customer_state, customer_zip, customer_phone, customer_fax)' + CHAR(10) + 'SELECT 27,''Manan'',''Patel'', ''9821 Main St'', ''Los Angeles'', ''CA'', 90001, 9995559999,NULL' + CHAR(10) + ' WHERE NOT EXISTS' + CHAR(10) + '(SELECT customer_id FROM dbo.customers WHERE customer_id = 27)' + CHAR(10) + 'SELECT * FROM dbo.customers WHERE customer_id = 27' + CHAR(10))

INSERT INTO dbo.customers(customer_id, customer_first_name, customer_last_name, customer_address, customer_city, customer_state, customer_zip, customer_phone, customer_fax)
SELECT 27,'Manan','Patel', '9821 Main St', 'Los Angeles', 'CA', 90001, 9995559999,NULL
WHERE NOT EXISTS
(SELECT customer_id FROM dbo.customers WHERE customer_id = 27)
SELECT * FROM dbo.customers WHERE customer_id = 27

PRINT(CHAR(10) + '--21')
PRINT('SELECT title FROM dbo.items' + CHAR(10) + 'WHERE unit_price > (SELECT AVG(unit_price) FROM dbo.items)' + CHAR(10))
SELECT title FROM dbo.items
WHERE unit_price > (SELECT AVG(unit_price) FROM dbo.items)


