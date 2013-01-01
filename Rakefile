#!/usr/bin/env rake

ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'

Dir['./lib/tasks/**/*.rake'].each { |f| load f }

task :default => :test
task :test do
  exec "rake features"
end
