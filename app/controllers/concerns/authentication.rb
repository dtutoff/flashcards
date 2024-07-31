module Authentication
  extend ActiveSupport::Concern
  included do
    private

    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
      elsif (user_id = cookies.encrypted[:user_id])
        user = User.find_by(id: user_id)
        if user&.authenticated?(cookies[:remember_token])
          sing_in user
          @current_user = user
        end
      end
    end

    def user_signed_in?
      current_user.present?
    end

    def sing_in(user)
      session[:user_id] = user.id
    end

    def sing_out
      forget(current_user)
      session.delete :user_id
      @current_user = nil
    end

    def require_user_no_authentication
      return unless user_signed_in?

      redirect_to root_path
    end

    def require_user_has_authentication
      return if user_signed_in?

      redirect_to root_path
    end

    def remember(user)
      user.remember
      cookies.permanent.encrypted[:user_id] = user.id
      cookies.permanent.encrypted[:remember_token] = user.remember_token
    end

    def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end


    helper_method :current_user, :user_signed_in?, :remember
  end
end
