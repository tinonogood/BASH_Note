#!/usr/bin/expect

set ip [lindex $argv 0]
set userid [lindex $argv 1]
set mypassword [lindex $argv 2]
set timeout 30

spawn ssh $userid@$ip
expect {
"*yes/no" {send "yes\r"; exp_continue}
"*Password" {send "$mypassword\r"}
}

interact
