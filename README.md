# Laravel Project with Docker

## Requirements

* Docker & Docker Compose
* Git
* PHP and Composer (optional, if running only via Docker)

---

## Quick Start

### 1. Clone the project

```bash
git clone https://github.com/mykhailoBakhmutCa/trip_builder_clear
cd trip_builder_clear
```

### 2. Create your `.env` file

```bash
cat .env.example .env.example.docker > .env
```

Edit `.env` and provide your configuration values, for example:

```env
APP_NAME=MyProject
APP_ENV=local

DB_CONNECTION=mysql
DB_HOST=mysql       # must match the MySQL service name in docker-compose.yml
DB_PORT=3306
DB_DATABASE=my_database
DB_USERNAME=my_user
DB_PASSWORD=my_password
```

⚠️ Never store real passwords in `.env.example`. Use `.env` for private credentials.

---

## Environment Variables Overview

### `.env.example`

```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret
```

### `.env.example.docker`

```
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=laravel
MYSQL_USER=laravel
MYSQL_PASSWORD=secret
```

---

## 3. Initialize the project with Docker + Makefile

```bash
make init
```

This command will:

* Build and start containers (`docker compose build && docker compose up -d`)
* Install PHP dependencies and generate app key (`composer install` & `php artisan key:generate`)
* Run migrations (`make migrate`) and seed the database (`make seed`)

> Note: Migrations and seeders are now separate commands for more control.

---

## Useful Makefile Commands

| Command        | Description                                                         |
| -------------- | ------------------------------------------------------------------- |
| `make up`      | Start containers in detached mode                                   |
| `make down`    | Stop all containers and remove volumes                              |
| `make build`   | Rebuild containers                                                  |
| `make install` | Install dependencies and generate app key                           |
| `make migrate` | Run database migrations (without seeders)                           |
| `make seed`    | Seed the database                                                   |
| `make init`    | Full project setup from scratch (build, up, install, migrate, seed) |
| `make bash`    | Open a shell inside the PHP container                               |

---

## 4. Enter the PHP container shell

```bash
make bash
```

---

## 5. Notes

* `DB_HOST` in `.env` must match the MySQL service name in docker-compose (`mysql` in this project).
* `make init` safely waits for the database to be ready before running migrations.

---

## 6. Running Tests

All tests should be run inside the PHP container to ensure the correct environment and dependencies.

### Enter PHP container shell

```bash
make bash
```

### Inside the container, run Laravel tests

```bash
php artisan test
```

### Or run directly from host without entering container

```bash
docker compose exec php php artisan test
```

Tests will use the database specified in your `.env`.

For isolated test database, consider creating a `.env.testing` file with a separate database configuration.
