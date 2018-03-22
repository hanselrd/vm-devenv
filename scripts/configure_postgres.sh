#!/bin/sh
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres'" || true
sudo -u postgres psql -c "CREATE DATABASE trace_dev" || true
sudo -u postgres psql -c "CREATE DATABASE trace_test" || true
sudo -u postgres psql -c "CREATE DATABASE darkve_dev" || true
sudo -u postgres psql -c "CREATE DATABASE darkve_test" || true
