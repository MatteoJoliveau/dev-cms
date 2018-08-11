FROM circleci/ruby:2.5.1-node

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile /user/src/app
COPY package.json /user/src/app

RUN bundle install
RUN yarn install

COPY . /user/src/app

RUN /user/src/app/bin/webpack
RUN bundle exec rails asset:precompile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

