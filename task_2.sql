-- TASK 2: CREATE TABLES IN alx_book_store
USE alx_book_store;

-- DROP IN FK-SAFE ORDER IF THEY EXIST
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS customers;

-- AUTHORS TABLE
CREATE TABLE authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=INNODB;

-- BOOKS TABLE
CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL,
  publication_date DATE,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=INNODB;

-- CUSTOMERS TABLE
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
) ENGINE=INNODB;

-- ORDERS TABLE
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=INNODB;

-- ORDER_DETAILS TABLE
CREATE TABLE order_details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL,
  CONSTRAINT fk_od_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_od_book
    FOREIGN KEY (book_id) REFERENCES books(book_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=INNODB;

-- OPTIONAL INDEXES
CREATE INDEX idx_books_author_id ON books (author_id);
CREATE INDEX idx_orders_customer_id ON orders (customer_id);
CREATE INDEX idx_od_order_id ON order_details (order_id);
CREATE INDEX idx_od_book_id ON order_details (book_id);
