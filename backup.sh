#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

SOURCE_DIR="$1"
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: '$SOURCE_DIR' is not a directory or does not exist."
    exit 1
fi

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

tar -czf "$BACKUP_NAME" "$SOURCE_DIR"

# Đã thêm dấu $ ở đây:
SIZE=$(du -h "$BACKUP_NAME" | cut -f1)

echo "backup created: $BACKUP_NAME ($SIZE)"
