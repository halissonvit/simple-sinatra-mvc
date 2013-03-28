ENV['RACK_ENV'] ||= 'development'

require 'bundler'
require 'sinatra'
require 'sprockets'
require 'pg'
require 'friendly_id'
require 'active_record'
require 'active_support'
require 'sinatra/partial'
require 'sinatra/flash'

$env = ENV['RACK_ENV']
Bundler.require :default, $env.to_sym
