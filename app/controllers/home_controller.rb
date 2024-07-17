class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to info_path
    else
      redirect_to new_session_path
    end
  end

  def info

  end
end
