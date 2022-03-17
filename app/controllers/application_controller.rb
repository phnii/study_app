class ApplicationController < ActionController::Base

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?
  # rescue_from StandardError, with: :rescue500
  # rescue_from Forbidden, with: :rescue403
  # rescue_from IpAddressRejected, with: :rescue403
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  # rescue_from ActionController::RoutingError, with: :rescue404


  # private def rescue500(e)
  #   render "errors/internal_server_error", status: 500
  # end

  # private def rescue403(e)
  #   @exception = e
  #   render "errors/forbidden", status: 403
  # end

  # private def rescue404(e)
  #   render "errors/not_found", status: 404
  # end
end
