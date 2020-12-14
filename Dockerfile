FROM ruby:2.3.5
RUN apt-get update && \
    apt-get install -y make git libsqlite3-dev libxslt-dev libxml2-dev zlib1g-dev gcc && \
    apt-get clean
RUN git clone --depth=1 https://github.com/BuffaloWill/oxml_xxe.git /oxml_xxe && \
    cd /oxml_xxe && \
    sed -i 's/2.6.2/2.3.5/' Gemfile && \
    bundle install
WORKDIR /oxml_xxe
EXPOSE 4567
ENTRYPOINT ["ruby", "server.rb"]
CMD ["-o", "0.0.0.0"]
