require './dependencies'

class Main < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :sprockets, Sprockets::Environment.new(root)
  set :digest_assets, false
  set :assets_precompile, [/^([a-zA-Z0-9_-]+\/)?([a-zA-Z0-9_-]+\/)?(?!_)([a-zA-Z0-9_-]+.\w+)$/]
  set :assets_prefix, '/assets'
  set :assets_protocol, :http
  set :assets_css_compressor, :yui
  set :assets_js_compressor, :uglifier
  set :assets_compress, true

  Slim::Engine.default_options[:disable_escape] = true

  YAML::load(File.open('config/database.yml'))[$env].symbolize_keys.each do |key, value|
    set key, value
  end

  configure $env.to_sym do
    enable :partial_underscores, :raise_errors, :sessions, :logging

    ActiveRecord::Base.establish_connection(adapter: settings.adapter,
                                            username: settings.username,
                                            password: settings.password,
                                            host: settings.host,
                                            database: settings.database)
    sprockets.append_path File.join(root, "assets", "stylesheets")
    sprockets.append_path File.join(root, "assets", "javascripts")
    sprockets.append_path File.join(root, "assets", "images")

    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix = assets_prefix
      config.digest = digest_assets
      config.public_path = public_folder
    end

  end


  (Dir["./app/helpers/*.rb"].sort + Dir["./app/concerns/*.rb"].sort + Dir["./app/models/*.rb"].sort  + Dir["./app/controllers/*/*.rb"].sort).each do |file|
    require file
  end

  register Sinatra::Partial
  register Sinatra::Pages

end
