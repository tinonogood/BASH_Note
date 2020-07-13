#!/bin/bash

###
### var
###

DB_FILE=test.sql
OPTIONS=(add del list quit)

###
### func
###

create_table() {
  local db_file=$1
  sqlite3 $db_file << EOF
CREATE TABLE customers (
  Id     INTEGER PRIMARY KEY   AUTOINCREMENT,
  Name   VARCHAR(50),
  Phone  VARCHAR(20)
);
PRAGMA table_info(customers);
.quit
EOF
}

insert_customer() {
  local db_file=$1
  echo "no implement INSERT\r"
  sqlite3 $db_file << EOF
INSERT INTO customers (Name ,Phone)
VALUES( Tino,   0988123456);
.quit
EOF
}

delete_customer() {
  echo "no implement"
}

list_customer() {
  local db_file=$1
  sqlite3 $db_file << EOF
.tables customers
.quit
EOF
  echo "no implement"
}

###
### main
###

echo "no implement Main\r"
create_table
insert_customer
list_customer
