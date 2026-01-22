.PHONY: help up down build rebuild logs shell db-shell composer craft install setup backup db-export db-seed

# Default target
help:
	@echo "Fontana Trevi CMS - Available commands:"
	@echo ""
	@echo "  make up        - Start all containers"
	@echo "  make down      - Stop all containers"
	@echo "  make build     - Build containers"
	@echo "  make rebuild   - Rebuild containers from scratch"
	@echo "  make logs      - View container logs"
	@echo "  make shell     - Access PHP container shell"
	@echo "  make db-shell  - Access MySQL shell"
	@echo "  make composer  - Run composer (use: make composer c='install')"
	@echo "  make craft     - Run Craft CLI (use: make craft c='migrate/all')"
	@echo "  make install   - Fresh Craft installation"
	@echo "  make setup     - Initial project setup"
	@echo "  make backup    - Backup database with timestamp"
	@echo "  make db-export - Export database to seed.sql (for sharing)"
	@echo "  make db-seed   - Import seed.sql (for new developers)"
	@echo ""

# Docker commands
up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

rebuild:
	docker compose down -v
	docker compose build --no-cache
	docker compose up -d

logs:
	docker compose logs -f

# Shell access
shell:
	docker compose exec php bash

db-shell:
	docker compose exec db mysql -u craft -pcraft craft

# Composer
composer:
	docker compose exec php composer $(c)

# Craft CLI
craft:
	docker compose exec php php craft $(c)

# Fresh installation (creates empty database - use for new projects)
install:
	@echo "Installing Composer dependencies..."
	docker compose exec php composer install
	@echo ""
	@echo "Running Craft setup..."
	docker compose exec php php craft setup/security-key
	docker compose exec php php craft install
	@echo ""
	@echo "Installation complete! Access the admin at http://localhost:8080/admin"

# Initial setup with seed data (recommended for new developers)
setup:
	@echo "=== Fontana Trevi CMS Setup ==="
	@echo ""
	@echo "1. Copying environment files..."
	cp -n .env.example .env || true
	cp -n craft/.env.example craft/.env || true
	@echo ""
	@echo "2. Starting Docker containers..."
	docker compose up -d --build
	@echo ""
	@echo "3. Waiting for database to be ready..."
	sleep 15
	@echo ""
	@echo "4. Installing Composer dependencies..."
	docker compose exec php composer install
	@echo ""
	@echo "5. Generating security key..."
	docker compose exec php php craft setup/security-key
	@echo ""
	@echo "6. Importing seed database..."
	docker compose exec -T db mysql -u craft -pcraft craft < database/seed.sql
	@echo ""
	@echo "7. Applying project config..."
	docker compose exec php php craft project-config/apply --force
	@echo ""
	@echo "=== Setup Complete! ==="
	@echo ""
	@echo "Access the admin panel at: http://localhost:8080/admin"
	@echo "Login: admin / admin123"
	@echo ""

# Database backup
backup:
	@mkdir -p backups
	docker compose exec db mysqldump -u craft -pcraft craft > backups/backup-$$(date +%Y%m%d-%H%M%S).sql
	@echo "Backup created in backups/"

# Export database to seed file (run this to update the shared seed)
db-export:
	@echo "Exporting database to database/seed.sql..."
	docker compose exec db mysqldump -u craft -pcraft --routines --triggers craft > database/seed.sql
	@echo "Database exported! Commit database/seed.sql to share with team."

# Import seed database (for new developers)
db-seed:
	@echo "Importing seed database..."
	docker compose exec -T db mysql -u craft -pcraft craft < database/seed.sql
	@echo "Seed imported! Run 'make craft c=\"project-config/apply\"' if needed."

# Production deployment
prod-up:
	docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

prod-down:
	docker compose -f docker-compose.yml -f docker-compose.prod.yml down
