require 'nokogiri'

class ResponseParser
  attr_accessor :html

  def initialize(params)
    @html = params[:html]
  end

  def run

  end

end
