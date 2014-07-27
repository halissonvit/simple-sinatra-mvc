ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'

%w(
active_record
active_support
pg
sinatra
sinatra/asset_pipeline
sinatra/flash
sinatra/partial
sinatra/static_assets
slim
sprockets
sprockets-helpers
sprockets-sass
).each { |d| require d }

$env = ENV['RACK_ENV']
# Bundler.require :default, $env.to_sym
# You probably should not do that. See http://myronmars.to/n/dev-blog/2012/12/5-reasons-to-avoid-bundler-require
