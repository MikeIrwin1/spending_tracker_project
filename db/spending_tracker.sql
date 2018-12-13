DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  catagory VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  merchant_id INT2 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT2 REFERENCES tags(id) ON DELETE CASCADE,
  spend INT2,
  transaction_time TIMESTAMP
);
