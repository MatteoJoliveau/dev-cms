FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs yarn postgresql-dev tzdata

RUN mkdir /app
WORKDIR /app

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install --binstubs

COPY . .

RUN bundle exec rails assets:precompile

CMD puma -C config/puma.rb

#CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

