-- Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street,
"addresses".city, "addresses".state, "addresses".zip 
FROM "customers" JOIN "addresses" 
ON "addresses".customer_id = "customers".id;

-- Get all orders and their line items (orders, quantity and product).
SELECT "orders".order_date, "line_items".quantity, 
"products".description FROM "orders" 
JOIN "line_items" ON "line_items".order_id = "orders".id 
JOIN "products" ON "line_items".product_id = "products".id;

-- Which warehouses have cheetos?
SELECT "products".description, "warehouse".warehouse FROM "products" 
JOIN "warehouse_product" ON "warehouse_product".product_id = "products".id 
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT "products".description, "warehouse".warehouse FROM "products" 
JOIN "warehouse_product" ON "warehouse_product".product_id = "products".id 
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT("orders".address_id), "customers".first_name, "customers".last_name 
FROM "orders" JOIN "addresses" ON "orders".address_id = "addresses".id
JOIN "customers" ON "customers".id = "addresses".customer_id
GROUP BY "customers".id;

-- How many customers do we have?
SELECT COUNT("customers".id) FROM "customers";

-- How many products do we carry?
SELECT COUNT("products".id) FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) FROM "warehouse_product" 
JOIN "products" ON "warehouse_product".product_id = "products".id 
WHERE "products".description = 'diet pepsi';
