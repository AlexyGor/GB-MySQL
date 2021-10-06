SELECT * FROM information_schema.SCHEMATA;
SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'shop';
SELECT 'Hello world!';

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  UNIQUE unique_name(name(10))
);