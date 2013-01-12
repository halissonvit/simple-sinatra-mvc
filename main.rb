require './dependencies'

class Main < Sinatra::Base

  YAML::load(File.open('config/database.yml'))[$env].symbolize_keys.each do |key, value|
    set key, value
  end

  configure $env.to_sym do
    enable :partial_underscores, :raise_errors, :sessions, :logging

    ActiveRecord::Base.establish_connection(:adapter => settings.adapter,
                                            :username => settings.username,
                                            :password => settings.password,
                                            :host => settings.host,
                                            :database => settings.database)
  end

  (Dir["./app/helpers/*.rb"].sort + Dir["./app/lib/*.rb"].sort + Dir["./app/controllers/*/*.rb"].sort).each do |file|
    require file
  end

  register Sinatra::Partial
  register Sinatra::Pages

end
