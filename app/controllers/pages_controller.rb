class PagesController < ApplicationController
  allow_unauthenticated_access only: :home
  def home
    redirect_to users_path if authenticated?
  end
end
