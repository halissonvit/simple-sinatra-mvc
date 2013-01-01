require 'rubygems'
require 'bundler'

$env = ENV['RACK_ENV'] ||= 'development'
Bundler.require :default, $env.to_sym

require 'sinatra/base'
require './main'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  run environment
end

map '/' do
  run Sinatra::Application
end
