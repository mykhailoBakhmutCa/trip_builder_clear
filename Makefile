init: build up install migrate seed

wait-db:
	@echo "Waiting for database to be ready..."
	@until docker compose exec php php artisan migrate:status >/dev/null 2>&1; do \
		echo "Database not ready, retrying in 2s..."; \
		sleep 2; \
	done
	@echo "Database is ready!"

up:
	docker compose up -d

down:
	docker compose down -v

build:
	docker compose build

install: up
	docker compose exec php composer install
	docker compose exec php php artisan key:generate

migrate: wait-db
	docker compose exec php php artisan migrate

seed: wait-db
	docker compose exec php php artisan db:seed

bash:
	docker compose exec php bash
