class SessionsController < ApplicationController
  def new

  end

  def create
    session[:username] = params[:username]
    redirect_to '/'
  end

  def destroy
    # byebug
    session.delete :username
    redirect_to '/'
  end

end
