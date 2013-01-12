ENV['RACK_ENV'] ||= 'development'

require 'bundler'
require 'sinatra'

$env = ENV['RACK_ENV']
Bundler.require :default, $env.to_sym
