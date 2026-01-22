# Fontana Trevi CMS

Headless Craft CMS 5 backend providing GraphQL API for the Nuxt frontend.

## Requirements

- Docker Desktop (latest version)
- Git

## Quick Start

### macOS / Linux

```bash
# 1. Clone the repository
git clone <repository-url>
cd fontana-trevi-cms

# 2. Copy environment files
cp .env.example .env
cp craft/.env.example craft/.env

# 3. Start Docker containers
docker compose up -d --build

# 4. Wait for MySQL to be ready (~30 seconds), then install dependencies
docker compose exec php composer install

# 5. Generate security key
docker compose exec php php craft setup/security-key

# 6. Import the seed database (includes content and admin user)
docker compose exec -T db mysql -u craft -pcraft craft < database/seed.sql

# 7. Apply the CMS configuration (syncs project config)
docker compose exec php php craft project-config/apply

# 8. Access the admin panel
open http://localhost:8080/admin
```

### Windows (PowerShell)

```powershell
# 1. Clone the repository
git clone <repository-url>
cd fontana-trevi-cms

# 2. Copy environment files
Copy-Item .env.example .env
Copy-Item craft\.env.example craft\.env

# 3. Start Docker containers
docker compose up -d --build

# 4. Wait for MySQL to be ready (~30 seconds), then install dependencies
docker compose exec php composer install

# 5. Generate security key
docker compose exec php php craft setup/security-key

# 6. Import the seed database (includes content and admin user)
Get-Content database\seed.sql | docker compose exec -T db mysql -u craft -pcraft craft

# 7. Apply the CMS configuration (syncs project config)
docker compose exec php php craft project-config/apply

# 8. Access the admin panel
Start-Process "http://localhost:8080/admin"
```

### Default Credentials

| Field | Value |
|-------|-------|
| URL | http://localhost:8080/admin |
| Username | `admin` |
| Password | `admin123` |

> ⚠️ Change these credentials in production!

## Development

### Starting/Stopping

```bash
# Start containers
docker compose up -d

# Stop containers (keeps data)
docker compose down

# Stop and remove all data (fresh start)
docker compose down -v

# View logs
docker compose logs -f
```

Or using Make (macOS/Linux):

```bash
make up      # Start containers
make down    # Stop containers
make logs    # View logs
```

### Common Tasks

```bash
# Access PHP container shell
docker compose exec php bash

# Run Craft CLI commands
docker compose exec php php craft migrate/all
docker compose exec php php craft project-config/apply
docker compose exec php php craft gc

# Run Composer
docker compose exec php composer install
docker compose exec php composer require vendor/package

# Database access
docker compose exec db mysql -u craft -pcraft craft

# Reset admin password
docker compose exec php php craft users/set-password admin@example.com --password=newpassword
```

### Database Seed

The repository includes a database seed (`database/seed.sql`) with:
- Admin user (admin / admin123)
- Homepage entry with Hero block
- Global Sets (Orari Settimanali) with sample data
- All configured content

**Import seed** (new developers):

```bash
# macOS/Linux
docker compose exec -T db mysql -u craft -pcraft craft < database/seed.sql

# Windows PowerShell
Get-Content database\seed.sql | docker compose exec -T db mysql -u craft -pcraft craft

# Or using Make (macOS/Linux only)
make db-seed
```

**Export/Update seed** (after adding new content):

```bash
# macOS/Linux
docker compose exec db mysqldump -u craft -pcraft --routines --triggers craft > database/seed.sql

# Or using Make
make db-export
```

> Remember to commit `database/seed.sql` after updating it!

### URLs

| Service | URL |
|---------|-----|
| Admin Panel | http://localhost:8080/admin |
| GraphQL API | http://localhost:8080/api |
| GraphQL Playground | http://localhost:8080/admin/graphql |

## GraphQL API

This CMS runs in **headless mode**. All content is accessed via GraphQL.

The GraphQL endpoint is configured in `craft/config/routes.php`:

```php
return [
    'api' => 'graphql/api',
];
```

### Public Schema

The public schema is already configured and allows unauthenticated access to:
- Homepage section and all block types
- Global Sets (Orari Settimanali)
- Asset volumes (Immagini, Video)

### Testing Queries

Use the GraphQL Playground at http://localhost:8080/admin/graphql or test via curl:

```bash
curl -X POST http://localhost:8080/api \
  -H "Content-Type: application/json" \
  -d '{"query":"{ping}"}'
```

### Example Query - Homepage

```graphql
{
  entry(section: "homepage", site: "default") {
    title
    ... on homepage_Entry {
      seoTitle
      seoDescription
      blocchi {
        ... on hero_Entry {
          __typename
          titolo
          titoloRiga2
          sottotitolo
          sottotitoloRiga2
          video { url }
        }
      }
    }
  }
}
```

