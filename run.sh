#!/bin/sh

set -e

echo "$S3_ACCESS_KEY_ID:$S3_SECRET_ACCESS_KEY" > passwd && chmod 600 passwd
s3fs \
    -o passwd_file=passwd \
    -o url=$S3_HOST \
    -o nonempty \
    -o use_cache="" \
    -o allow_other \
    -o multireq_max=5 \
    -o use_path_request_style \
    "$S3_BUCKET" "$S3_MOUNT_POINT" \
    && tail -f /dev/null