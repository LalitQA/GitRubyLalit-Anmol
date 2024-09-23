# login_page.rb
class LoginPage
  def initialize(browser)
    @browser = browser
  end

  def username_link
    @browser.find_element(link_text: "Forgotten Password")
  end

  def username_textbox
    @browser.find_element(id: "input-email")
  end

  def password_textbox
    @browser.find_element(id: "input-password")
  end



  def delete_button(first_name)
    @browser.find_element(xpath: "//div[text()='#{first_name}']/ancestor::div[@role='row']//span[@title='Delete']")
  end

  # def scroll_to_user(first_name)
  #   user_element = @browser.find_element(:xpath, "//div[normalize-space()='Alden']")
  #   @browser.execute_script('arguments[0].scrollIntoView(true);', user_element)
  # end
  def scroll_to_user(first_name)
    user_element = @browser.find_element(:xpath, "//div[normalize-space()='#{first_name}']")
    #//div[normalize-space()='Alden']
    @browser.execute_script('arguments[0].scrollIntoView(true);', user_element)
  end

  def account_header
    @browser.find_element(link_text: "Edit Account")
  end
end


# class LoginPage
#   def username_link
#     $browser.link(text: "Forgotten Password")
#   end
#
#
#   def username_textbox
#     $browser.input(id: "input-email")
#   end
#
#
#   def password_textbox
#     $browser.input(id: "input-password")
#   end
#
#
#   def login_button
#     $browser.button(value: "Login")
#   end
#
#
#
#
#   def account_header
#     $browser.link(text: "Edit Account")
#   end
# end