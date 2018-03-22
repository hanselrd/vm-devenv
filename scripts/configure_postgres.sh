#!/bin/sh
PG_VERSION=$(dpkg -s postgresql | grep -E Version: | cut -d: -f2 | awk '{$1=$1};1' | awk -F"+" '{print $1}')
PG_DIR="/etc/postgresql/$PG_VERSION/main"
PG_CONF="$PG_DIR/postgresql.conf"
PG_HBA="$PG_DIR/pg_hba.conf"

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"
echo "host    all             all             all                     md5" >> "$PG_HBA"

service postgresql restart

cat << EOF | su - postgres -c psql
ALTER USER postgres WITH PASSWORD 'postgres';
CREATE DATABASE trace_dev;
CREATE DATABASE trace_test;
CREATE DATABASE darkve_dev;
CREATE DATABASE darkve_test;
EOF || true
