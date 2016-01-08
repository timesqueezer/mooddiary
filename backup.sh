#!/bin/bash
ssh mooddiary.org pg_dumpall -U postgres | xz > /media/sf_backup/pgdump-$(date --iso-8601=hours).sql.xz
ssh root@mooddiary.org tar czf /home/backup.tar.gz \
    --ignore-failed-read \
    --exclude /var/cache \
    /boot /etc /home /opt /root /srv /var
rm -f /media/sf_backup/backup.tar.gz
scp mooddiary.org:backup.tar.gz /media/sf_backup/backup.tar.gz
