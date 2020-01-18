# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require './lib/request_maker'

p ARGV
#search_result = RequestMaker.new('Opel', 'Astra').search
search_result = RequestMaker.new(ARGV[0], ARGV[1]).search
# rm = RequestMaker.new('Opel', nil)

puts search_result
