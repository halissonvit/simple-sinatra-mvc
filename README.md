[![Dependency Status](https://gemnasium.com/katgironpe/simple-sinatra-mvc.svg)](https://gemnasium.com/katgironpe/simple-sinatra-mvc)

# Simple Sinatra MVC Template

## What's included
* Sprockets
* HAML
* SASS
* PostgreSQL gem (pg)
* CoffeeScript (coffee-script)
* Pony
* Rubocop
* A lot more


``` bash
$ git clone --depth 1 git://github.com/katgironpe/simple-sinatra-mvc.git myapp
$ rm -r myapp/.git && rm myapp/README.md
```


## Use bundler to install gems
``` bash
$ bundle install
```

## Start the app

``` bash
$ rackup
```

or

``` bash
$ shotgun config.ru
```

## Unit and acceptance tests

Ruby 1.9 includes minitest so it just makes test to use minitest instead of any other framework.
It works and it is simple. Use:

``` bash
$ rake test
```

For acceptance tests, some example is also provided. Use:

```bash
cucumber
```

Or use the rake task (`lib/tasks/test.rake`):

```
rake features
```

## Configuration

``` bash
$ cp config/database.yml.example config/database.yml
```

Update database.yml


By default, we use PostgreSQL.

To install PostgreSQL on a Mac, you might need homebrew.

```bash
$ brew install postgresql
```

Creating a database should be as simple as:

```bash
$ createdb database_name
```

You may have to update `config.ru` and files on config directory as needed.

## Rake Tasks

``` bash
$ rake -T
```

rake assets:clean         # Clean assets
rake assets:precompile    # Precompile assets
rake db:create_migration  # create an ActiveRecord migration
rake db:migrate           # migrate the database (use version with VERSION=n)
rake db:rollback          # roll back the migration (use steps with STEP=n)
rake db:schema:dump       # dump schema into file
rake db:schema:load       # load schema into database
rake features             # Run Cucumber features

To create a database for a specific environment, do:

``` bash
$ rake db:create RACK_ENV=production
```

The default environment is "development"

To create a migration file called "create_pages", do:

``` bash
$ rake db:create_migration NAME=create_pages
```

To do migration:

``` bash
$ rake db:migrate RACK_ENV=production
```

To rollback:

``` bash
$ rake db:rollback RACK_ENV=production
```

The default is development so this should just work:

``` bash
$ rake db:migrate
```

To start the application, use `shotgun`:

```bash
$ bundle exec shotgun config.ru
```

## Asset Pipeline

Yes, it is very easy to get asset pipeline working for Sinatra. By default, we have the following supported directories:

* app/assets/javascripts
* app/assets/stylesheets
* app/assets/images

You may append more paths as needed by adding directory name to the `assets_paths` array.

```ruby
set :assets_paths, %w{fonts images javascripts stylesheets}
```

To precompile assets, simply use the rake task for it either on your deployment file or locally:

```bash
rake assets:precompile RACK_ENV=production
```

You have to use the asset helpers provided by `sprocket-helpers` gem.


## Caching Assets

We use memcached to speed up loading of assets and storing them whether they're compressed or not.
It is highly recommended to enable this by default in production.


To install memcached:

```bash
brew install memcached
```

## Performance Monitoring

### Newrelic RPM

I found a need to add this all the time. You will just need to download the `newrelic.yml` file.
