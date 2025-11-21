init: build up install migrate

up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

install:
	docker compose exec php composer install
	docker compose exec php php artisan key:generate

migrate:
	docker compose exec php php artisan migrate --seed

bash:
	docker compose exec php bash
