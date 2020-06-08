#!/bin/bash
# Ask MAC Address and return amount to MAC increment

echo "Enter MAC Address (eg. 11:11:11:11:11:F9)"
read mac_address_string
mac_address=$(echo $mac_address_string | sed 's/://g')

mac_address_hex="0x${mac_address}"

echo "Number of MAC to create"
read num_mac_addr

counter_mac_addr=0

while [ ${counter_mac_addr} -lt ${num_mac_addr} ]
do
        counter_mac_addr_hex="0x${counter_mac_addr}"
        let result=$(( $mac_address_hex + $counter_mac_addr_hex))
        ((counter_mac_addr++))
        x=$( printf "%x" $result ) ; echo $x
done
