module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by id: session[:user_id]
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by id: user_id
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user? user
    current_user == user
  end

  def is_loged_in?
    current_user.present?
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def checked_admin
    return if current_user.is_admin?
    flash[:warning] = t "sessions.flash.not_admin"
  end
end
