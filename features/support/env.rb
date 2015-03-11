ENV['RACK_ENV'] = 'test'
app_file = File.join(File.dirname(__FILE__), *%w[.. .. main.rb])
require app_file
Sinatra::Application.app_file = app_file

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Main

class MyWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

  def app
    Capybara.app
  end
end

World{ MyWorld.new }
