# syntax=docker/dockerfile:1
FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN curl https://deb.nodesource.com/setup_18.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn vim zip

RUN mkdir /municipe
WORKDIR /municipe

COPY Gemfile Gemfile Gemfile.lock .
RUN gem update bundle && bundle install

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bin/rails", "server", "-b", "0.0.0.0"]