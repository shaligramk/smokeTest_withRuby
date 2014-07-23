require 'rubygems'
require 'watir-webdriver'

b = Watir::Browser.new :chrome

b.goto 'https://stage-demo.chaucercloud.com'

b.text_field(:id => 'username').set 'metrodigi'
b.text_field(:id => 'password').set 'sk00by'
b.button(:name => 'button').click

puts "Page title is #{driver.title}"
b.close
