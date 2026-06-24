#!/bin/bash

set -euo pipefail

CSV_FILE="${1:-users.csv}"

if [ ! -f "$CSV_FILE" ]; then
  echo "Error: CSV file '$CSV_FILE' not found."
  exit 1
fi

while IFS="," read -r username group; do
    [ -z "$username" ] && continue

    if ! getent group "$group" > /dev/null; then
        sudo groupadd "$group"
        echo "Group '$group' created."
    fi

    if ! id "$username" > /dev/null 2>&1; then
        sudo useradd -m -s /bin/bash -G "$group" "$username"
        echo "User '$username' created and added to group '$group'."
    else
        echo "User '$username' already exists."
    fi
done < "$CSV_FILE"