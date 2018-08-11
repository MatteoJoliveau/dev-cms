FROM circleci/ruby:2.5.1-node

USER root

RUN mkdir -p /usr/local/app
RUN useradd -ms /bin/bash rails
RUN chown rails /usr/local/app

USER rails

WORKDIR /usr/local/app

COPY . /user/local/app

RUN ls

RUN bundle install
RUN yarn install

RUN /user/local/app/bin/webpack
RUN bundle exec rails asset:precompile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

