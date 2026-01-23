FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    bash \
    git \
    curl \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libwebp-dev \
    libzip-dev \
    icu-dev \
    imagemagick-dev \
    imagemagick \
    mysql-client \
    oniguruma-dev \
    $PHPIZE_DEPS

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        gd \
        intl \
        zip \
        opcache \
        bcmath \
        mbstring \
        pcntl

# Install ImageMagick extension
RUN pecl install imagick && docker-php-ext-enable imagick

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Configure PHP
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# PHP configuration for Craft CMS
COPY docker/php/php.ini /usr/local/etc/php/conf.d/craft.ini

# Set working directory
WORKDIR /var/www/html

# Copy application code
COPY craft/ /var/www/html/

# Install dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Create craft user and set permissions
RUN addgroup -g 1000 craft && adduser -u 1000 -G craft -s /bin/bash -D craft \
    && chown -R craft:craft /var/www/html \
    && chmod -R 775 /var/www/html/storage \
    && chmod -R 775 /var/www/html/web/cpresources

USER craft

EXPOSE 9000

CMD ["php-fpm"]
