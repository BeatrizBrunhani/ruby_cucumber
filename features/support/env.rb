require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'rspec'
require 'selenium-webdriver'

CONFIG = YAML.load_file("features/support/config/environments/#{ENV['ENV_TYPE']}.yaml")
EL = YAML.load_file('features/support/config/elements.yaml')

@browser = ENV['BROWSER']

Capybara.configure do |c|
  case @browser
  when 'chrome'
    @driver = :selenium_chrome
  when 'chrome_headless'
    @driver = :selenium_chrome_headless
  end
  
  c.default_driver = @driver
  c.app_host = CONFIG['URL_SP3']
  c.default_max_wait_time = 10
end
