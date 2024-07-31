class SessionsController < ApplicationController
  before_action :require_user_no_authentication, only: %i[create]
  before_action :require_user_has_authentication, only: %i[destroy]

  def new
    redirect_to root_path if user_signed_in?
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sing_in user
      remember(user) if params[:remember_me] == '1'
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to new_session_path
    end
  end

  def destroy
    sing_out
    redirect_to root_path
  end
end
