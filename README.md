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
APP_KEY=

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=my_database
DB_USERNAME=my_user
DB_PASSWORD=my_password
```

⚠️ Never store real passwords in `.env.example`.
Use `.env` for private credentials.

---

## Environment Variables Overview

### `.env.example`

```env
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret
```

### `.env.example.docker`

```env
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

* Start containers (`docker compose up -d`)
* Build containers (`docker compose build`)
* Install dependencies & generate app key (`composer install`, `php artisan key:generate`)
* Run migrations and seed the database (`php artisan migrate --seed`)

---

## Useful Makefile Commands

| Command        | Description                               |
| -------------- | ----------------------------------------- |
| `make up`      | Start containers in detached mode         |
| `make down`    | Stop all containers                       |
| `make build`   | Rebuild containers                        |
| `make install` | Install dependencies and generate app key |
| `make migrate` | Run database migrations and seeders       |
| `make init`    | Full project setup from scratch           |
| `make bash`    | Open a shell inside the PHP container     |

---

## 4. Enter the PHP container shell

```bash
make bash
```
