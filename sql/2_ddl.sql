DROP TABLE IF EXISTS sales;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    age INT,
    email VARCHAR(200),
    country VARCHAR(100),
    postal_code VARCHAR(50)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT,
    weight DECIMAL(10, 2),
    color VARCHAR(50),
    size VARCHAR(50),
    brand VARCHAR(100),
    material VARCHAR(100),
    description TEXT,
    rating DECIMAL(3, 1),
    reviews INT,
    release_date DATE,
    expiry_date DATE
);

DROP TABLE IF EXISTS sellers;
CREATE TABLE sellers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(200),
    country VARCHAR(100),
    postal_code VARCHAR(50)
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
    name VARCHAR(200) PRIMARY KEY,
    location VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(200)
);

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers (
    name VARCHAR(200) PRIMARY KEY,
    contact VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    date DATE,
    customer_id INT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
    seller_id INT NOT NULL REFERENCES sellers(id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    store_name VARCHAR(200) NOT NULL REFERENCES stores(name) ON DELETE CASCADE,
    supplier_name VARCHAR(200) NOT NULL REFERENCES suppliers(name) ON DELETE CASCADE,
    quantity INT,
    total_price DECIMAL(10, 2)
);

