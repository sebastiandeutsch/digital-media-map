ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "factory_girl_rails"

RSpec.configure do |config|
  config.mock_with :mocha
  config.extend VCR::RSpec::Macros

  config.before :suite do
    #DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(type: :request) { DatabaseCleaner.strategy = :truncation }
  config.before                 { DatabaseCleaner.start }
  config.after                  { DatabaseCleaner.clean }
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