### Example Query - Orari (Global Set)

```graphql
{
  globalSet(handle: "orariSettimanali") {
    ... on orariSettimanali_GlobalSet {
      orari {
        giorno
        apertura
        chiusura
        eccezione
      }
      orarioUltimoIngresso
    }
  }
}
```

### CORS Configuration

Update `GRAPHQL_ALLOWED_ORIGINS` in `craft/.env` with your frontend origin:

```env
GRAPHQL_ALLOWED_ORIGINS=http://localhost:3000,https://your-production-domain.com
```

## Project Structure

```
├── craft/                    # Craft CMS application
│   ├── config/
│   │   ├── general.php      # General settings (headless mode, GraphQL)
│   │   ├── db.php           # Database connection
│   │   ├── routes.php       # URL routes (GraphQL endpoint)
│   │   └── project/         # Project Config (versioned CMS structure)
│   │       ├── project.yaml
│   │       ├── sections/    # Sections (Homepage)
│   │       ├── entryTypes/  # Entry Types (Hero, Visita, etc.)
│   │       ├── fields/      # Field definitions
│   │       ├── globalSets/  # Global Sets (Orari)
│   │       └── graphql/     # GraphQL schemas
│   ├── storage/             # Logs, runtime cache (not in git)
│   ├── vendor/              # PHP dependencies (not in git)
│   └── web/                 # Public webroot
│       └── uploads/         # Uploaded assets
├── docker/
│   ├── nginx/default.conf   # Nginx configuration
│   └── php/Dockerfile       # PHP-FPM image
├── docker-compose.yml       # Development environment
├── docker-compose.prod.yml  # Production overrides
├── .env.example             # Environment template (Docker)
└── Makefile                 # Development commands (macOS/Linux)
```

### Project Config

Craft CMS uses **Project Config** to version the CMS structure. All fields, sections, and settings are stored as YAML files in `craft/config/project/`.

When pulling changes from git:

```bash
docker compose exec php php craft project-config/apply
```

This syncs the database with the YAML configuration.

## Environment Variables

Copy `.env.example` to `.env` and configure:

| Variable | Description |
|----------|-------------|
| `CRAFT_SECURITY_KEY` | Auto-generated during setup |
| `CRAFT_DEV_MODE` | `true` for development (detailed errors) |
| `PRIMARY_SITE_URL` | Site URL (http://localhost:8080 for dev) |
| `GRAPHQL_ALLOWED_ORIGINS` | CORS origins for frontend |
| `DB_PASSWORD` | Database password |

## Production Deployment

### On Ubuntu VPS

```bash
# 1. Clone and configure
git clone <repository-url>
cd fontana-trevi-cms
cp .env.example .env
cp craft/.env.example craft/.env

# 2. Edit .env with production values
#    - Set strong DB_PASSWORD and DB_ROOT_PASSWORD
#    - Set CRAFT_DEV_MODE=false
#    - Set PRIMARY_SITE_URL to your domain
#    - Set GRAPHQL_ALLOWED_ORIGINS to your frontend domain

# 3. Start with production config
make prod-up

# 4. Install Craft
make install
```

### Production Checklist

- [ ] Strong database passwords
- [ ] `CRAFT_DEV_MODE=false`
- [ ] `CRAFT_ALLOW_ADMIN_CHANGES=false` (use project config)
- [ ] `CRAFT_DISALLOW_ROBOTS=false` (if you want indexing)
- [ ] Configure reverse proxy (Nginx/Caddy) for SSL
- [ ] Set up automated backups (`make backup`)

## Troubleshooting

### Containers won't start

```bash
# Check container status
docker compose ps

# Check logs
docker compose logs -f

# Rebuild from scratch
docker compose down -v
docker compose up -d --build
```

### "vendor/craftcms/cms/bootstrap/web.php not found"

Composer dependencies are missing or corrupted:

```bash
docker compose exec php composer install
```

### Database connection failed

Wait 30 seconds after starting containers for MySQL to initialize, then check:

```bash
docker compose ps  # db should show "healthy"
```

### Permission issues

```bash
docker compose exec php chown -R www-data:www-data /var/www/html/storage
docker compose exec php chmod -R 775 /var/www/html/storage
```

### Reset admin password

```bash
docker compose exec php php craft users/set-password admin@example.com --password=newpassword
```

### Project Config out of sync

If you see errors after pulling changes:

```bash
docker compose exec php php craft project-config/apply --force
```

### GraphQL endpoint returns 404

Make sure `craft/config/routes.php` exists with:

```php
<?php
return [
    'api' => 'graphql/api',
];
```
