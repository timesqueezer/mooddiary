#!/bin/bash
ssh mooddiary.org pg_dumpall -U postgres | xz > /mnt/backup/pgdump-$(date --iso-8601=minutes).sql.xz
rm -f /mnt/backup/backup.tar.gz
tar czf /mnt/backup/backup.tar.gz \
    --ignore-failed-read \
    --exclude /var/cache \
    /boot /etc /home /opt /root /srv /var
