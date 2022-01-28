FROM ruby:3.0.0-alpine

RUN mkdir /robost_dilemma
WORKDIR /robost_dilemma

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY . .

RUN gem update --system
RUN gem install bundler -v 2.2.22

RUN bundle install



CMD ["ruby", "./lib/robots_dilemma.rb"]