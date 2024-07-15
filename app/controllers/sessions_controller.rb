class SessionsController < ApplicationController

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sing_in user
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    sing_out
    redirect_to root_path
  end
end
