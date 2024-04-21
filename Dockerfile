FROM --platform=$TARGETPLATFORM uozi/nginx-ui-base:latest
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
WORKDIR /app
EXPOSE 80 443

COPY resources/docker/start.sh /app/start.sh
COPY resources/docker/nginx.conf /usr/etc/nginx/nginx.conf
COPY resources/docker/nginx-ui.conf /usr/etc/nginx/conf.d/nginx-ui.conf
COPY resources/docker/nginx-ui.conf /etc/nginx/conf.d/nginx-ui.conf
COPY nginx-ui-$TARGETOS-$TARGETARCH$TARGETVARIANT/nginx-ui /app/nginx-ui

COPY resources/demo/demo.db /etc/nginx-ui/database.db
COPY resources/demo/app.ini /etc/nginx-ui/app.ini

RUN cd /app && chmod a+x /app/start.sh  \
    && rm -f /etc/nginx/conf.d/default.conf  \
    && rm -f /usr/etc/nginx/conf.d/default.conf

ENTRYPOINT ["./start.sh"]
