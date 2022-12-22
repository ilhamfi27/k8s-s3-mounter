#!/bin/sh

set -e

# Create destination directory if it does not exist.
if [ ! -d "$S3_MOUNT_POINT" ]; then
    mkdir -p "$S3_MOUNT_POINT"
fi
chmod 777 -R "$S3_MOUNT_POINT"

exec "$@"
