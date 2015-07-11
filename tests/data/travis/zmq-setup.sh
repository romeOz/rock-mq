#!/bin/sh

if (php --version | grep -i HipHop > /dev/null); then
    echo "Skipping ZeroMQ on HHVM"
    exit 0
fi

git clone https://github.com/mkoppanen/php-zmq.git
cd php-zmq
phpize && ./configure && make && make install && echo "Installed ext/php-zmq-dev"

echo "extension = zmq.so" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini

cd -
# Run servers (workers)
php tests/data/mq/zero/simple_server.php &
php tests/data/mq/zero/pub_server.php &