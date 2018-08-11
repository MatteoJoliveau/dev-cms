FROM circleci/ruby:2.5.1-node

USER root

RUN useradd -ms /bin/bash rails

WORKDIR /usr/local/app

RUN chown rails /usr/local/app

USER rails

COPY Gemfile .
COPY Gemfile.lock .
COPY package.json .
COPY yarn.lock .

RUN bundle install --jobs 20 --retry 5 --without development test
RUN yarn install

COPY . /user/local/app

RUN bin/webpack
RUN bundle exec rails asset:precompile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

