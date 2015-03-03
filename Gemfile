source 'https://rubygems.org'
ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'less-rails'
gem 'slim'
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'ruby-saml', '~> 0.9'
gem 'draper'
gem 'responders'
gem 'sidekiq'
gem 'whenever'

group :development do
  gem 'quiet_assets'
  gem 'mina'
  gem 'mina-unicorn', require: false
  gem 'mina-sidekiq', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'ffaker'
  # Use sqlite3 as the database for Active Record
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
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

