class ApplicationController < ActionController::Base

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?

  TIMEOUT = 60.minutes

  private def check_timeout
    if current_user
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:user_id)
        flash.alert = "セッションがタイムアウトしました"
        redirect_to :login
      end
    end
  end

  private def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  helper_method :current_user
end
