require 'simplecov'
SimpleCov.start 'rails'

RSpec.configure do |config|

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random

end
