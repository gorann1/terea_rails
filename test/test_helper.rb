require "simplecov"
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers.
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def sign_in(user)
      user.sessions.create!(user_agent: "Rails Test", ip_address: "127.0.0.1").tap do |session|
        Current.session = session
        cookies[:session_id] = session.id if try(:cookies)
      end
    end


    # Add more helper methods to be used by all tests here...
  end
end
