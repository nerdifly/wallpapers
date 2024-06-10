#!/bin/bash

main() {
    clear
    echo "Welcome to the MacSploit key cracker!"
    echo "made by meman_pablo"

    echo "getting YOUR hwid"
    curl -s "https://git.abyssdigital.xyz/sellix/hwid" -o "./hwid"
    chmod +x ./hwid

    local user_hwid=$(./hwid)
    
    # Repeat the API call until the response is not "Invalid Key Entered"
    while true; do
        random_string=$(openssl rand -base64 32 | tr -dc 'a-zA-Z0-9' | head -c 32)
        input_key=$random_string
        resp=$(curl -s "https://git.abyssdigital.xyz/api/sellix?key=$random_string&hwid=$user_hwid")
        if [[ $resp != "Invalid Key Entered" ]]; then
        break
        fi
    done

    # Print the response
    echo "$resp"
}
while true; do main; sleep 0.000000000000000000000000001; done
