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
    && npm install -g \
        pm2 \
        commander async winston colors \
        uglify-js \
        postcss-cli csswring \
        nyc mocha \
	@babel/core @babel/register @babel/preset-env \
    \
    && apk del --no-cache \
        .node-dependencies \
    \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    \
    && mkdir -p /usr/local/lib/node_modules \
    \
    \
    \
    \
    \
    \
    && mkdir /app

CMD ["pm2", "--no-daemon"]
