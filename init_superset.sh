#!/bin/bash

set -e

# Wait for DB to be ready
until superset db upgrade; do
  echo "Waiting for database..."
  sleep 5
done

# Create admin user
export FLASK_APP=superset
superset fab create-admin \
  --username admin \
  --firstname Superset \
  --lastname Admin \
  --email admin@example.com \
  --password admin

# Initialize roles, permissions, etc.
superset init

# Start Superset server
exec superset run -h 0.0.0.0 -p 8088 --with-threads
