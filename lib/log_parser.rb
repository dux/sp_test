require 'bundler'

Bundler.require ENV['PARSER_ENV'] || 'default'

require_relative 'log_parser/log_parser'
require_relative 'log_parser/log_presenter'
