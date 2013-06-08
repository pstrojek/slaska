class SessionsController < ApplicationController

	def new
		redirect_to '/auth/github'
  end

	def create
		@user = User.find_or_create_from_auth_hash(auth_hash)
		session[:user_id] = @user.id
    redirect_to '/'
  end

  def delete
    session[:user_id] = nil
    redirect_to '/'
  end

	protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
