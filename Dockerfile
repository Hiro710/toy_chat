FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /toy_chat_dk
WORKDIR /toy_chat_dk
ADD Gemfile /toy_chat_dk/Gemfile
ADD Gemfile.lock /toy_chat_dk/Gemfile.lock
RUN bundle install
ADD . /toy_chat_dk
CMD bundle exec rails s -p 3000 -b '0.0.0.0'
