FROM php:8.3.12-apache
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions pcntl pdo_mysql && \
    a2enmod rewrite

RUN mkdir -p /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
COPY ./tools/000-default.conf /etc/apache2/sites-enabled/
CMD ["apache2-foreground"]
