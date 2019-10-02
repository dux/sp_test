# Simple log parser

## Requirement

Write a ruby script that:

* Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
* Returns the following:
  * list of webpages with most page views ordered from most pages views to less page views
  * list of webpages with most unique page views also ordered

## Instalation

Ensure you have installed Ruby 2.x+ and run

`bundle install`

## Usage

Help - `bundle exec ./bin/parser`

### Most viewed pages

`bundle exec bin/parser --file logs/webserver.log`

### Most unique visitors

`bundle exec bin/parser --file logs/webserver.log -m unique`

## Extras

### Quiet - no usless formating

`bundle exec bin/parser --file logs/webserver.log -q`

### Console

`bundle exec bin/console`

### Rubocop - check code quality

`bundle exec rubocop`

### Show code test coverage

`bundle exec rspec` and then `open coverage/index.html`

![Code coverage](https://i.imgur.com/6QCR5u0.png)



