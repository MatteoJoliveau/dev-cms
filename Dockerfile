FROM circleci/ruby:2.5.1-node

RUN mkdir -p /usr/local/app

WORKDIR /usr/local/app

COPY Gemfile /user/local/app
COPY package.json /user/local/app

RUN bundle install
RUN yarn install

COPY . /user/local/app

RUN /user/local/app/bin/webpack
RUN bundle exec rails asset:precompile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

