#!/bin/bash
# Ask MAC Address and return amount to MAC increment

echo "Enter MAC Address (eg. 11:11:11:11:11:F9)"
read mac_address_string
mac_address=$(echo $mac_address_string | sed 's/://g')

mac_address_hex="0x${mac_address}"

echo "Number of MAC to create"
read num_mac_addr

counter_mac_addr=0

if [[ $mac_address_hex -ge 0x0 ]] && [ $(( $mac_address_hex + $num_mac_addr )) -le 281474976710655 ]; then
        while [ ${counter_mac_addr} -lt ${num_mac_addr} ]
        do
                counter_mac_addr_hex="0x${counter_mac_addr}"
                let result=$(( $mac_address_hex + $counter_mac_addr_hex))
                ((counter_mac_addr++))
                x=$( printf "%12x" $result )
                echo $x | awk '{gsub(/..\B/,"&:")}1'
        done
else
        echo "number out of range"
fi
