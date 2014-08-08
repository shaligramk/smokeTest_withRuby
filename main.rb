# Author: Shawn Shaligram
# Last Updated: August 7, 2014
# Regression Test with Watir 

require 'rspec'
require 'watir-webdriver'

describe "Chaucer Login" do
	it "should display login page" do
		@browser = Watir::Browser.new :chrome
		@browser.goto("https://stage-demo.chaucercloud.com")
		@browser.text_field(:id => 'username').set 'admin'
		@browser.text_field(:id => 'password').set 'books'
		@browser.title.should == "Chaucer"
		@browser.button(:class => 'btn-default').click
		@browser.title.should == "Projects"
		@browser.close
	end

end






# browser.button(:class => 'newProject').click

# if browser.text.include?("Start a New Book Project")
# 	puts "Create New Project Page!"
# else
# 	puts "Test failed!"
# end

# browser.checkbox(:id => 'bookTypeSelection8').set 
# browser.select_list(:name => 'layoutOption').select 'Import Existing Layout'

# browser.text_field(:id => 'jform_publication_name').set 'Test with Watir'
# browser.text_field(:id => 'jform_publication_publisher').set 'Test'
# browser.text_field(:id => 'jform_publication_authors').set 'Test Author'

# browser.link(:id => 'bookTabAhrefID_8').click

# browser.file_field(:class, "theFileInput").set("/Users/shawn/Desktop/FE_Automation/watir/test_data/cover_pdf.png")

# # # browser.file_field(:id, "upload8_browse").set("/Users/shawn/Desktop/FE_Automation/watir/gettysburg.pdf")

# # browser.driver.manage.timeouts.implicit_wait = 3 #3 seconds
# # browser.button(:id => 'saveProjectBtn').click


# #Quitting the browser
# browser.close