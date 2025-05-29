-- customer table- customer 
create table customers(
customer_id SERIAL PRIMARY KEY, 
name VARCHAR(100), 
email VARCHAR(100) UNIQUE, 
registered_date DATE 
);

-- products table
create table products(
product_id SERIAL PRIMARY KEY, 
name VARCHAR(100), 
category VARCHAR(50), 
price DECIMAL(10,2) 
);

-- stores table
create table stores(
store_id SERIAL PRIMARY KEY, 
name VARCHAR(100), 
region VARCHAR(50) 
);

--transaction table
create table transactions(
transaction_id SERIAL PRIMARY KEY, 
customer_id INT REFERENCES customers(customer_id), 
product_id INT REFERENCES products(product_id), 
store_id INT REFERENCES stores(store_id), 
quantity INT NOT NULL, 
transaction_date DATE NOT NULL 
);