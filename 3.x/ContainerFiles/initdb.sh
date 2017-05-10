#!/bin/bash

psql --username postgres <<-EOSQL
    CREATE USER "$DB_USER_NAME" WITH SUPERUSER PASSWORD '$DB_USER_PASS' ;
    CREATE DATABASE ebms WITH OWNER=$DB_USER_NAME ;
    CREATE DATABASE as2 WITH OWNER=$DB_USER_NAME ;
EOSQL

psql --username postgres -f /work/sql/ebms.sql ebms
psql --username postgres -f /work/sql/as2.sql as2