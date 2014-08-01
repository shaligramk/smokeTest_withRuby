# Author: Shawn Shaligram
# Last Updated: July 30, 2014
# Regression Test with Watir 

require 'rubygems'
require 'test/unit'
require 'watir-webdriver'

#Chrome browser instantiation
browser = Watir::Browser.new :chrome

#Loading the Staging Environment
browser.goto "https://stage-demo.chaucercloud.com"

if browser.title.include?("Chaucer")
    puts "Login Form Found!"
  else
    puts "Test failed!"
  end

#Username and password input fields identification and data entered
browser.text_field(:id => 'username').set 'admin'
browser.text_field(:id => 'password').set 'books'
browser.button(:class => 'btn-default').click

expect(browser.title.include?("Projects")).to be_true

if browser.title.include?("Projects")
    puts "On the Project Tracker!"
  else
    puts "Test failed!"
end

browser.button(:class => 'newProject').click

if browser.text.include?("Start a New Book Project")
    puts "Create New Project Page!"
  else
    puts "Test failed!"
end

browser.checkbox(:id => 'bookTypeSelection8').set 
browser.select_list(:name => 'layoutOption').select 'Import Existing Layout'

browser.text_field(:id => 'jform_publication_name').set 'Test with Watir'
browser.text_field(:id => 'jform_publication_publisher').set 'Test'
browser.text_field(:id => 'jform_publication_authors').set 'Test Author'

browser.link(:id => 'bookTabAhrefID_8').click

browser.file_field(:class, "theFileInput").set("/Users/shawn/Desktop/FE_Automation/watir/test_data/cover_pdf.png")

# # browser.file_field(:id, "upload8_browse").set("/Users/shawn/Desktop/FE_Automation/watir/gettysburg.pdf")

# browser.driver.manage.timeouts.implicit_wait = 3 #3 seconds
# browser.button(:id => 'saveProjectBtn').click


#Quitting the browser
browser.close