Given(/^I am on the Example page$/) do
  # @browser.navigate.to "https://demoqa.com/webtables"
  # @browser.navigate.to"https://demoqa.com/webtables"
end

# When(/^I scroll to the user with first name "([^"]*)"$/) do |arg|
#   When('I scroll to the user with first name {string}') do |first_name|
#     @login_page.scroll_to_user(first_name)
#   end
# end
When('I scroll to the user with first name {string}') do |first_name|
  @login_page.scroll_to_user(first_name)
end


Then('I click the delete button for the user {string}') do |first_name|
  @login_page.delete_button(first_name).click
  sleep(5)
end


# Given(/^Ecommerce webpage Login Page loads$/) do
#   @browser.navigate.to "https://demoqa.com/webtables"
# end

# When Click on delete button

# When(/^Click on delete button$/) do
#   @login_page.login_button1.click
# end

#
# When(/^Correct Username and Password Should Login Successfully (.*) (.*)$/) do |username, password|
#   puts "------"
#   puts username
#   @login_page.username_textbox.send_keys(username)
#   sleep(1)
#   @login_page.password_textbox.send_keys(password)
#   sleep(1)
# end
#
# Then(/^Click login button$/) do
#   @login_page.login_button.click
# end
#
#

