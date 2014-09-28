# Author: Shawn Shaligram
# Last Updated: September 28, 2014
# Smoke Test with WebDriver, YAML, Rspec and Ruby

require "yaml"
require "selenium-webdriver"
require "rspec/expectations"


def setup
  $env= ARGV[0]
  # @driver = Selenium::WebDriver.for :chrome
  config = YAML.load_file("config.yml")
  @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:8001'
  @base_url = "https://dev-102testenterprise.chaucercloud.com"
  @driver.manage.delete_all_cookies
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
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
    puts "Page title is #{@driver.title}"
    @driver.save_screenshot('screenshots/log_in.png')
    @driver.find_element(:id, "username").clear
    @driver.find_element(:id, "username").send_keys "sshaligram@metrodigi.com"
    @driver.find_element(:id, "password").clear
    @driver.find_element(:id, "password").send_keys "C4nt3rbury"
    @driver.find_element(:class, "ladda-button").click
    element = @wait.until {@driver.find_element(:class => "newProject") }
    puts "Page title is #{@driver.title}"
end
