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
end.parse!

p options
p ARGV

search_result = RequestMaker.new(ARGV[0], ARGV[1], options[:headless]).search

puts search_result
