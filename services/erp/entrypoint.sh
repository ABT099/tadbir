#!/bin/sh

echo "Waiting for database"
while [[ ! nc - z db 5432 ]]; do
  sleep 0.1
done
echo "Database started"

echo "Running database migrations"
npx prisma migrate deploy

exec "$@"
