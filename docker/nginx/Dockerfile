FROM nginx:alpine

# Copy nginx configuration
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy static files (web folder only - PHP is handled by php-fpm)
COPY craft/web/ /var/www/html/web/

# Set proper permissions
RUN chown -R nginx:nginx /var/www/html

EXPOSE 80
