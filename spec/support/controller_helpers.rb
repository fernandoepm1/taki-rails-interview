module ControllerHelpers
  # Method to login user in controller specs
  def login_as(user)
    request.session[:user_id] = user.id
  end
end
