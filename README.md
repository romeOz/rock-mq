A message queue API for PHP
=================

Features
-------------------

 * Background sending
 * Pub/Sub
 * Non-blocking
 * Module for [Rock Framework](https://github.com/romeOz/rock)

Installation
-------------------

From the Command Line:

```composer require romeoz/rock-mq:*```

In your composer.json:

```json
{
    "require": {
        "romeoz/rock-mq": "*"
    }
}
```

Quick Start
-------------------

Run broker:

```
php tests/data/mq/rabbit/simple_server.php &
```

Code:

```php
use rock\mq\RabbitQueue;

$rabbit = new RabbitQueue();
$rabbit->send('test'); // result: "Hi! I am server: test"

// or background

$rabbit->sendBackground('test');
```

####Pub/Sub

Run broker:

```
php tests/data/mq/rabbit/pub_server.php &
```
Code:

```php
$rabbit = new RabbitQueue();
$rabbit->blocking = false;
$rabbit->type = 'direct';
$rabbit->exchange = 'direct_test';

$rabbit->subscribe('foo'); // result: "Hi! I am server: foo"
```


Requirements
-------------------
 * **PHP 5.4+**
 * [Gearman](http://gearman.org/) should be installed `apt-get install  libgearman7`. Also, should be installed [PHP extension](http://pecl.php.net/package/gearman) `apt-get install php5-gearman`
 * [RabbitMQ](http://www.rabbitmq.com/) should be installed `apt-get install rabbitmq-server`.
 * [ZeroMQ](http://zeromq.org/) should be installed `apt-get install libzmq3`. Also, should be installed [PHP extension](http://pecl.php.net/package/zmq) `apt-get install php-zmq`
 
> Note: if you have problems with the installation, then see config [.travis](https://github.com/romeOz/rock/tree/master/tests/data/travis).

License
-------------------

A message queue API is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).