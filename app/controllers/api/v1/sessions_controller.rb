class Api::V1::SessionsController < ApiController
  respond_to :json
  skip_before_filter :api_session_token_authenticate!, only: [:create]

  def create
    token = current_api_session_token
    
    if params[:email]
      @user = User.find_by_email(params[:email])
      logger.debug "Creating a session with user #{@user}"
      token.user = @user if _provided_valid_password? || _provided_valid_api_key?
      logger.debug "Token set #{token}"
    end

    respond_with token
  end

  def show
    respond_with current_api_session_token
  end

  def destroy
    current_api_session_token.delete!

    render nothing: true, status: 204
  end

  private

  def _provided_valid_password?
    logger.debug "Try to use the user authentication service..."
    params[:password] && UserAuthenticationService.authenticate_with_password!(@user, params[:password])
  end

  def _provided_valid_api_key?
    params[:api_key] == 'foo key'
  end

  def api_session_token_url(token)
    api_v1_sessions_path(token)
  end

end