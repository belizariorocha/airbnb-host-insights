superset db upgrade
export FLASK_APP=superset
superset fab create-admin \
  --username admin \
  --firstname Superset \
  --lastname Admin \
  --email admin@example.com \
  --password yourpassword
superset init
