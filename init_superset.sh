#!/bin/bash
set -e

echo "Starting Superset initialization..."

# Wait for database to be ready
echo "Waiting for database..."
sleep 10

# Initialize database
echo "Initializing Superset database..."
superset db upgrade

# Create admin user
echo "Creating admin user..."
superset fab create-admin \
    --username admin \
    --firstname Admin \
    --lastname User \
    --email admin@example.com \
    --password admin123

# Initialize Superset
echo "Initializing Superset..."
superset init

# Load examples (optional)
echo "Loading examples..."
superset load_examples

# Start Superset
echo "Starting Superset server..."
superset run -h 0.0.0.0 -p 8088 --with-threads --reload --debugger
