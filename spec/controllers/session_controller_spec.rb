require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views
  describe 'post create' do
    # it 'redirects to the login page if :username is nil' do
    #   post :create
    #   expect(response).to redirect_to controller: 'sessions', action: 'new'
    # end
    #
    # it 'redirects to login page if :username is empty' do
    #   post :create, params: { username: '' }
    #   expect(response).to redirect_to controller: 'sessions', action: 'new'
    # end

    it 'sets session[:name] if :name was given' do
      me = 'Werner Brandes'
      post :create, params: { username: me }
      expect(@request.session[:username]).to eq me
    end

    it 'redirects to "/" if logged in' do
      me = 'Werner Brandes'
      post :create, params: { username: me }
      expect(response).to redirect_to('/')
    end


  end

  describe 'post destroy' do
    it 'leaves session[:username] nil if it was not set' do
      post :destroy
      expect(@request.session[:username]).to be nil
    end

    it 'clears session[:username] if it was set' do
      post :create, params: { username: 'Trinity' }
      expect(@request.session[:username]).not_to be nil
      post :destroy
      expect(@request.session[:username]).to be nil
    end
  end
end
