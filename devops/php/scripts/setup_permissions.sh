#!/bin/env bash
cd /var/www/html

chown -R :www-data . \
    && find var vendor pub/static pub/media app/etc -type f -exec chmod g+w {} \; \
    && find var vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} \; \
    && chmod u+x bin/magento && chmod 775 -R generated \
    && chmod 774 -R app/etc

echo "Permissions done!"
