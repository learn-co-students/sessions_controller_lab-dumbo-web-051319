class SessionsController < ApplicationController
  def new
  end

  def create
    # if !!params[:name]
    #   session[:name] = params[:name]
    #   redirect_to '/'
    # else
    #   redirect_to '/login'
    # end
    if !params[:name] || params[:name].empty?
      redirect_to controller: 'sessions', action: 'new'
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    session.delete :name
  end
end
