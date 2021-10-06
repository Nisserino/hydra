FROM nextcloud

#import and run init script

RUN mkdir /var/www/html/nextcloud_init
COPY nextcloud_init.sh /var/www/html/init_scripts/
RUN .init_scripts/nextcloud_init.sh

