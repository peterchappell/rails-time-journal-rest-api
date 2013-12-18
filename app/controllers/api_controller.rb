class ApiController < ApplicationController

  before_filter :api_session_token_authenticate!

  private

  def signed_in?
    !!current_api_session_token.user
  end

  def current_user
    current_api_session_token.user
  end

  def api_session_token_authenticate!
    logger.debug '### checking authentication'
    logger.debug "_authorization_header #{_authorization_header}"
    logger.debug "valid session token? #{current_api_session_token.valid?}"
    logger.debug "current user #{current_user}"
    return _not_authorized unless _authorization_header && current_api_session_token.valid? && current_user
  end

  def current_api_session_token
    @current_api_session_token ||= ApiSessionToken.new(_authorization_header)
  end

  def _authorization_header
    request.headers['HTTP_AUTHORIZATION']
  end

  def _not_authorized message = "Not Authorized"
    render json: {error: message}, status: 401
  end

  def _not_found message = "Not Found"
    _error message, 404
  end

  def _error message, status
    render json: { error: message }, status: status
  end

end

