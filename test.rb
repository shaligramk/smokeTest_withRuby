require 'rubygems'
require 'watir-webdriver'
# require 'phantomjs'

browser = Watir::Browser.new :chrome

browser.goto "https://stage-demo.chaucercloud.com"
puts "Page title is #{browser.title}"

browser.text_field(:id => 'username').set 'admin'
browser.text_field(:id => 'password').set 'books'
browser.button(:class => 'btn-default').click

puts "Page title is #{browser.title}"
browser.close