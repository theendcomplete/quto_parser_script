# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'optparse'
require './lib/request_maker'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: parser.rb [options]'

  opts.on('-h', '--headless', 'Run in headless mode') do |v|
    options[:headless] = v
  end
  opts.on('-d', '--debug', 'Enable debug output') do |v|
    options[:debug] = v
  end
  opts.on('-p', '--proxy', 'Specify proxy server') do |v|
    options[:proxy] = v
  end
end.parse!

p options
p ARGV

search_result = RequestMaker.new(
  brand = ARGV[0], model = ARGV[1],
  headless: options[:headless],
  proxy: options[:proxy],
  debug: options[:debug]
).search

puts search_result
