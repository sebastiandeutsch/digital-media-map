source "https://rubygems.org"

gem "rails", "3.2.3"
gem "json"
gem "unicorn"

# search
gem 'meta_search'

# image uploading
gem "carrierwave"
gem "mini_magick"

# haml & sass
gem "haml"
gem "formtastic", "~> 2.1.1"

# auth
gem "devise"

# api
gem "rabl"
gem "yajl-ruby"

# admin
gem 'activeadmin', :git => 'https://github.com/gregbell/active_admin.git'

gem "jquery-rails"

group :assets do
  gem "sass-rails",   "~> 3.2.5"
  gem "compass-rails", "~> 1.0.1"
  gem "coffee-rails", "~> 3.2.1"
  gem "therubyracer", :platform => :ruby
  gem "uglifier", ">= 1.0.3"
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem "rspec-rails", "~> 2.8"
  gem "capybara"
  gem "capybara-webkit"
  gem "debugger"
end

group :development do
  gem 'quiet_assets'
  gem "heroku", "~>2.17.0"
  gem "taps"
  gem 'sqlite3'
end

group :test do
  gem "vcr", "~> 2.1"
  gem "webmock", "~> 1.8"
  gem "mocha", "~> 0.10"
  gem "factory_girl_rails", "~> 1.7", require: false
  gem "database_cleaner", "~> 0.7"
  gem "shoulda-matchers"
end
