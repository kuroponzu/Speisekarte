FROM node:12.18.2-alpine3.11

ENV APP_HOME /app
ENV PATH ${APP_HOME}/node_modules/.bin:$PATH
ENV TZ Asia/Tokyo

ENV HOST 0.0.0.0
ENV PORT 8080

WORKDIR ${APP_HOME}
ADD . ${APP_HOME}

RUN apk update \
    && apk upgrade \
    && npm i -g create-nuxt-app \
    && rm -rf /var/cache/apk/*

EXPOSE ${PORT}
