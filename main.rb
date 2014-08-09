# Author: Shawn Shaligram
# Last Updated: August 8, 2014
# Regression Test with Selenium-Webdriver 

require 'rspec'
require 'selenium-webdriver'

describe "Chaucer Login" do
	it "should display login page" do
		@browser = Selenium::WebDriver.for :phantomjs
		@browser.manage.window.resize_to(1440, 850) # set browser size.
		@browser.get "https://stage-demo.chaucercloud.com"
		expect(@browser.title).to eq("Chaucer")
		puts @browser.title
		@browser.find_element(:id => 'username').send_keys 'admin'
		@browser.find_element(:id => 'password').send_keys 'books'
		@button = @browser.find_element(:class, 'btn-default')
		@button.click
	end

end