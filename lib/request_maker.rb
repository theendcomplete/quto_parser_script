# frozen_string_literal: true

require 'watir'
require 'webdrivers'
require 'headless'

# this class makes search request to quto.ru
class RequestMaker
  attr_reader :url
  attr_accessor :brand
  attr_accessor :model

  def initialize(brand, model, headless = true, chrome_args = nil)
    if [brand, model].include? nil
      raise ArgumentError, message: 'NOT ENOUGH PARAMETERS'
    end

    @url = 'https://quto.ru'
    @brand = brand
    @model = model
    @headless = headless
    @args = chrome_args || ['--headless', '--window-size=1200x600',
                            '--no-gpu ', '--no-sandbox',
                            ' --disable-setuid-sandbox', '--dump-dom']
  end

  def search
    if @headless
      headless = Headless.new
      headless.start
    end

    Webdrivers.logger.level = :DEBUG

    proxy = {
      http: 'my.proxy.com:8080',
      ssl: 'my.proxy.com:8080'
    }
    # browser = Watir::Browser.new(:chrome, proxy: proxy,
    #                             chromeOptions: { args: @args })
    browser = Watir::Browser.new(:chrome,
                                 chromeOptions: { args: @args })

    browser.goto(@url)
    browser.element(id: 'pseudo_link_inventory_trade').click
    browser.select_list(id: 'car_brand_offer_trade_in').select @brand
    browser.select_list(id: 'car_model_offer_trade_in').select @model
    browser.element(xpath: '/html/body/div[2]/div/div[4]/div[5]/div[1]/div[1]/div/div[1]/div/div/div/div[2]/div[1]/form[2]/div[2]/div/div/div/input').click

    puts browser.html
    browser.close
    headless.destroy if @headless
  end
end
