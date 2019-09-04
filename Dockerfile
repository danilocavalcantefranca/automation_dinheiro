FROM ruby:2.5
#MAINTAINER 99b2b@99app.com
RUN mkdir automation
WORKDIR /automation
COPY ./ .
RUN gem install bundler --source http://rubygems.org &&\
    bundle install && \
    bundle config --global frozen 0
RUN bundle
ENV environment mp-dinheiro-hlg
ENV tag "not @bug_prd"
ENTRYPOINT cucumber -p ${environment} -t "${tag}"
USER jenkins