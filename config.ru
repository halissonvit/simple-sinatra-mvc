require './dependencies'
require './main'

map '/assets' do
  environment = Sprockets::Environment.new
  Main.assets_paths.each do |path|
    environment.append_path "app/assets/#{path}"
  end
  run environment
end

map '/' do
  run Sinatra::Application
end
