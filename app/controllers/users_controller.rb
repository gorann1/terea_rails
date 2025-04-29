class UsersController < ApplicationController
  def index
    redirect_to login_path unless authenticated?
  end
end
