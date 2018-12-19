DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE budgets;

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  merchant_id INT2 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT2 REFERENCES tags(id) ON DELETE CASCADE,
  spend Numeric,
  transaction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE budgets (
  id SERIAL8 PRIMARY KEY,
  value Numeric
);
