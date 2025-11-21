ARG UID=1000
ARG GID=1000

FROM php:8.3-fpm

# Повторяем ARG после FROM — это критично!
ARG UID
ARG GID

# Создаём пользователя с нужным UID/GID
RUN groupadd -g ${GID} appuser \
    && useradd -u ${UID} -g ${GID} -m appuser

# Устанавливаем зависимости и расширения PHP
RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libonig-dev libxml2-dev libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring zip xml gd

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Используем нового пользователя
USER appuser

WORKDIR /var/www/html
