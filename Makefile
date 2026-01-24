.PHONY: help up down build rebuild logs shell db-shell composer craft install setup backup db-export db-seed assets-export assets-seed assets-backup fix-permissions security-key

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
	@echo "  make assets-export - Export assets to assets.tar.gz (for sharing)"
	@echo "  make assets-seed   - Import assets.tar.gz (for new developers)"
	@echo "  make assets-backup - Backup assets with timestamp"
	@echo "  make fix-permissions - Fix vendor folder permissions"
	@echo "  make security-key    - Generate Craft security key"
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

# Fix permissions for Craft folders (needed on Linux servers)
fix-permissions:
	@echo "Creating required directories..."
	mkdir -p craft/vendor craft/storage craft/web/cpresources
	@echo "Fixing permissions (may require sudo password)..."
	sudo chown -R 33:33 craft/vendor craft/storage craft/web/cpresources
	sudo chmod -R 777 craft/vendor craft/storage craft/web/cpresources
	@echo "Permissions fixed!"

# Generate Craft security key (needed on Linux servers where permissions block the craft command)
security-key:
	@echo "Generating security key..."
	@KEY=$$(openssl rand -base64 32) && \
	if [ "$$(uname)" = "Darwin" ]; then \
		sed -i '' "s|^CRAFT_SECURITY_KEY=.*|CRAFT_SECURITY_KEY=$$KEY|" craft/.env; \
	else \
		sed -i "s|^CRAFT_SECURITY_KEY=.*|CRAFT_SECURITY_KEY=$$KEY|" craft/.env; \
	fi && \
	echo "Security key generated and saved to craft/.env"

# Fresh installation (creates empty database - use for new projects)
install:
	@echo "Creating required directories..."
	mkdir -p craft/vendor craft/storage craft/web/cpresources
	@echo "Fixing permissions..."
	sudo chown -R 33:33 craft/vendor craft/storage craft/web/cpresources || true
	sudo chmod -R 777 craft/vendor craft/storage craft/web/cpresources || true
	@echo "Installing Composer dependencies..."
	docker compose exec -u root php composer install --no-interaction
	@echo "Generating security key..."
	@KEY=$$(openssl rand -base64 32) && \
	if [ "$$(uname)" = "Darwin" ]; then \
		sed -i '' "s|^CRAFT_SECURITY_KEY=.*|CRAFT_SECURITY_KEY=$$KEY|" craft/.env; \
	else \
		sed -i "s|^CRAFT_SECURITY_KEY=.*|CRAFT_SECURITY_KEY=$$KEY|" craft/.env; \
	fi
	@echo ""
	@echo "Running Craft install..."
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
	@echo "4. Creating required directories and fixing permissions..."
	mkdir -p craft/vendor craft/storage craft/web/cpresources
	sudo chown -R 33:33 craft/vendor craft/storage craft/web/cpresources || true
	sudo chmod -R 777 craft/vendor craft/storage craft/web/cpresources || true
	@echo ""
	@echo "5. Installing Composer dependencies..."
	docker compose exec -u root php composer install --no-interaction
	@echo ""
	@echo "6. Generating security key..."
	@KEY=$$(openssl rand -base64 32) && \
	if [ "$$(uname)" = "Darwin" ]; then \
		sed -i '' "s|^CRAFT_SECURITY_KEY=.*|CRAFT_SECURITY_KEY=$$KEY|" craft/.env; \
	else \
		sed -i "s|^CRAFT_SECURITY_KEY=.*|CRAFT_SECURITY_KEY=$$KEY|" craft/.env; \
	fi
	@echo ""
	@echo "7. Importing seed database..."
	docker compose exec -T db mysql -u craft -pcraft craft < database/seed.sql
	@echo ""
	@echo "8. Applying project config..."
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
	docker compose exec db mysqldump -u craft -pcraft --routines --triggers --no-tablespaces craft > database/seed.sql
	@echo "Database exported! Commit database/seed.sql to share with team."

# Import seed database (for new developers)
db-seed:
	@echo "Importing seed database..."
	docker compose exec -T db mysql -u craft -pcraft craft < database/seed.sql
	@echo "Seed imported! Run 'make craft c=\"project-config/apply\"' if needed."

# Export assets to archive (run this to update the shared assets)
assets-export:
	@echo "Exporting assets to database/assets.tar.gz..."
	tar -czf database/assets.tar.gz -C craft/web uploads/
	@echo "Assets exported! Share database/assets.tar.gz with the team."

# Import assets from archive (for new developers)
assets-seed:
	@if [ ! -f database/assets.tar.gz ]; then \
		echo "Error: database/assets.tar.gz not found!"; \
		exit 1; \
	fi
	@echo "Importing assets from database/assets.tar.gz..."
	tar -xzf database/assets.tar.gz -C craft/web
	@echo "Assets imported successfully!"

# Assets backup with timestamp
assets-backup:
	@mkdir -p backups
	tar -czf backups/assets-$$(date +%Y%m%d-%H%M%S).tar.gz -C craft/web uploads/
	@echo "Assets backup created in backups/"

# Production deployment
prod-up:
	docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

prod-down:
	docker compose -f docker-compose.yml -f docker-compose.prod.yml down
