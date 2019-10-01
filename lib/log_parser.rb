# frozen_string_literal: true

require 'pathname'

# Log Simple log parser, returns raw unformated lists
class LogParser
  attr_reader :log_file, :data

  def initialize(log_file)
    @log_file = Pathname.new log_file
    raise ArgumentError, "Log file #{log_file} not found" unless @log_file.exist?
    parse
  end

  def most_viewed_pages
    sort_filter { |ips_hash| ips_hash.values.sum }
  end

  def most_unique_visitors
    sort_filter { |ips_hash| ips_hash.length }
  end

  private

  def parse
    @data = {}

    @log_file.each_line do |line|
      parse_line line
    end
  end

  def parse_line(line)
    path, ip = line.chomp.split(' ', 2)
    return unless path.start_with?('/') && ip_valid?(ip)

    location = (@data[path] ||= {})
    location[ip] ||= 0
    location[ip]  += 1
  end

  def ip_valid?(ip)
    parts = ip.to_s.split('.')
    parts.length == 4
  end

  def sort_filter
    @data
      .inject([]) { |total, (page, ips)| total + [[page, yield(ips)]] }
      .sort { |a, b| b[1] <=> a[1] }
  end
end
