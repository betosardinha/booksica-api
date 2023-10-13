# syntax = docker/dockerfile:1

FROM ruby:3.2.0

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y postgresql-client

RUN bundle config --global frozen 1

WORKDIR /booksica-api

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
