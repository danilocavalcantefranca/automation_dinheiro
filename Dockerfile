FROM rtfpessoa/ubuntu-jdk8
#MAINTAINER 99b2b@99app.com
RUN set -eux && \
    apt-get update && \
    apt-get install -y rubygems build-essential git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev && \
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc && \
    $HOME/.rbenv/bin/rbenv install 2.5.0 && \
    $HOME/.rbenv/bin/rbenv global 2.5.0
RUN mkdir automation
WORKDIR /automation
RUN git clone https://github.com/danilocavalcantefranca/automation_dinheiro.git
WORKDIR /automation/automation_dinheiro
COPY Gemfile .
RUN gem install bundler --source http://rubygems.org &&\
    bundle install && \
    bundle config --global frozen 0
CMD ["cucumber -p mp-dinheiro-hlg "]
EXPOSE 8081