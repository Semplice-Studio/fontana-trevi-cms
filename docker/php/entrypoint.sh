#!/bin/bash
set -e

echo "==> Waiting for database connection..."
until php craft db/check 2>/dev/null; do
    echo "Database not ready, waiting..."
    sleep 3
done

echo "==> Running database migrations..."
php craft migrate/all --interactive=0 || true

echo "==> Applying project config..."
php craft project-config/apply || true

echo "==> Starting PHP-FPM..."
exec php-fpm
