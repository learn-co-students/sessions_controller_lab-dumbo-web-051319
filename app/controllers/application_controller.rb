class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def hello
    if session[:username] == nil || session[:username] == ""
      redirect_to "/login"
    end
  end

end
