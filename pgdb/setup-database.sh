#!/bin/bash

export PGUSER=postgres

TEST=`psql <<- EOSQL
    SELECT 1 FROM pg_database WHERE datname='$DB_NAME';
EOSQL`

echo "******CREATING DOCKER DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
psql <<- EOSQL
    CREATE ROLE $DB_USER WITH LOGIN ENCRYPTED PASSWORD '${DB_PASS}' CREATEDB;
    CREATE DATABASE $DB_NAME WITH OWNER $DB_USER TEMPLATE template0 ENCODING 'UTF8';
    GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL

    export PGUSER=$DB_USER

psql $DB_NAME <<- EOSQL
    CREATE TABLE users(
        id serial PRIMARY KEY NOT NULL,
        customerName varchar(50) NOT NULL,
        contactLastName varchar(50) NOT NULL,
        contactFirstName varchar(50) NOT NULL,
        country varchar(50) NOT NULL,
        salesRepEmployeeNumber int NOT NULL,
        creditLimit decimal DEFAULT NULL
    );
EOSQL
fi

echo ""
echo "******DOCKER DATABASE CREATED******"
