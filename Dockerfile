FROM circleci/ruby:2.5.1-node

WORKDIR /usr/local/app

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

