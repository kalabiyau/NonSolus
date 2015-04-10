source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '~> 4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'less-rails'
gem 'slim'
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'ruby-saml', '~> 0.9'
gem 'draper'
gem 'responders'
gem 'sidekiq'
gem 'whenever'
gem 'versionist'
gem 'pundit'
gem 'jquery-turbolinks'

group :development do
  gem 'quiet_assets'
  gem 'mina'
  gem 'mina-unicorn', require: false
  gem 'mina-sidekiq', require: false
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'letter_opener'
  gem 'launchy'
  gem 'awesome_print'
end

group :test do
  gem 'shoulda'
  gem 'rspec-rails'
  gem 'simplecov', '~> 0.9', require: false
  gem 'capybara'
  gem 'poltergeist', require: false
  gem 'database_cleaner'
  gem 'rack_session_access'
  gem 'rspec-collection_matchers'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

