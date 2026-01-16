# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Headless Craft CMS 5 installation serving as the backend API for a Nuxt frontend. Runs in Docker with PHP 8.2-FPM, Nginx, and MySQL 8.

## Commands

```bash
# First-time setup
make setup

# Start/stop containers
make up
make down

# Run Craft CLI commands
make craft c='migrate/all'
make craft c='gc'
make craft c='project-config/apply'

# Run Composer
make composer c='install'
make composer c='require craftcms/ckeditor'

# Access shells
make shell      # PHP container
make db-shell   # MySQL

# View logs
make logs

# Database backup
make backup

# Production deployment
make prod-up
make prod-down
```

## Architecture

- **craft/** - Craft CMS application root
  - **config/** - Configuration files (general.php, db.php, app.php)
  - **modules/** - Custom PHP modules
  - **web/** - Public webroot (index.php only, no templates)
- **docker/** - Docker configuration
  - **php/** - PHP-FPM Dockerfile and php.ini
  - **nginx/** - Nginx configuration

## Headless Mode

The CMS runs in headless mode (`headlessMode: true`). Content is accessed exclusively via GraphQL at `/api`. No frontend templates are served.

### GraphQL Configuration

- Endpoint: `http://localhost:8080/api`
- Schemas are managed in Craft admin under GraphQL > Schemas
- CORS origins configured via `GRAPHQL_ALLOWED_ORIGINS` env var
- Query limits: complexity 500, depth 10, results 1000

## Environment Variables

Key variables in `.env`:
- `CRAFT_SECURITY_KEY` - Required, generate with `make craft c='setup/security-key'`
- `PRIMARY_SITE_URL` - Site URL (http://localhost:8080 for dev)
- `GRAPHQL_ALLOWED_ORIGINS` - Comma-separated origins for CORS
- `CRAFT_DEV_MODE` - Enable for development (shows detailed errors)

## Production Deployment (Ubuntu VPS)

```bash
# Use production compose override
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

# Or use make target
make prod-up
```

Production differences:
- Database port not exposed
- Resource limits applied
- OPcache timestamps disabled
- Restart policies enabled
