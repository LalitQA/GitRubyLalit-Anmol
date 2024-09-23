# env.rb or hooks.rb
require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require 'cucumber'
require 'report_builder'

# Ensure directories exist
Dir.mkdir('reports') unless Dir.exist?('reports')
Dir.mkdir('reports/screenshots') unless Dir.exist?('reports/screenshots')


Before do
  # Local execution only
  @browser = Selenium::WebDriver.for :chrome
  @browser.manage.window.maximize
  # @browser.navigate.to "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
  @login_page = LoginPage.new(@browser)
end

After do |scenario|
  # Capture screenshot if the scenario failed
  if scenario.failed?
    screenshot_path = "reports/screenshots/#{sanitize_filename(scenario.name)}.png"
    @browser.save_screenshot(screenshot_path)
    attach(File.open(screenshot_path), 'image/png')
  end
  @browser.quit
end

def sanitize_filename(name)
  # Helper method to sanitize the filename
  name.gsub(/\s+/, '_').gsub(/[^0-9A-Za-z_]/, '')
end

at_exit do
  # Generate the JSON report from Cucumber
  if File.exist?('reports/cucumber_report.json')
    ReportBuilder.configure do |config|
      config.input_path = 'reports/cucumber_report.json'
      config.report_path = 'reports/cucumber_report'
      config.report_types = [:html]
      config.report_title = 'Cucumber Test Report'
      config.color = 'indigo'
      config.additional_info = { 'Browser' => 'Chrome' }
    end
    ReportBuilder.build_report
  else
    puts "Cucumber JSON report file not found. Ensure that Cucumber is configured to generate JSON reports."
  end
end


