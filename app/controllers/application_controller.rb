class ApplicationController < ActionController::Base
  include GinaAuthentication::AppHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |_exception|
    if signed_in?
      flash[:error] = 'You do not have permission to view this page'
      redirect_to permission_denied_path
    else
      session[:redirect_back_to] = request.original_url
      redirect_to login_path
    end
  end
end
