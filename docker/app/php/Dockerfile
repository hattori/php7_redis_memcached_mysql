# http://registry.hub.docker.com/_/php/
FROM php:7

RUN apt-get update
RUN apt-get install --force-yes -y sudo unzip git mysql-client zlib1g-dev libmemcached-dev
RUN docker-php-ext-install pdo_mysql

# php-memcached
RUN cd /usr/local/src && \
  git clone -b php7 --depth 1 https://github.com/php-memcached-dev/php-memcached && \
  cd php-memcached && phpize  && ./configure  && make  && make install
# phpredis
RUN cd /usr/local/src && \
  git clone -b php7 --depth 1 https://github.com/phpredis/phpredis && \
  cd phpredis && phpize  && ./configure  && make  && make install

# composer
ENV HASH e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '${HASH}') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');"

RUN mkdir /host
VOLUME /host

# sudo 可能な docker ユーザー (グループ:docker, パスワード:docker) を作成する。
RUN groupadd docker \
    && useradd -g docker -d /home/docker -s /bin/bash docker \
    && echo "docker:docker" | chpasswd \
    && gpasswd -a docker sudo \
    && mkdir /home/docker \
    && chown docker:docker /home/docker
USER docker
ENV TERM xterm
ENV HOME /home/docker
ENV LANG C.UTF-8

# MySQL クライアント設定
ADD my.cnf /etc/mysql/my.cnf

WORKDIR /host
