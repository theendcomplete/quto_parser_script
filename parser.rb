# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'optparse'
require './lib/request_maker'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: parser.rb Brand Model [options]'

  opts.on('-b', '--background', 'Run browser in background ("headless mode")') do |v|
    options[:headless] = v
  end
  opts.on('-d', '--debug', 'Enable debug output') do |v|
    options[:debug] = v
  end
  opts.on('-p', '--proxy [TYPE]', String, 'Specify proxy server') do |v|
    options[:proxy] = v
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end.parse!

if options[:debug]
  puts 'arguments: '
  p ARGV
  puts 'options: '
  p options
end

search_result = RequestMaker.new(
  brand = ARGV[0], model = ARGV[1],
  headless: options[:headless],
  proxy: options[:proxy],
  debug: options[:debug]
).search

puts search_result
