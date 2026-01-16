.PHONY: help up down build rebuild logs shell db-shell composer craft install setup backup

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
	@echo "  make backup    - Backup database"
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

# Fresh installation
install:
	@echo "Installing Composer dependencies..."
	docker compose exec php composer install
	@echo ""
	@echo "Running Craft setup..."
	docker compose exec php php craft setup/security-key
	docker compose exec php php craft install
	@echo ""
	@echo "Installation complete! Access the admin at http://localhost:8080/admin"

# Initial setup (first time only)
setup:
	@echo "Setting up project..."
	cp -n .env.example .env || true
	cp -n craft/.env.example craft/.env || true
	docker compose up -d --build
	@echo "Waiting for database..."
	sleep 10
	$(MAKE) install

# Database backup
backup:
	@mkdir -p backups
	docker compose exec db mysqldump -u craft -pcraft craft > backups/backup-$$(date +%Y%m%d-%H%M%S).sql
	@echo "Backup created in backups/"

# Production deployment
prod-up:
	docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

prod-down:
	docker compose -f docker-compose.yml -f docker-compose.prod.yml down
