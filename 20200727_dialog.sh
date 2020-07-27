#!/bin/bash
TITLE="Select file menu"
DB_FILE=test.sql
TMP="TMP"

O_NUMS=4
TAG1="1"
TAG2="2"
TAG3="3"
TAG4="4"
OPTIONS1="show table form"
OPTIONS2="add"
OPTIONS3="del"
OPTIONS4="list data"


function show_table_form () {
sqlite3 $DB_FILE << EOF>"SQLOUT"
.schema customers
.quit
EOF
MSG=$(cat SQLOUT)
dialog --title "$OPTIONS1" --msgbox "$MSG" 10 60
rm -f SQLOUT
}

function add () {
echo "Please enter Name:"
read -p "Name = " name
echo "Please enter Phone:"
read -p "Phone = " phone

sqlite3 $DB_FILE << EOF
INSERT INTO customers (Name,Phone)
VALUES ('$name','$phone');
.quit
EOF
}

function del () {
echo "Please enter Id you want to delete:"
read -p "Id = " id

sqlite3 $DB_FILE << EOF
DELETE FROM customers WHERE Id=$id;
.quit
EOF
}

function list_data () {
sqlite3 $DB_FILE << EOF>"SQLOUT"
.header on
.mode column
SELECT * FROM customers;
.quit
EOF
MSG=$(cat SQLOUT)
dialog --title "$OPTIONS4" --msgbox "$MSG" 10 60
rm -f SQLOUT
}


function main_menu() {
echo "${TITLE}"
dialog --radiolist "$TITLE" 10 60 $O_NUMS "$TAG1" "$OPTIONS1" on "$TAG2" "$OPTIONS2" off "$TAG3" "$OPTIONS3" off "$TAG4" "$OPTIONS4" off 2>$TMP
ACTION=$(cat "$TMP")
rm -f $TMP
case "$ACTION" in
    1 )
      show_table_form
      main_menu
    ;;
    2 )
      add
      main_menu
    ;;
    3 )
      del
      main_menu
    ;;
    4 )
      list_data
      main_menu
    ;;
    *) echo "Invalid option. Try another one.";;
esac
}

main_menu
