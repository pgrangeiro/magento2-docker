#!/bin/env bash

cp -R /project/* /var/www/html

LANGUAGE='pt_BR'
CURRENCY='BRL'
TIMEZONE='America/Sao_Paulo'


# Setup Magento
php bin/magento setup:install \
    --base-url=$BASE_URL \
    --backend-frontname=$ADMIN_URL_PATH \
    --use-rewrites=1 \
    --db-host=mysql:3306 \
    --db-name=$MYSQL_DATABASE \
    --db-user=$MYSQL_USER \
    --db-password=$MYSQL_PASSWORD \
    --admin-firstname=$ADMIN_USER \
    --admin-lastname=$ADMIN_USER \
    --admin-email=$ADMIN_EMAIL \
    --admin-user=$ADMIN_USER \
    --admin-password=$ADMIN_PASSWD \
    --language=$LANGUAGE \
    --currency=$CURRENCY \
    --timezone=$TIMEZONE

# Setup Redis cache
php bin/magento setup:config:set \
    --cache-backend=redis \
    --cache-backend-redis-server=redis \
    --cache-backend-redis-db=0 \
    --page-cache=redis \
    --page-cache-redis-server=redis \
    --page-cache-redis-db=1 \
    --session-save=redis \
    --session-save-redis-host=redis \
    --session-save-redis-log-level=3 \
    --session-save-redis-db=2

# Set permissions to install modules
source /scripts/setup_permissions.sh


source /scripts/setup_theme.sh
source /scripts/setup_modules.sh

php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f pt_BR en_US
php bin/magento cache:clean
php bin/magento cache:flush


crontab -u root /etc/cron.d/magento

# Set permissions again... (some modules and themes did a mess with it)
source /scripts/setup_permissions.sh

echo "Setup Magento project Done!"
