FROM ruby:2.4-alpine

RUN apk add --update --no-cache build-base gcc bash git nodejs

RUN gem install jekyll

EXPOSE 4000

WORKDIR /site

COPY ./docker-entrypoint.sh /usr/local/bin/

ENV TARGET_BRANCH=master

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "serve", "--safe", "--trace", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
