# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require './lib/request_maker'

search_result = RequestMaker.new(ARGV[0], ARGV[1]).search

puts search_result
