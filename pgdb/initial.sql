CREATE DATABASE database WITH OWNER postgres TEMPLATE template0 ENCODING 'UTF8';

\c database

CREATE TABLE users(
    id serial PRIMARY KEY NOT NULL,
    customerName varchar(50) NOT NULL,
    contactLastName varchar(50) NOT NULL,
    contactFirstName varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
    salesRepEmployeeNumber int NOT NULL,
    creditLimit decimal DEFAULT NULL
);
