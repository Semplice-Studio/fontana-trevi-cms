# Fontana Trevi CMS

Headless Craft CMS backend providing GraphQL API for the Nuxt frontend.

## Requirements

- Docker & Docker Compose
- Make (optional, for convenience commands)

## Quick Start

```bash
# 1. Clone the repository
git clone <repository-url>
cd fontana-trevi-cms

# 2. Run setup (creates .env, builds containers, installs dependencies)
make setup

# 3. Access the admin panel
open http://localhost:8080/admin
```

During `make setup`, you'll be prompted to create an admin account.

## Development

### Starting/Stopping

```bash
make up      # Start containers
make down    # Stop containers
make logs    # View logs
```

### Common Tasks

```bash
# Access PHP container shell
make shell

# Run Craft CLI commands
make craft c='migrate/all'
make craft c='project-config/apply'
make craft c='gc'

# Run Composer
make composer c='install'
make composer c='require vendor/package'

# Database access
make db-shell

# Database backup
make backup
```

### URLs

| Service | URL |
|---------|-----|
| Admin Panel | http://localhost:8080/admin |
| GraphQL API | http://localhost:8080/api |
| GraphQL Playground | http://localhost:8080/admin/graphql |

## GraphQL API

This CMS runs in **headless mode**. All content is accessed via GraphQL.

### Setting Up Schemas

1. Go to **Admin > GraphQL > Schemas**
2. Create a schema for your frontend (e.g., "Public API")
3. Select which sections/assets/globals to expose
4. Copy the token for authenticated requests, or enable public access

### CORS Configuration

Update `GRAPHQL_ALLOWED_ORIGINS` in `.env` with your Nuxt app's origin:

```env
GRAPHQL_ALLOWED_ORIGINS=http://localhost:3000,https://your-production-domain.com
```

### Example Query

```graphql
{
  entries(section: "news", limit: 10) {
    id
    title
    slug
    postDate
  }
}
```

## Project Structure

```
├── craft/                    # Craft CMS application
│   ├── config/              # Configuration files
│   │   ├── general.php      # General settings (headless mode, GraphQL)
│   │   ├── db.php           # Database connection
│   │   └── app.php          # Application config, custom modules
│   ├── modules/             # Custom PHP modules
│   ├── storage/             # Logs, runtime cache (not in git)
│   └── web/                 # Public webroot
├── docker/
│   ├── nginx/               # Nginx configuration
│   └── php/                 # PHP-FPM Dockerfile
├── docker-compose.yml       # Development environment
├── docker-compose.prod.yml  # Production overrides
└── Makefile                 # Development commands
```

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
# Check logs
make logs

# Rebuild from scratch
make rebuild
```

### Permission issues

```bash
# Fix storage permissions
docker compose exec php chown -R craft:craft /var/www/html/storage
```

### Database connection failed

Ensure the database container is healthy:

```bash
docker compose ps
```

Wait a few seconds after `make up` for MySQL to initialize.
