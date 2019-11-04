class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  # use this method to restrict users from performing actions on other accounts outside of theirs
  helper_method :user_authorized
  def user_authorized
    return current_user && @user.id == current_user.id
  end
end
