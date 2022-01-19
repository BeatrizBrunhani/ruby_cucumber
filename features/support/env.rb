require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'report_builder'
require 'rspec'
require 'selenium-webdriver'

require_relative 'helpers'

#World(Helpers) # deixando o arquivo helpers visivel para todos, precisa dar o include no arquivo helpers include Capybara::DSL
include Helpers # deixando o arquivo helpers visivel para todos, nao preciso dar o include no arquivo helpers ex include Capybara::DSL

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
