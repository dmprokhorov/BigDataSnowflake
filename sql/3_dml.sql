INSERT INTO customers
SELECT sale_customer_id,
       customer_first_name,
       customer_last_name,
       customer_age,
       customer_email,
       customer_country,
       customer_postal_code
FROM (SELECT *,
             ROW_NUMBER() OVER (PARTITION BY sale_customer_id) AS row_number
      FROM mock_data) AS inner_table
WHERE row_number = 1;

INSERT INTO products
SELECT sale_product_id,
       product_name,
       product_category,
       product_price,
       product_quantity,
       product_weight,
       product_color,
       product_size,
       product_brand,
       product_material,
       product_description,
       product_rating,
       product_reviews,
       product_release_date,
       product_expiry_date
FROM (SELECT *,
             ROW_NUMBER() OVER (PARTITION BY sale_product_id) AS row_number
      FROM mock_data) AS inner_table
WHERE row_number = 1;

INSERT INTO sellers
SELECT sale_seller_id,
       seller_first_name,
       seller_last_name,
       seller_email,
       seller_country,
       seller_postal_code
FROM (SELECT *,
             ROW_NUMBER() OVER (PARTITION BY sale_seller_id) AS row_number
      FROM mock_data) AS inner_table
WHERE row_number = 1;

INSERT INTO stores
SELECT store_name,
       store_location,
       store_city,
       store_state,
       store_country,
       store_phone,
       store_email
FROM (SELECT *,
             ROW_NUMBER() OVER (PARTITION BY store_name) AS row_number
      FROM mock_data) AS inner_table
WHERE row_number = 1;

INSERT INTO suppliers
SELECT supplier_name,
       supplier_contact,
       supplier_email,
       supplier_phone,
       supplier_address,
       supplier_city,
       supplier_country
FROM (SELECT *,
             ROW_NUMBER() OVER (PARTITION BY supplier_name) AS row_number
      FROM mock_data) AS inner_table
WHERE row_number = 1;

INSERT INTO sales (date, customer_id, seller_id, product_id, store_name, supplier_name, quantity, total_price)
SELECT mock_data.sale_date,
       customers.id,
       products.id,
       sellers.id,
       stores.name,
       suppliers.name,
       mock_data.sale_quantity,
       mock_data.sale_total_price
FROM mock_data INNER JOIN customers ON mock_data.sale_customer_id = customers.id
INNER JOIN products ON mock_data.sale_product_id = products.id
INNER JOIN sellers ON mock_data.sale_seller_id = sellers.id
INNER JOIN stores ON mock_data.store_name = stores.name
INNER JOIN suppliers ON mock_data.supplier_name = suppliers.name;