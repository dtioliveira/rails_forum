# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'shoulda/matchers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
end

def tax_by_date(date_time, quantity)
  tax = if date_time.to_date.sunday? || date_time.to_date.saturday?
    7
  else
    if date_time.beginning_of_hour.hour.in?(9..18)
      5
    else
      7
    end
  end
  return (quantity > 100) ? (tax + 10) : tax
end
