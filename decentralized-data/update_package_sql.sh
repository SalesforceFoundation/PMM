#!/bin/sh
set -e

for mapping in ./decentralized-data/*/*.yml
do
    echo "$mapping"
    echo "    basename: $(basename "$mapping" .yml)"
    echo "    directory: $(dirname "$mapping")"
    cci task run capture_bulk_data_orig -o mapping $mapping -o sql_path "$(dirname "$mapping")/$(basename "$mapping" .yml).sql"
done