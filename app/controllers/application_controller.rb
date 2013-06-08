class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize_user
  helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def authorize_user
	  redirect_to '/auth/github' unless current_user.present?
	end
end