# require 'rubygems'
# require 'watir'
# require 'rspec'
# require 'cucumber'
# require 'report_builder'
#
# # Ensure directories exist
# Dir.mkdir('reports') unless Dir.exist?('reports')
# Dir.mkdir('reports/screenshots') unless Dir.exist?('reports/screenshots')
#
# Before do
#   # Local execution only
#   $browser = Watir::Browser.new :chrome
#   $browser.driver.manage.window.maximize
#   $browser.goto "https://demoqa.com/webtables"
# end
#
# After do |scenario|
#   # Capture screenshot if the scenario failed
#   if scenario.failed?
#     screenshot_path = "reports/screenshots/#{sanitize_filename(scenario.name)}.png"
#     $browser.screenshot.save(screenshot_path)
#     # Attaching the screenshot for Cucumber 3+ compatibility
#     attach(File.open(screenshot_path), 'image/png')
#   end
#   $browser.close
# end
#
# def sanitize_filename(name)
#   # Helper method to sanitize the filename
#   name.gsub(/\s+/, '_').gsub(/[^0-9A-Za-z_]/, '')
# end
#
# at_exit do
#   # Generate the JSON report from Cucumber
#   # Check if the JSON file exists
#   if File.exist?('reports/cucumber_report.json')
#     ReportBuilder.configure do |config|
#       config.input_path = 'reports/cucumber_report.json'
#       config.report_path = 'reports/cucumber_report'
#       config.report_types = [:html]
#       config.report_title = 'Cucumber Test Report'
#       config.color = 'indigo'
#       config.additional_info = { 'Browser' => 'Chrome' }
#     end
#     ReportBuilder.build_report
#   else
#     puts "Cucumber JSON report file not found. Ensure that Cucumber is configured to generate JSON reports."
#   end
# end
#
#
# # require 'rubygems'
# # require 'watir'
# # require 'rspec'
# # require 'cucumber'
# # require 'report_builder'
# #
# # # Ensure directories exist
# # Dir.mkdir('reports') unless Dir.exist?('reports')
# # Dir.mkdir('reports/screenshots') unless Dir.exist?('reports/screenshots')
# #
# # Before do
# #   # Local execution only
# #   $browser = Watir::Browser.new :chrome
# #   $browser.driver.manage.window.maximize
# #   $browser.goto "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
# # end
# #
# # After do |scenario|
# #   # Capture screenshot if the scenario failed
# #   if scenario.failed?
# #     screenshot_path = "reports/screenshots/#{scenario.name.gsub(/\s+/, '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
# #     $browser.screenshot.save(screenshot_path)
# #     embed(screenshot_path, 'image/png') # Embeds the screenshot in the report
# #   end
# #   $browser.close
# # end
# #
# # at_exit do
# #   # Generate the JSON report from Cucumber
# #   # Check if the JSON file exists
# #   if File.exist?('reports/cucumber_report.json')
# #     ReportBuilder.configure do |config|
# #       config.input_path = 'reports/cucumber_report.json'
# #       config.report_path = 'reports/cucumber_report'
# #       config.report_types = [:html]
# #       config.report_title = 'Cucumber Test Report'
# #       config.color = 'indigo'
# #       config.additional_info = { 'Browser' => 'Chrome' }
# #     end
# #     ReportBuilder.build_report
# #   else
# #     puts "Cucumber JSON report file not found. Ensure that Cucumber is configured to generate JSON reports."
# #   end
# # end
#
#
#
# # require 'rubygems'
# # require 'watir'
# # require 'rspec'
# # require 'cucumber'
# # require 'report_builder'
# #
# # # Ensure directories exist
# # Dir.mkdir('reports') unless Dir.exist?('reports')
# # Dir.mkdir('reports/screenshots') unless Dir.exist?('reports/screenshots')
# #
# # Before do
# #   # Local execution only
# #   $browser = Watir::Browser.new :chrome
# #   $browser.driver.manage.window.maximize
# #   $browser.goto "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
# # end
# #
# # After do |scenario|
# #   # Capture screenshot if the scenario failed
# #   if scenario.failed?
# #     screenshot_path = "reports/screenshots/#{scenario.name.gsub(/\s+/, '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
# #     $browser.screenshot.save(screenshot_path)
# #   end
# #   $browser.close
# # end
# #
# # at_exit do
# #   # Check if the JSON file exists
# #   if File.exist?('reports/cucumber_report.json')
# #     ReportBuilder.configure do |config|
# #       config.input_path = 'reports/cucumber_report.json'
# #       config.report_path = 'reports/cucumber_report'
# #       config.report_types = [:html]
# #       config.report_title = 'Cucumber Test Report'
# #       config.color = 'indigo'
# #       config.additional_info = { 'Browser' => 'Chrome' }
# #     end
# #     ReportBuilder.build_report
# #   else
# #     puts "Cucumber JSON report file not found. Ensure that Cucumber is configured to generate JSON reports."
# #   end
# # end
#
#
#
#
# # require 'rubygems'
# # require 'watir'
# # require 'rspec'
# # require 'cucumber'
# #
# # Before do |scenario|
# #   # Local execution only
# #   $browser = Watir::Browser.new :chrome
# #   $browser.driver.manage.window.maximize
# #   $browser.goto "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
# # end
# #
# # After do |scenario|
# #   $browser.close
# # end
#
# ################################################################
# # require 'rubygems'
# # require "watir"
# # require "rspec"
# #
# #
# # Before do |scenario|
# #   # cloud execution
# #   username = "${LAMBDATEST_USERNAME}"
# #   accessToken = "${LAMBDATEST_ACCESS_KEY}"
# #   gridUrl = "hub.lambdatest.com/wd/hub"
# #
# #   # # gridUrl =  "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
# #   # $browser.goto "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
# #
# #   options = Selenium::WebDriver::Options.chrome
# #   options.browser_version = 'latest'
# #   options.platform_name = 'Windows 10'
# #   cloud_options = {}
# #   cloud_options[:build] = "Cucumber POM tests"
# #   cloud_options[:name] = "Ruby Cucumber POM tests"
# #   options.add_option('LT:Options', cloud_options)
# #   # url = "https://" + username + ":" + accessToken + "@" + gridUrl
# #   url = "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
# #
# #   $browser = Watir::Browser.new(:chrome ,options: options ,url: url)
# #
# #
# #   # Local execution.
# #   $browser = Watir::Browser.new :firefox
# #   $browser.driver.manage.window.maximize
# # end
# #
# #
# # After do |scenario|
# #   $browser.close
# # end