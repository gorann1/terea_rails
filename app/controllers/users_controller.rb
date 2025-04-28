class UsersController < ApplicationController
  def index
    redirect_to new_session_path unless authenticated?
  end
end
