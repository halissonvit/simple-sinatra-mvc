require './dependencies'
require './main'

map '/assets' do
  environment = Main.sprockets
  run environment
end

map '/' do
  run Sinatra::Application
end
