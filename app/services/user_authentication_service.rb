module UserAuthenticationService
  NotAuthorized = Class.new(Exception)
  
  module_function

  def authenticate_with_password(user, attempt)
    user && BCrypt::Password.new(user.password) == attempt
  end

  def authenticate_with_password!(*args)
    authenticate_with_password(*args) or raise NotAuthorized
  end
  
end