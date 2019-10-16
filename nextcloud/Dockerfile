# We use a slightly modified build of nextcloud because we need smbclient installed for the external storage plugin to work
FROM nextcloud:17.0.0-apache

RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        smbclient

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]