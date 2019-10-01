#!/usr/bin/env ruby

require './lib/log_parser'
require './lib/log_presenter'

parser  = LogParser.new ARGV[0]
present = LogPresenter.new parser

present.section 'Log file' do
  puts parser.log_file
end

present.list :most_viewed_pages, 'Most viewed pages', 'view'

present.list :most_unique_visitors, 'Most unique visitors', 'unique view'

