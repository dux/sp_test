require 'simplecov'

SimpleCov.start do
  add_filter "spec/"
end

ENV['PARSER_ENV'] = 'test'

require './lib/log_parser'
require './spec/spec_config'

