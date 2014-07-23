require "selenium-webdriver"

#Chrome Browser Instantiation
driver = Selenium::WebDriver.for :Chrome

#Loading the appropriate URL
driver.navigate.to "https://stage-demo.chaucercloud.com "

puts "Page title is #{driver.title}"

# Enter data into the login form
UserName = driver.find_element(:id, "username")
UserName.send_keys "metrodigi"

Password = driver.find_element(:id, "password")
Password.send_keys "sk00by"

#Clicking on the Submit Button
SubmitButton = driver.find_element(:tag_name, "button")
SubmitButton.click

puts "Page title is #{driver.title}"

#Quitting the browser
driver.quit