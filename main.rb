# Author: Shawn Shaligram
# Last Updated: September 20, 2014
# Smoke Test with Selenium-Webdriver using Ruby Bindings

require "selenium-webdriver"
require "rspec/expectations"

def setup
  # @driver = Selenium::WebDriver.for :chrome
  @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:8001'
  @base_url = "https://enterprise.chaucercloud.com"
  @driver.manage.timeouts.implicit_wait = 5
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do 
    @driver.get(@base_url)
    puts @driver.title
    @driver.find_element(:id, "username").clear
    @driver.find_element(:id, "username").send_keys ""
    @driver.find_element(:id, "password").clear
    @driver.find_element(:id, "password").send_keys ""
    @driver.find_element(:class, "ladda-button").click
   	puts @driver.title
end
