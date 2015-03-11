#!/usr/bin/env rake

require './dependencies'

Dir['./lib/tasks/*.rake'].each { |f| load f }

task :test => [:features, :spec]
task default: :test