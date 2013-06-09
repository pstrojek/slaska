
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'rspec/mocks/standalone'
require 'database_cleaner'
require 'mongoid-rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  include Mongoid::Matchers

  config.mock_with :rspec

  config.include FactoryGirl::Syntax::Methods
  config.infer_base_class_for_anonymous_controllers = false
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner.orm = 'mongoid'
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end


  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
end
