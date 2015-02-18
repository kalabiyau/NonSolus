require 'simplecov'
require 'factory_girl_rails'

SimpleCov.start 'rails'

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random

end
