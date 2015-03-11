ENV['RACK_ENV'] = "test"

require File.expand_path(File.dirname(__FILE__) + "/../main.rb")

require 'capybara'
require 'capybara/dsl'

include Rack::Test::Methods # It contain different method like get,  last_response etc which

def app
  Main # It is must and tell rspec that test it running is for sinatra
end

RSpec.configure do |conf|
  conf.include Capybara::DSL
end
