#!/bin/bash
TITLE="Select file menu"
DB_FILE=test.sql
PROMPT="Pick a task:"
OPTIONS=("show table form" "add" "del" "list data")

show_table_form () {
sqlite3 $DB_FILE << EOF
.schema customers
.quit
EOF
echo "----------------------------------------"
}

add () {
echo "Please enter Name:"
read -p "Name = " name
echo "Please enter Phone:"
read -p "Phone = " phone

sqlite3 $DB_FILE << EOF
INSERT INTO customers (Name,Phone)
VALUES ('$name','$phone');
.quit
EOF
echo "----------------------------------------"

}

del () {
echo "Please enter Id you want to delete:"
read -p "Id = " id

sqlite3 $DB_FILE << EOF
DELETE FROM customers WHERE Id=$id;
.quit
EOF
echo "----------------------------------------"

}

list_data () {
echo "----------------------------------------"
sqlite3 $DB_FILE << EOF
.header on
.mode column
SELECT * FROM customers;
.quit
EOF
echo "----------------------------------------"
}

function main_menu() {
  echo "${TITLE}"
  PS3="${PROMPT} "
  select OPT in "${OPTIONS[@]}" "quit"; do
    case "$REPLY" in
      1 )
        show_table_form
        main_menu
        break
      ;;
      2 )
        add
        main_menu
        break
      ;;
      3 )
        del
        main_menu
        break
      ;;
      4 )
        list_data
        main_menu
        break
      ;;
      $(( ${#OPTIONS[@]}+1 )) )
              echo "Exiting!"
              break
      ;;
      *) echo "Invalid option. Try another one.";continue;;
    esac
  done
}

main_menu
