# Author: Shawn Shaligram
# Last Updated: August 8, 2014
# Smoke Test with Selenium-Webdriver 

require "selenium-webdriver"

browser = Selenium::WebDriver.for :chrome
browser.manage.window.maximize
browser.navigate.to "https://stage-demo.chaucercloud.com"
puts browser.title

#Typing the UserName
UserName = browser.find_element(:id, "username")
UserName.send_keys "admin"

#Typing the Password
UserName = browser.find_element(:id, "password")
UserName.send_keys "books"

#Clicking on the Submit Button
SubmitButton = browser.find_element(:class, "btn-default")
SubmitButton.click

#Asserting whether the login has been succesfull 
SuccessMessage = browser.find_element(:css, "h1")
"Project Tracker".eql? SuccessMessage.text
puts "Login Succesfull. Currently on the Project Tracker"

puts browser.title

#Clicking on the New Project Button
NewProject = browser.find_element(:class, "newProject")
NewProject.click

#Asserting whether the login has been succesfull 
UploadProject = browser.find_element(:css, "h1")
"Start a New Book Project".eql? UploadProject.text
puts "Upload Project into a Layout Source Type"

puts browser.title

#Click on Reflowable Layout checkbox
reflowableLayout = browser.find_element(:id, "bookTypeSelection8")
reflowableLayout.click

#Select Dropdown Value "Import Existing Layout"
#browser.find_element(:id, "bookTypeSelection8").find_element(:css,"option[value='Import Existing Layout']").click

#Entering the Publication Name
publicationName = browser.find_element(:id, "jform_publication_name")
publicationName.send_keys "Pages From Gettysburg"

#Entering the Author Name
publicationAuthor = browser.find_element(:id, "jform_publication_authors")
publicationAuthor.send_keys "Test Author"

#Entering the Publisher Name
publisherName = browser.find_element(:id, "jform_publication_publisher")
publisherName.send_keys "Test Publisher"

#Quitting the browser
browser.quit

