init: build up install migrate

wait-db:
	@echo "Waiting for database to be ready..."
	@until docker compose exec php sh -c 'php -r "\
try { \
$${pdo} = new PDO(\"mysql:host=$${DB_HOST};port=$${DB_PORT};dbname=$${DB_DATABASE}\", \"$${DB_USERNAME}\", \"$${DB_PASSWORD}\"); \
exit(0); \
} catch (Exception $${e}) { exit(1); }"'; do \
		echo "Database not ready, retrying in 2s..."; \
		sleep 2; \
	done
	@echo "Database is ready!"

up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

install: up
	docker compose exec php composer install
	docker compose exec php php artisan key:generate

migrate: wait-db
	docker compose exec php php artisan migrate --seed --force

bash:
	docker compose exec php bash
