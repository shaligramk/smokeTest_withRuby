# Author: Shawn Shaligram
# Last Updated: July 28, 2014
# Regression Test with Watir 

require 'rubygems'
require 'watir-webdriver'

#Chrome browser instantiation
browser = Watir::Browser.new :chrome

#Loading the Staging Environment
browser.goto "https://stage-demo.chaucercloud.com"
puts "Page title is #{browser.title}"

#Username and password input fields identification and data entered
browser.text_field(:id => 'username').set 'admin'
browser.text_field(:id => 'password').set 'books'
browser.button(:class => 'btn-default').click

puts "Page title is #{browser.title}"
browser.screenshot.save 'project_tracker.png'

#Quitting the browser
browser.close