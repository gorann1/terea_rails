class ApplicationController < ActionController::Base
  include Authentication

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    sign_out_user # Example method that will destroy the user cookies
  end
end
