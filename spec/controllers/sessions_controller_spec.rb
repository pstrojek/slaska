require 'spec_helper'

describe SessionsController do

  context "#create" do
    before do
      request.env['omniauth.auth'] = {
        'provider' => 'rspec',
        'uid' => '12345678',
        'info' => {
          'name' => 'John Smith'
        }
      }
    end

    let!(:user) { create(:user) }

    it 'adds user_id to session params' do
      post :create
      session['user_id'].should == user.id
    end

    it 'redirects to root path' do
      post :create
      response.should redirect_to(root_path)
    end
  end

  context '#new' do
    it 'redirects to new path' do
      get :new
      response.should redirect_to('/auth/github')
    end
  end
end
