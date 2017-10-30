FROM node:alpine
MAINTAINER Keiji Kobayashi <keiji.kobayashi.web@gmail.com>

RUN    apk add --update --no-cache \
        bash grep git jq make \
        udev ttf-freefont \
        chromium \
    \
    && apk add --update --no-cache --virtual=.node-dependencies \
        curl zlib-dev \
    \
    \
    \
    \
    \
    && curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    \
    && mkdir -p /usr/share/fonts/noto \
    \
    && unzip -o NotoSansCJKjp-hinted.zip -d /usr/share/fonts/noto/  \
    \
    && rm NotoSansCJKjp-hinted.zip \
    \
    && fc-cache -fv \
    \
    \
    \
    \
    \
    && npm cache verify \
    \
    && npm install --unsafe-perm --no-optional -g \
        pm2 bower \
        commander async winston colors \
        hjson jq uglify-js \
        postcss-cli csswring \
        'github:gulpjs/gulp.git#4.0' gulp-shell gulp-cli \
        nyc mocha \
    \
    && apk del --no-cache \
        .node-dependencies \
    \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    \
    && mkdir -p /usr/local/lib/node_modules \
    \
    && ln -s /usr/lib/node_modules/gulp-shell /usr/local/lib/node_modules/gulp-shell \
    \
    \
    \
    \
    \
    && mkdir /app

CMD ["pm2", "--no-daemon"]
