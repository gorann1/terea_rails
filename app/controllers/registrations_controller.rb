class RegistrationsController < ApplicationController
  allow_unauthenticated_access
  before_action :resume_session, only: %i[new create]
  def new
    redirect_to root_url if authenticated?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Uspješno ste registrirani!"
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(user: [
      :first_name,
      :last_name,
      :mobile_number,
      :email_address,
      :password,
      :password_confirmation,
      :timezone
    ])
  end
end
