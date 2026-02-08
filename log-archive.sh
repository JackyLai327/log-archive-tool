#!/bin/bash

clear

# Exit immediately if a command exits with a non-zero status
set -e

# Exit if any command in a pipeline fails
set -o pipefail

ARCHIVE_DIR="$1"

if [ -z "$ARCHIVE_DIR" ]; then
    echo "Error: Directory '$ARCHIVE_DIR' does not exist."
    exit 1
fi

DATE=$(date +"%Y%m%d")
TIME=$(date +"%H%M%S")
ARCHIVE_NAME="logs_archive_${DATE}_${TIME}.tar.gz"
NEW_DIR="$(pwd)/$ARCHIVE_NAME"
ARCHIVE_LOG_FILE="$(pwd)/archive_log.txt"

tar --create --gzip --file="$NEW_DIR" "$ARCHIVE_DIR"

echo "Archive created successfully: $NEW_DIR"

if [ -f "$ARCHIVE_LOG_FILE" ]; then
    echo "$DATE $TIME - Archive created: $NEW_DIR" >> "$ARCHIVE_LOG_FILE"
else
    echo "$DATE $TIME - Archive created: $NEW_DIR" > "$ARCHIVE_LOG_FILE"
fi
