ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include AuthFeaturesHelper, type: :feature
  config.include GoalFeaturesHelper, type: :feature
  config.include CheerFeaturesHelper, type: :feature
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
