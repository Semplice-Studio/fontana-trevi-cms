FROM mysql:8.0

# Copy seed file to be executed on first startup
COPY database/seed.sql /docker-entrypoint-initdb.d/seed.sql
