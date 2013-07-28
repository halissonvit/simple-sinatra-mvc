ENV['RACK_ENV'] ||= 'development'

%w(
  sinatra
  sprockets
  pg
  friendly_id
  active_record
  active_support
  sinatra/partial
  sinatra/flash
).each { |d| require d }

$env = ENV['RACK_ENV']
Bundler.require :default, $env.to_sym
