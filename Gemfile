source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'json'

# mongoid
gem 'bson_ext'
gem 'mongoid'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'kaminari'

# image uploading
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick'

# haml & sass
gem 'haml'
gem 'formtastic', '~> 2.2.0'

# auth
gem 'devise'

# api
gem 'rabl'
gem 'yajl-ruby'

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'debugger'
  gem 'unicorn'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass',      '0.12.alpha.1'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem "vcr", "~> 2.1"
  gem "mocha", "~> 0.10"
  gem "factory_girl_rails", "~> 1.7", require: false
  gem "database_cleaner", "~> 0.7"
end

group :development, :test do
  gem "rspec-rails", "~> 2.8"
  gem "capybara"
  gem "capybara-webkit"
  gem "debugger"
end
