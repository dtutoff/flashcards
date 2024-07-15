module Authentication
  extend ActiveSupport::Concern
  included do
    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
    end

    def user_signed_in?
      current_user.present?
    end

    def sing_in(user)
      session[:user_id] = user.id
    end

    def sing_out
      session.delete :user_id
    end

    def require_user_no_authentication
      return unless user_signed_in?

      redirect_to root_path
    end

    def require_user_has_authentication
      return if user_signed_in?

      redirect_to root_path
    end

    helper_method :current_user, :user_signed_in?
  end
end
