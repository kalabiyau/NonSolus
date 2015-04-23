ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/poltergeist'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'shoulda/matchers'
require 'pundit/rspec'
require 'rack_session_access/capybara'

# Schema and seeds handling
ActiveRecord::Schema.verbose = false
ActiveRecord::Migration.maintain_test_schema!

Capybara.server do |app, port|
  require 'rack/handler/thin'
  Rack::Handler::Thin.run(app, Port: port)
end

# This is debug bundle. Use when more details needed
# Rails.logger.level = 0
# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(app, debug: true, js_errors: true)
# end

Capybara.configure do |config|
  config.javascript_driver = :poltergeist
  config.default_wait_time = 5
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
  config.default_selector = :css
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

DatabaseCleaner.clean_with(:truncation)

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
  config.include FeatureHelpers, type: :feature

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.cleaning do
      FactoryGirl.lint
    end
    load Rails.root.join 'db', 'seeds.rb'
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end
