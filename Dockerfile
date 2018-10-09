FROM jekyll/minimal

COPY "docker-startup.sh" "/usr/local/bin"

WORKDIR /atalablog

RUN gem install jekyll-paginate
