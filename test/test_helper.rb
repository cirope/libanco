ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  def assert_error model, attribute, type, options = {}
    assert model.errors[attribute].include?(
      model.errors.generate_message(attribute, type, options)
    )
  end
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def login user: users(:admin), account: accounts(:default)
    host! "#{account.subdomain}.lvh.me"
    sign_in user
  end
end

class ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper
end
