class SessionsController < ApplicationController

  def new
  end

  def create
    session[:name] = params[:name]
    if session[:name].nil? || session[:name].empty?
      redirect_to controller: 'sessions', action: 'new'
    else
      redirect_to '/'
    end
  end

  def destroy
    session.delete :name
  end

end
