module SessionsHelper

  def log_in(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def log_out
    return if current_user.nil?
    current_user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def current_user
    user_id = cookies.signed[:user_id]

    if @current_user
      @current_user
    elsif user_id
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

end
