class UsersController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
    redirect_to new_session_path unless authenticated?
  end
end
