#!/bin/bash

if [ "$(ls -A /etc/nginx)" = "" ]; then
    echo "Initialing Nginx config dir"
    cp -rp /usr/etc/nginx/* /etc/nginx/
    echo "Initialed Nginx config dir"
fi

echo set \$APP_ROOT $APP_ROOT\; > /etc/nginx/conf.d/env.variable

nginx &
/app/nginx-ui --config /etc/nginx-ui/app.ini
