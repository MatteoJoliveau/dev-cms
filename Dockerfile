FROM ruby:2.5

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt update -y && apt install build-essential nodejs yarn libpq-dev -y

RUN mkdir /app
WORKDIR /app

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

RUN bundle exec rails assets:precompile

CMD /app/docker-entrypoint.sh
